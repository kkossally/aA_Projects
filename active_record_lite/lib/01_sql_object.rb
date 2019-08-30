require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL)
      SELECT * FROM #{self.table_name}
    SQL
    .first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        attributes[column]
      end
      define_method("#{column}=") do |col_value|
        attributes[column] = col_value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= "#{self}".tableize
  end

  def self.all
    parse_all DBConnection.execute(<<-SQL)
      SELECT #{table_name}.* FROM #{table_name}
    SQL
  end

  def self.parse_all(results)
    results.map { |hash| self.new(hash) }
  end

  def self.find(id)
    found_object = DBConnection.execute(<<-SQL, id)
      SELECT #{table_name}.* FROM #{table_name}
      WHERE #{table_name}.id = ?
    SQL
    .first
    found_object.nil? ? nil : self.new(found_object)
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name)
      
      send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= Hash.new { |hash, key| hash[key] = nil }
  end

  def attribute_values
    self.class.columns.map do |column|
      self.send(column)
    end
  end

  def insert
    col_names = self.class.columns.drop(1)
    num_values = col_names.length
    question_marks = (["?"] * num_values).join(",")
    col_names = col_names.join(",")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO #{self.class.table_name}  (#{col_names})
      VALUES (#{question_marks})
    SQL

    primary_key = DBConnection.last_insert_row_id
    self.id = primary_key
  end

  def update
    attr_values = attribute_values
    primary_key = attr_values.shift(1)

    set_line = self.class.columns.drop(1)
    set_line.map! { |attr_name| "#{attr_name} = ?" }
    set_line = set_line.join(",")

    DBConnection.execute(<<-SQL, *attribute_values.rotate(1))
      UPDATE #{self.class.table_name}
      SET #{set_line}
      WHERE id = ?
    SQL
  end

  def save
    self.id.nil? ? self.insert : self.update
  end
end

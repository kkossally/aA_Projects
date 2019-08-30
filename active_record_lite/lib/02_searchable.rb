require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = params.keys.map { |key| "#{key} = ?" }
    where_line = where_line.join("AND ")

    results = DBConnection.execute(<<-SQL, *params.values)
      SELECT  #{self.table_name}.*
      FROM #{self.table_name}
      WHERE #{where_line}
    SQL

    results.map { |hash| self.new(hash) }
  end
end

class SQLObject
  extend Searchable
end

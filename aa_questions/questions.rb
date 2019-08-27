require 'sqlite3'
require 'singleton'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        users.id = ?
    SQL
    User.new(*data)
  end
  
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end


end

class Question
  attr_accessor :id, :title, :body
  attr_reader :user_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        questions.id = ?
    SQL
    Question.new(*data)
  end

  def initialize(options)
    @id, @title = options['id'], options['title']
    @body, @user_id = options['body'], options['user_id']
  end

end

class QuestionFollow
  attr_accessor :id
  attr_reader :user_id, :question_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_follows.id = ?
    SQL
    QuestionFollow.new(*data)
  end

  def initialize(options)
    @id  = options['id']
    @question_id, @user_id = options['question_id'], options['user_id']
  end
end

class Reply
  attr_accessor :id, :body
  attr_reader :question_id, :user_id, :parent_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.id = ?
    SQL
    Reply.new(*data)
  end

  def initialize(options)
    @id, @question_id = options['id'], options['question_id']
    @body, @user_id = options['body'], options['user_id']
    @parent_id = options['parent_id']
  end

end

class QuestionLike
  attr_accessor :id
  attr_reader :user_id, :question_id

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        question_likes.id = ?
    SQL
    QuestionLike.new(*data)
  end

  def initialize(options)
    @id, @question_id = options['id'], options['question_id']
    @user_id = options['user_id']
  end
end
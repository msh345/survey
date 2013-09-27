class User < ActiveRecord::Base
  validates_presence_of :password, :username
  validates_uniqueness_of :username
  has_many :survey_submissions
  has_many :question_responses, through: :survey_submissions
  has_many :surveys
  # has_many :questions, through: :surveys

  include BCrypt

  def password=(new_password)
    return nil if new_password == ""
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def password
    return nil unless password_digest
    @password ||= Password.new(password_digest)
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    return user if user && (user.password == password)
    nil
  end

end

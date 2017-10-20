class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :comments
  has_many :events_joined, through: :joins, source: :event
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :first_name, :last_name, :city, :state, presence: true
  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end
end

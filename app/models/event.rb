class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :joins
  has_many :users, through: :joins


  validates :name, :date, :city, :state, presence: true 
end

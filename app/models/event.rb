class Event < ActiveRecord::Base
  has_many :tasks
  has_many :locations
  has_and_belongs_to_many :users

  validates :title, presence: true
end

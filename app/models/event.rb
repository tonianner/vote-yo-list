class Event < ActiveRecord::Base
  has_many :tasks
  has_many :locations

  validates :title, presence: true
end

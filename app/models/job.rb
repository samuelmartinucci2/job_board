class Job < ActiveRecord::Base
  validates_presence_of :description, :title

  has_many :comments
end

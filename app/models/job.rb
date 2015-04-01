class Job < ActiveRecord::Base
  validates_presence_of :description, :title
  scope :most_recent, -> { order("created_at DESC") }
  has_many :comments
end

class Job < ActiveRecord::Base
  belongs_to :company
  has_many :comments

  validates_presence_of :description, :title, :company_id
  scope :most_recent, -> { order("created_at DESC") }

end

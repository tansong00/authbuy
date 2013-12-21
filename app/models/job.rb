class Job < ActiveRecord::Base
  paginates_per 5
  validates :title,  :presence => true
end

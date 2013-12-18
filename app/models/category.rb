class Category < ActiveRecord::Base
  paginates_per 3
  validates :name,  :presence => true,
                    :uniqueness => true,
                    :length => {:minimum => 1, :maximum => 4}

end

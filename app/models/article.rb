class Article < ActiveRecord::Base
  paginates_per 7

  has_attached_file :photo, :styles => { :small => '40*40' , :middle => '160*160' , :large => '320*320'},
                    :url  => "/assets/articles/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  validates :title,   :presence => true
  validates :type_id, :presence => true
  validates :content, :presence => true

end

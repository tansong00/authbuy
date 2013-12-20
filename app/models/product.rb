class Product < ActiveRecord::Base

  paginates_per 16

  has_attached_file :photo, :styles => { :small => '40*40' , :middle => '160*160' , :large => '320*320'},
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  validates :title,         :presence => true
  validates :category_id,   :presence => true
  validates :price,  :presence =>  true,
                     :numericality => true
  validates :description, :presence => true,
                          :length => {:minimum => 1,:maximum => 100}


end

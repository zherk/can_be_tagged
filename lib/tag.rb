class Tag < ActiveRecord::Base
  has_many :tag_lines, :dependent => :destroy
  has_many :taggables, :through => :tag_lines

  cattr_accessor :delimiter
  self.delimiter = ','
  
  def self.create_from_listing(listing)  
    tags_names = listing.split(delimiter)
    tags_list = Array.new
    tags_names.each do |tag_name|
      tags_list << Tag.find_or_create_by_name(tag_name)
    end
    tags_list
  end
end

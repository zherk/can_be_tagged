class Tag < ActiveRecord::Base
  has_many :tag_lines, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name

  cattr_accessor :delimiter
  self.delimiter = ','
  
  def to_s
    name
  end
  
  def self.create_from_listing(listing)  
    tags_names = listing.split(delimiter)
    tags_list = Array.new
    tags_names.each do |tag_name|
      tags_list << Tag.find_or_create_by_name(tag_name)
    end
    tags_list
  end
end

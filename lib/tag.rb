class Tag < ActiveRecord::Base
  has_many :tag_lines, :dependent => :destroy

  cattr_accessor :delimiter
  self.delimiter = ','
  
  def self.create_from_listing(listing)

    tags_names = listing.split(delimiter)
    tags_list = Array.new
    tags_names.each do |tag_name|
      tags_list << Tag.new(:name => tag_name)
    end
    tags_list
  end
end

class Tag < ActiveRecord::Base

  cattr_accessor :delimiter
  self.delimiter = ','
  
  def self.create_from_listing(listing)

    tags_names = listing.split(delimiter)
    Tag tags_list = {}
    tags_names.each do |tag_name|
      tag_list << Tag.new(:name => tag_name)
    end
    tags_list
  end
end

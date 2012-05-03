require 'tag'
require 'tag_line'
require 'tags_helper'

module CanBeTagged
  module Taggable  
    extend ActiveSupport::Concern
    
    included do
    end
    
    module ClassMethods
      def can_be_tagged(options = {})
        has_many :tags, :through => :tag_lines, :uniq => true
        has_many :tag_lines, :as => :taggable, :include => :tag       

        scope :tagged_as, lambda {|tag_name|
          joins(:tags).where(:"tags.name" => tag_name)
        }
      end
    end
     
    def add_tag(tag_name)
      tags << Tag.find_or_create_by_name(tag_name.strip)
    end
    
  end
  
  module TaggableController
    def from_tags_listing(tags_listing)
      tags_list = Array.new
      if tags_listing
        tags_names = tags_listing.split(TagsHelper::DELIMITER.strip)        
        tags_names.each do |tag_name|
          tags_list <<  Tag.find_or_initialize_by_name(tag_name.strip)
        end
      end
      tags_list
    end
  end
end
ActiveRecord::Base.send :include, CanBeTagged::Taggable
ActionController::Base.send :include, CanBeTagged::TaggableController

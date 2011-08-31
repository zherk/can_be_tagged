require 'tag'
require 'tag_line'

module CanBeTagged
  module Taggable  
    extend ActiveSupport::Concern
    
    included do
    end
    
    module ClassMethods
      def can_be_tagged(options = {})
        has_many :tags, :through => :tag_lines
        has_many :tag_lines, :as => :taggable, :include => :tag       
      end
    end

    module InstanceMethods    
      def tags_listing=(tags_listing)
        tags_list = Tag.create_from_listing(tags_listing)                
        tags_list.each do |tag|
          tags << tag
        end
        write_attribute :tags, tags
      end
      
      def tags_listing
        tags= read_attribute :tags
        tags ? tags.map(&:name).join(',') : ""
      end
    end
  end
end
ActiveRecord::Base.send :include, CanBeTagged::Taggable

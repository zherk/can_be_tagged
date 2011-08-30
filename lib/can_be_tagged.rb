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
    
    def tags_listing=(tags_listing)
      tags = Tag.create_from_listing(tags_listing)
    end

    def tags_listing
      tags.to_s
    end
  end
end
ActiveRecord::Base.send :include, CanBeTagged::Taggable

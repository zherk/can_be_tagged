require 'tag'

module Taggable
  module CanBeTagged
    extend ActiveSupport::Concern
    
    included do
    end
    
    module ClassMethods
      def can_be_tagged(options = {})
        has_many :tags, :through => :tag_line
      end
    end
    
    def tags_listing=(tags_listing)
      tags = Tag.create_from_listing(tags_listing)
    end
  end
end
ActiveRecord::Base.send :include, Taggable::CanBeTagged

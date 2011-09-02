module TagsHelper
  def to_listing(tags)
    tags.blank? tags.map(&:name).join(', ')
  end
end

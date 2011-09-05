module TagsHelper

  DELIMITER = ", "

  def to_tags_listing(tags)
     tags.map(&:name).join(DELIMITER) unless tags.blank?
  end

  def to_tags_links_listing(tags)
    tags.each do |tag|
      link_to 
    end
  end
end

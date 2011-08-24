require 'test_helper'

class CanBeTaggedTest < ActiveSupport::TestCase
  test "get_tag_list" do
    news = News.new
    news.tags_listing = "lay, yellow"
    assert_equal "lay, yellow",  news.tag_listing
  end
end

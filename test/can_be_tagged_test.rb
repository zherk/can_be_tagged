require 'test_helper'

class CanBeTaggedTest < ActiveSupport::TestCase
  test "get_tag_list" do
    news = News.new
    news.tags_listing = "lay, yellow"
    assert_equal "lay, yellow",  news.tags_listing
  end

  test "create_model_with_tag" do
    news = News.new
    news.title = "test1"
    news.tags_listing = "lay, yellow"
    news.save
    
    news = News.find_by_title "test1"
    assert_equal "lay, yellow", news.tags_listing
  end
end

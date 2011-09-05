require 'test_helper'
require 'tags_helper'
require 'can_be_tagged'

class CanBeTaggedTest < ActiveSupport::TestCase

  include TagsHelper
  include CanBeTagged::TaggableController

  test "create_model_with_tag" do
    news = News.new
    news.title = "test1"
    news.add_tag("lay")
    news.add_tag("yellow")
    news.save
    
    news = News.find_by_title "test1"
    assert_equal 2, news.tags.count
    assert_equal "lay, yellow", to_tags_listing(news.tags)    

    assert_equal 1, News.tagged_as("lay").count
  end

  test "create_two_models_with_same_tag" do
    news = News.new
    news.title = "test1"
    news.add_tag("lay")
    news.add_tag("yellow")
    news.save

    comment = Comment.new
    comment.title = "test_comment_1"
    comment.add_tag("lay")
    comment.add_tag("invented")
    comment.save
    
    assert_equal 1, News.tagged_as("lay").count
    assert_equal 1, Comment.tagged_as("lay").count

    assert_equal 1, Tag.find_all_by_name("lay").count
  end

  test "create_model_with_tag_using_listing" do
    news = News.new
    news.title = "test1"
    tags = from_tags_listing("lay, yellow")
    news.tags << tags
    news.save
    
    news = News.find_by_title "test1"
    assert_equal 2, news.tags.count
    assert_equal "lay, yellow", to_tags_listing(news.tags)    

    assert_equal 1, News.tagged_as("lay").count
  end

end

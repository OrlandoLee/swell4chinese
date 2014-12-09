require 'test_helper'

class PodcastTest < ActiveSupport::TestCase
    def setup
      Podcast.destroy_all
    end
    
    def test_my_search__one_keyword
      podcast = Podcast.new
      podcast.title = 'new title'
      podcast.keywords = 'new keyword'
      podcast.save
      
      podcast = Podcast.new
      podcast.title = 'second title'
      podcast.keywords = 'new keyword'
      podcast.save
      
      Podcast.reindex
      result = Podcast.new.my_search([{'new' => 1}])
      assert_equal 2, result.size
      assert_equal ['new title', 'second title'], result.map(&:title)
    end
  
end

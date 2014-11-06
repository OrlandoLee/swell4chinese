class Podcast < ActiveRecord::Base
  attr_accessible :keywords, :link, :title
  searchable do
    text :title, :keywords
    time :created_at
    time :updated_at
  end

  #text should be like [{'keyword1' => 1},{{'keyword2' => 3}}]
  def self.my_search(text)
    temp_result = self.search do
      text.first do |pair| #should be each
        fulltext pair.keys.first do
          fields :keywords => pair.values.first, :title => pair.values.first
        end
      end
    end
    result = []
    temp_result.hits.each do |hit|
      result << hit.result
    end
    result
  end
end

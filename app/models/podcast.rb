class Podcast < ActiveRecord::Base
  attr_accessible :keywords, :link, :title
  searchable do
    text :title, :keywords
    time :created_at
    time :updated_at
  end

  #text should be like [{'keyword1' => 1},{{'keyword2' => 3}}]
  #must be an array
  def my_search(text)
    temp_result = search_in_model(text)
    format(temp_result)
  end
  
private
  def construct_search_string(text)
    serach_string = ''
    text.each do |pair|
      pair.values.first.times do
        serach_string += ' '+pair.keys.first
      end
    end
    serach_string
  end
  
  def search_in_model(text)
    temp_result = self.class.search do
      search_string = construct_search_string(text)
      fulltext search_string do
        fields :keywords, :title
      end
      order_by :score, :desc
    end
    temp_result 
  end
  
  def format(temp_result)
    result = []
    temp_result.hits.each do |hit|
      result << hit.result
    end 
    result
  end
end

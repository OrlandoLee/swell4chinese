class Podcast < ActiveRecord::Base
  attr_accessible :keywords, :link, :title
  searchable do
    text :title, :keywords
    time :created_at
    time :updated_at
  end
end

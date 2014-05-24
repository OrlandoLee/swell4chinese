class Query < ActiveRecord::Base
  attr_accessible :count, :keyword_id, :user_id
  #belongs_to :user
  has_one :keyword
end

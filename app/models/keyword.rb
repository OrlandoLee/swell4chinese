class Keyword < ActiveRecord::Base
  attr_accessible :keyword
#  belongs_to :query
  has_many :queries
end

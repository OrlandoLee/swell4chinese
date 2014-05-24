class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   attr_accessible  :email, :password, :password_confirmation
   has_many :queries
   
   def self.construct_query
     query = User.first.queries
     query_string = ""
     query.each do |q|
       keyword_id = q.keyword_id
       keyword = Keyword.find(keyword_id).keyword
       count = q.count
       query_string += "keyword: "+keyword+" count:"+count.to_s
     end
     query_string
   end
end

class Post < ApplicationRecord
  validates_presence_of :title, :content, :user_id
end

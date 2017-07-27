class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :magic
  
  validates :content, presence: true, length: { minimum: 5, maximimum: 1000 }
end

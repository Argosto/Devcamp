class Magic < ApplicationRecord
<<<<<<< HEAD
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body
  
  belongs_to :topic
=======
  enum status: { draft: 0, published: 1 } 
  extend FriendlyId
  friendly_id :title, use: :slugged
>>>>>>> 1f744e7cbeeee636526d8db37729816fa5f1c832
end

class Topic < ApplicationRecord
  validates_presence_of :title
  
  has_many :magics
  
  def self.with_blogs
    includes(:magics).where.not(magics: { id: nil })
  end
end

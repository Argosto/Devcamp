class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image
  
  def self.angular
    where(subtitle:'Angular')
  end
  
  scope :ruby_port_string, -> {where(subtitle:'Ruby on Rails')}
  
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||='http://placehold.it/800x600'
    self.thumb_image ||='http://placehold.it/200x100'
  end
end
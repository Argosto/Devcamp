class Portfolio < ApplicationRecord
  validates_presence_of :subtitle, :body, :main_image, :thumb_image
end

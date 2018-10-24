class Memoriam < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :image
  validates_presence_of :born
  validates_presence_of :died
  validates_presence_of :obit

  mount_uploader :image, ImageUploader
end

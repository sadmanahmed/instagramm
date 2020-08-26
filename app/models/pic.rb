class Pic < ApplicationRecord
  belongs_to :user
  include ImageUploader::Attachment(:image)

  validates :title,presence: true

end

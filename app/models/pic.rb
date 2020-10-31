class Pic < ApplicationRecord
  acts_as_votable
  belongs_to :user
  include ImageUploader::Attachment(:image)

  validates :title,presence: true

end

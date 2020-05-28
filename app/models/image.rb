class Image < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :comments, dependent: :destroy
  mount_uploader :picture, PictureUploader



  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end


end

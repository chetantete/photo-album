class Album < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :photos,  dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
  validate :max_photos, on: [:create, :update]

  def max_photos
    if self.photos.length > 25
      self.errors.add(:base, "please upload less than 25 photos")
    end
  end

end

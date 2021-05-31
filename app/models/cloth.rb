class Cloth < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :user_id, presence: true
  validates :category_id, presence: true

  has_one_attached :image

  def thumbnail
    if self.image.attached?
      self.image.variant(combine_options:{gravity: :center, resize:"100x100^",crop:"100x100+0+0"}).processed
    else
      '/assets/pui.jpg'
    end
  end
end

class User < ApplicationRecord
    has_many :cloths, dependent: :destroy

    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    has_secure_password
    has_one_attached :image

    def thumbnail
        if self.image.attached?
            self.image.variant(combine_options:{gravity: :center, resize:"100x100^",crop:"100x100+0+0"}).processed
        else
            '/assets/pui.jpg'
        end
    end
end

class User < ApplicationRecord
  before_save :lowercase_email

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, 
    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  private

    def lowercase_email
      self.email.downcase!
    end

end

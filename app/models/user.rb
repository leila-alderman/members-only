class User < ApplicationRecord
  before_save :lowercase_email
  before_create :generate_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, 
    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def generate_remember_token
    remember_token = SecureRandom.urlsafe_base64
    self.remember_digest = Digest::SHA1.hexdigest(remember_token)
  end

  private

    def lowercase_email
      self.email.downcase!
    end

end

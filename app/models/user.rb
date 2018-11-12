class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :email, type: String
  field :password_digest, type: String
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  has_secure_password
end

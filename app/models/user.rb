class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :lockable,
         jwt_revocation_strategy: JwtBlacklist

  validates :username, uniqueness: true
end

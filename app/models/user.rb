class User < ApplicationRecord
  require 'securerandom'
  has_secure_password


  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w[user admin] }
end

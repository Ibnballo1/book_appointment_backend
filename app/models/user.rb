class User < ApplicationRecord
  require 'securerandom'

  before_validation :assign_admin_role, on: :create

  has_secure_password

  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w[user admin] }

  private

  def assign_admin_role
    self.role = 'admin' if [1, 2].include?(user_id)
  end
end

class User < ApplicationRecord
  # It's preferable to have callbacks on methods than blocks
  # Either this
  before_save :downcase_email!
  # Or this
  before_save :downcase_email

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }

  # constants should always be frozen
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    # This validation doesn't make much sense:
                    # - An email can't be 3 caracters long
                    # - No need to specify maximum length, db takes care of that
                    length: { minimum: 3, maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :dolists, dependent: :destroy

  # This method isn't being used
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # This is fine, but there are a few alternatives
  # 1. has_many :lists, class_name: 'Dolist', dependent: :destroy
  # 2. has_many :dolists, dependent: :destroy
  #    alias lists dolists
  def lists
    dolists
  end

  private

  def downcase_email!
    email.downcase!
  end

  def downcase_email
    self.email = email.downcase
  end
end

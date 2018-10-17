class User < ActiveRecord::Base

  attr_accessor :remember_token
  # before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username,  length: { maximum: 50 }, uniqueness: true, format: { :with => /\A[a-z0-9.]*\Z/, message: "must be lowercase alphanumerics (Please call admin for assistance)" }
  validates :email, uniqueness: { case_sensitive: false}
  validates :password, presence: true
  # validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  # validates :password, length: {minimum:6, maximum: 50 }
  has_one :cost_centres
  has_one :directorate
  has_secure_password

  def email
    # @email ||= self[:username] << "@pgn-solution.co.id"
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
	  update_attribute(:remember_digest, User.digest(remember_token))
  end

  def User.digest(string)
	  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	  BCrypt::Engine.cost
	  BCrypt::Password.create(string, cost: cost)
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
  	BCrypt::Password.new(remember_digest).is_password?(remember_token) 
  end

  # Forgets a user.
  def forget
	  update_attribute(:remember_digest, nil)
  end

  def is?( requested_role )
    self.role == requested_role.to_s
  end

end

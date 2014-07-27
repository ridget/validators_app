class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Devise Validators
  validates_presence_of :email, :if => :email_required?

  validates_uniqueness_of :email, :allow_blank => true, :if => :email_changed?

  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :allow_blank => true, :if => :email_changed?

  validates_presence_of :password, :if => Proc.new { |r| r.password_required? }

  # custom validator
  validates_confirmation_of :password, :if => :password_required?

  # password_length set by devise in configuration settings min is 8 characters
  validates_length_of :password, :within => password_length, :allow_blank => true

  has_one :profile

end

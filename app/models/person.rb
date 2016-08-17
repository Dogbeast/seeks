class Person < ActiveRecord::Base
	has_many :secret2s
	has_many :like2s, dependent: :destroy
	has_many :secret2s_liked, through: :likes, source: :secret2
  	has_secure_password
  	validates :name, :email, presence: true
  	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  	validates :email, uniqueness: { :case_sensitive => false }
end

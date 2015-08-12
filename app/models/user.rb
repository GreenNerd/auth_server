class User < ActiveRecord::Base
  has_secure_password

  has_many :attendances

  validates :mac_addr, uniqueness: true
end

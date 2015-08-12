class User < ActiveRecord::Base
  has_secure_password

  validates :mac_addr, uniqueness: true
end

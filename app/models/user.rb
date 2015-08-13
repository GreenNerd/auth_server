class User < ActiveRecord::Base
  has_secure_password

  has_many :attendances, dependent: :destroy

  validates :mac_addr, uniqueness: true, allow_nil: true
end

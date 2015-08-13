class User < ActiveRecord::Base
  has_secure_password

  has_many :attendances, dependent: :destroy
  belongs_to :router

  validates :mac_addr, uniqueness: true, allow_nil: true

  def admin?
    router.admin_ids.include?(id)
  end
end

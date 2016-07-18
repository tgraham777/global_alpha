class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true

  enum role: %w(default admin)

  def to_param
    display_name
  end
end

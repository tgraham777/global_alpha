class Country < ActiveRecord::Base
  has_many :country_tags, dependent: :delete_all
  has_many :tags, through: :country_tags

  validates :name, presence: true, uniqueness: true

  def to_param
    name
  end
end

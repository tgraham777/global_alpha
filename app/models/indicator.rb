class Indicator < ActiveRecord::Base
  has_many :indicator_tags, dependent: :delete_all
  has_many :tags, through: :indicator_tags

  validates :name, presence: true, uniqueness: true

  def to_param
    name
  end
end

class Preview < ActiveRecord::Base
  has_many :preview_tags
  has_many :tags, through: :preview_tags

  validates :name, presence: true, uniqueness: true

  def to_param
    name
  end
end

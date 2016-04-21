class Preview < ActiveRecord::Base
  has_many :preview_tags, dependent: :delete_all
  has_many :tags, through: :preview_tags

  validates :name, presence: true, uniqueness: true

  def to_param
    name.split(" ").join("-")
  end
end

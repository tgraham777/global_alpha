class Preview < ActiveRecord::Base
  has_many :preview_tags, dependent: :delete_all
  has_many :tags, through: :preview_tags

  validates :title, presence: true, uniqueness: true
  validates_presence_of :report_date

  def to_param
    display_name
  end
end

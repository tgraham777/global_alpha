class Description < ActiveRecord::Base
  belongs_to :topic
  belongs_to :visual
end

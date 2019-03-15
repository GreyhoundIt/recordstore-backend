class Record < ApplicationRecord
  belongs_to :users
  
  validates :title, :year, presence: true
end

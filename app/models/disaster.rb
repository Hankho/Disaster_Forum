class Disaster < ApplicationRecord
	validates_presence_of :category, :title
	has_many :messages
	belongs_to :user
end

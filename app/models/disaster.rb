class Disaster < ApplicationRecord
	validates_presence_of :title
	has_many :messages, dependent: :destroy
	belongs_to :user
	has_many :disaster_groupships
	has_many :groups, :through => :disaster_groupships
end

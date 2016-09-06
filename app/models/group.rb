class Group < ApplicationRecord
	has_many :disaster_groupships
	has_many :disasters, :through => :disaster_groupships
end

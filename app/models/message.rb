class Message < ApplicationRecord
	validates_presence_of :message
	belongs_to :disaster
end

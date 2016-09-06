class DisasterGroupship < ApplicationRecord
	belongs_to :disaster
	belongs_to :group
end

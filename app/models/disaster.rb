class Disaster < ApplicationRecord
	validates_presence_of :title
	has_many :messages, dependent: :destroy
	belongs_to :user
	has_many :disaster_groupships
	has_many :groups, :through => :disaster_groupships
	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end

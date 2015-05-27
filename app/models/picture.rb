class Picture < ActiveRecord::Base

	belongs_to :user
	mount_uploader :photosphere, PhotosphereUploader

	validates :name, :presence => true
	validates :user_id, :presence => true

end

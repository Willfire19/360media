class CreateThumbnailVersions < ActiveRecord::Migration
  def change
    
  	Picture.find_each do |picture|
  		picture.photosphere.recreate_versions! if picture.photosphere?
  	end

  end
end

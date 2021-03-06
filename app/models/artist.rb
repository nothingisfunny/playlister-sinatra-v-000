class Artist < ActiveRecord::Base
	has_many :genres, through: :songs
	has_many :songs
	def slug
		self.name.downcase.gsub(" ", "-")
	end
	def self.find_by_slug(slug)
		name = slug.gsub("-", " ")
		id = nil
		Artist.all.each do |song|
			if song.name.downcase == name
				return Artist.find(song.id)
			end
		end
	end
end
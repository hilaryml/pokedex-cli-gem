class Pokemon

	attr_accessor :number, :name, :type, :entry_url, :physiology, :natural_abilities, :behavior, :habitat

	@@all = []

	def initialize(each_pokemon_hash)

	end

	def self.create_from_collection(all_pokemon_array)

	end

	def add_pokemon_attributes(entry_hash)

	end

	def self.all
		@@all
	end

end
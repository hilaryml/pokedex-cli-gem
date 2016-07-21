class Pokedex::Pokemon

	attr_accessor :number, :name, :type, :entry_url, :physiology, :natural_abilities, :behavior, :habitat

	@@all = []

	def initialize(pokemon_hash)
		pokemon_hash.each {|key, value| self.send(("#{key}="), value)}
		@@all << self
	end

	def self.create_from_collection(pokemon_array)
		pokemon_array.each{|hash| self.new(hash)}
	end

	def add_pokemon_attributes(entry_hash)
		entry_hash.each {|key, value| self.send(("#{key}="), value)}
	end

	def self.all
		@@all
	end

end
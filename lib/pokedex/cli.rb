require_relative "../pokedex/version.rb"
require_relative "../pokedex/pokemon.rb"
require 'nokogiri'

class Pokedex::CLI

	def call
		puts "Gen 1 Pokemon"
		list_pokemon
		menu
		bye
	end

	def list_pokemon
		puts "1. Bulbasaur - Grass - Poison
2. Ivysaur - Grass - Poison
3. Venosaur - Grass - Poison
4. Charazard - Fire"
	end

end

#to-do: use nokogiri and open-uri to scrape pages for attributes and save in array of hashes
#each hash will represent the info for a pokemon
#Will only be printing values for main attributes, keys and values for other
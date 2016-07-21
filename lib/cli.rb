require_relative "../pokedex/version.rb"
require_relative "../pokedex/pokemon.rb"
require 'nokogiri'

class Pokedex::CLI

	def call
		puts "GEN 1 POKEMON"
		puts "----------------------------"
		list_pokemon
		menu
		bye
	end

	def create_pokemon
		pokemon_array = Scraper.scrape_pokemon_index
		Pokemon.create_from_collection(pokemon_array)
	end

	def add_attributes_to_pokemon
		Pokemon.all.each {|pokemon|
			attributes = Scraper.scrape_pokedex_entry(pokemon.entry_url)
			pokemon.add_pokemon_attributes(attributes)
		}
	end

	def list_pokemon

		Pokemon.all.each {|pokemon| puts "#{pokemon.number} - #{pokemon.name.upcase} - #{pokemon.type}" }
		
		puts "----------------------------"

		# GEN 1 POKEMON
		#----------------------------
		#1 - BULBASAUR - Grass Poison
		#2 - IVYSAUR - Grass Poison
		#3 - VENOSAUR - Grass Poison

	end

	def menu
		puts "Which Pokemon would you like to know more about? (number) Type 'exit' to leave the program."
		input = nil
		while input != "exit"
			puts "Type the number of the Pokemon that you would like to know more about. Type 'list' to see the Pokemon again. Type 'exit' to leave the program."
			input = gets.strip.downcase
		
			case input
			when "1"
				puts "Bulbasaur info"
			when "2"
				puts "Ivysaur info"
			when "3"
				puts "Venosaur info"
			when "4"
				puts "Charazard info"
			when "list"
				list_pokemon
			else
				puts "Invalid entry. Try again."
			end
		end
	end

	def bye
		puts "Good luck, Pokemon Trainer!"
	end
	
end

#to-do: use nokogiri and open-uri to scrape pages for attributes and save in array of hashes
#each hash will represent the info for a pokemon
#Will only be printing values for main attributes, keys and values for other
#figure out supplying each pokemon's entry_url to the scraper method
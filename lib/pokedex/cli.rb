class Pokedex::CLI

	def call
		create_pokemon
		add_attributes_to_pokemon
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

		Pokemon.all.each {|pokemon| 
			puts "GEN 1 POKEMON"
			puts "----------------------------"
			puts "#{pokemon.number} - #{pokemon.name.upcase} - #{pokemon.type}" 
		}
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
		
			
			#have to iterate through array of pokemon hashes, and find the one that has a num
			#matching the input OR take the hash at input -1 index of array - then print out entry values.
			Pokemon.all.each {|pokemon|
			case input
			when Pokemon.all[input - 1]
				puts "Pokedex Entry for #{pokemon.name}"
				puts "---------------------------------"
				puts "Physiology: #{pokemon.physiology}"
				puts "Biology: #{pokemon.biology}"
				puts "Natural Abilities: #{pokemon.natural_abilities}"
				puts "Behavior: #{pokemon.behavior}"
				puts "Habitat: #{pokemon.habitat}"
				puts "---------------------------------" 
			when "list"
				list_pokemon
			else
				puts "Invalid entry. Try again."
			end
			}
		end
	end

	def bye
		puts "Good luck, Pokemon Trainer!"
	end
	
end

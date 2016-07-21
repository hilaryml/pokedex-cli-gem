class Pokedex::CLI

	def call
		create_pokemon
		add_attributes_to_pokemon
		list_pokemon
		menu
		bye
	end

	def create_pokemon
		pokemon_array = Pokedex::Scraper.new.scrape_pokemon_index
		Pokedex::Pokemon.create_from_collection(pokemon_array)
	end

	def add_attributes_to_pokemon
		Pokedex::Pokemon.all.each {|pokemon|
			attributes = Pokedex::Scraper.new.scrape_pokedex_entry(pokemon.entry_url)
			pokemon.add_pokemon_attributes(attributes)
		}
	end

	def list_pokemon
		puts "GEN 1 POKEMON"
		puts "----------------------------"
		Pokedex::Pokemon.all.each {|pokemon| puts "#{pokemon.number} - #{pokemon.name.upcase} - #{pokemon.type}"}
		puts "----------------------------"
	end

	def menu
		puts "Which Pokemon would you like to know more about? (number) Type 'exit' to leave the program."
		input = nil
		while input != "exit"
			puts "Type the number of the Pokemon that you would like to know more about. Type 'list' to see the Pokemon again. Type 'exit' to leave the program."
			input = gets.strip.downcase
		
			Pokedex::Pokemon.all.each {|pokemon|
			case input
		
			when "list"
				list_pokemon
			when Pokedex::Pokemon.all[input.to_i - 1]
				puts "Pokedex Entry for #{pokemon.name}"
				puts "---------------------------------"
				puts "Physiology: #{pokemon.physiology}"
				puts "Biology: #{pokemon.biology}"
				puts "Natural Abilities: #{pokemon.natural_abilities}"
				puts "Behavior: #{pokemon.behavior}"
				puts "Habitat: #{pokemon.habitat}"
				puts "---------------------------------" 
			end
			}
		end
	end

	def bye
		puts "Good luck, Pokemon Trainer!"
	end
	
end

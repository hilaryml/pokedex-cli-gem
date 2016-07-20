require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

	def scrape_pokemon_index
		doc = Nokogiri::HTML(open("http://pokemon.wikia.com/wiki/Category:Generation_I_Pok%C3%A9mon"))
		binding.pry
		all_pokemon_array = []

		doc.css().each {|pokemon|
			each_pokemon_hash = {number: ,
			name: ,
			type:
			}
			all_pokemon_array << each_pokemon_hash
		}
		all_pokemon_array

	end

	def scrape_pokedex_entry(entry_url)

		entry = Nokogiri::HTML(open(entry_url))

		entry_hash = {}

		entry.css().each {|category|
			case category

			when "Physiology"
				entry_hash[:physiology] = 
			when "Natural Abilities"
				entry_hash[:natural_abilities] =
			when "Behaviour"
				entry_hash[:behaviour] = 
			when "Habitat"
				entry_hash[:habitat] =
			when "Evolution"
				entry_hash[:evolution] =
			end
		}
		entry_hash
	end

end

Scraper.new.scrape_pokemon_index
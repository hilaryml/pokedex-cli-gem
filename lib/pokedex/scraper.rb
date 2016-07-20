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

end
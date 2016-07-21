class Pokedex::Scraper

	def scrape_pokemon_index

		doc = Nokogiri::HTML(open("http://pokemon.wikia.com/wiki/Category:Generation_I_Pok%C3%A9mon"))
		#binding.pry
		all_pokemon_array = []
		count = 0
		doc.css("div.lightbox-caption a").each {|pokemon|
			
			each_pokemon_hash = {number: count + 1,
			name: pokemon.attribute("title").text,
			type: pokemon.css("span").text}
			entry_url: "http://pokemon.wikia.com#{pokemon.attribute("href").text}"
			}
			all_pokemon_array << each_pokemon_hash
			count += 1
		}
		all_pokemon_array

	end

	def scrape_pokedex_entry(entry_url)

		entry = Nokogiri::HTML(open(entry_url))
		#binding.pry
		entry_hash = {}
		
		entry.css("h3").each_with_index {|section, index|
		section = section.text

		case section

		when "Physiology"
			entry_hash[:physiology] = entry.css("h3~p")[index].text
		when "Natural Abilities"
			entry_hash[:natural_abilities] = entry.css("h3~p")[index].text
		when "Behavior"
			entry_hash[:behavior] = entry.css("h3~p")[index].text
		when "Habitat"
			entry_hash[:habitat] = entry.css("h3~p")[index].text
		end
		
		}
		entry_hash
	end

end

#Scraper.new.scrape_pokemon_index
#Scraper.new.scrape_pokedex_entry("http://pokemon.wikia.com/wiki/Bulbasaur")



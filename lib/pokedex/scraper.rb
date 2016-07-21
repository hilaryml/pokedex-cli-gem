class Pokedex::Scraper

	def scrape_pokemon_index

		doc = Nokogiri::HTML(open("http://pokemon.wikia.com/wiki/Category:Generation_I_Pok%C3%A9mon"))
		
		all_pokemon_array = []
		count = 0
		each_pokemon_hash = {}
		doc.css("div.lightbox-caption").each {|pokemon|
			
			each_pokemon_hash = {number: count + 1,
			name: pokemon.css("a").attribute("title").text,
			type: pokemon.css("a span").text,
			entry_url: "http://pokemon.wikia.com#{pokemon.css("a").attribute("href").text}"
			}
			
			all_pokemon_array << each_pokemon_hash
			count += 1
		}
		all_pokemon_array

	end

	def scrape_pokedex_entry(entry_url)

		entry = Nokogiri::HTML(open(entry_url))
		
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



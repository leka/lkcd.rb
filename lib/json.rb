require 'json'

def json()

	file = open("./json/#{$language}.#{$curriculum}.json")
	json = file.read

	parsed = JSON.parse(json)

	parsed["lessons"].each do |lesson|
		puts "#{lesson["name"]} - #{lesson["description"]}"
	end

end

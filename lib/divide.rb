def divide()

	data = File.read("#{$output_dir}/#{$language}.#{$curriculum}.md")
	results = data.scan($globalRegex)

	puts "Dividing #{$output_dir}/#{$language}.#{$curriculum}.md into:\n\n"

	for result in results do

		fileName = result[0].scan($nameRegex)[0]
		content = result[0].scan($contentRegex)[0][0]

		puts "- #{$lesson_dir}/#{$language}/#{fileName.to_s}"

		File.open("#{$lesson_dir}/#{$language}/#{fileName.to_s}", 'w') { |file| file.write(content) }

	end

end

def divide(language, curriculum)

	data = File.read("#{LKDir::OUTPUT_DIR}/#{language}.#{curriculum}.md")
	results = data.scan(LKRegexp::GLOBAL)

	puts "Dividing #{LKDir::OUTPUT_DIR}/#{language}.#{curriculum}.md into:\n\n"

	for result in results do

		fileName = result[0].scan(LKRegexp::NAME)[0]
		content = result[0].scan(LKRegexp::CONTENT)[0][0]

		puts "- #{LKDir::LESSON_DIR}/#{language}/#{fileName.to_s}"

		File.open("#{LKDir::LESSON_DIR}/#{language}/#{fileName.to_s}", 'w') { |file| file.write(content) }

	end

end

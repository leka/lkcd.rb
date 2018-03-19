def combine()

	unless File.directory?($output_dir)
		FileUtils.mkdir_p($output_dir)
	end

	lessons = Dir.glob("#{$lesson_dir}/**/#{$language}.#{$curriculum}l*.md")

	File.open("#{$output_dir}/#{$output_file}", 'w') { |file| file.write('') }

	puts "Combining the following files:\n\n"

	for lesson in lessons.sort do

		puts "\t- #{lesson}"

		lesson_name = File.basename(lesson)
		lesson_content = File.read(lesson)

		File.open('./output/' + $output_file, 'a') { |file|

			file.puts "---"
			file.puts ""
			file.puts "name: #{lesson_name}"
			file.puts "content:"
			file.puts ""

			file.puts(lesson_content)

			file.puts ""
			file.puts "+++"
			file.puts "==="

		}

	end

	puts "\nInto #{$output_dir}/#{$output_file}"

end

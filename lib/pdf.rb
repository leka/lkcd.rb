def pdf()

	unless File.directory?($output_dir)
		FileUtils.mkdir_p($output_dir)
	end

	lessons = Dir.glob("#{$lesson_dir}/**/#{$language}.#{$curriculum}l*.md")

	File.open("#{$output_dir}/#{$tmp_file}", 'w') { |file| file.write('') }

	puts "Combining the following files:\n\n"

	for lesson in lessons.sort do

		puts "\t- #{lesson}"

		lesson_name = File.basename(lesson)
		lesson_content = File.read(lesson)

		File.open("#{$output_dir}/#{$tmp_file}", 'a') { |file|

			file.puts(lesson_content)

			file.puts ""
			file.puts "\\pagebreak"
			file.puts ""

		}

	end

	puts "\nInto #{$output_dir}/#{$language}.#{$curriculum}.pdf"

	%x(pandoc #{$output_dir}/#{$tmp_file} -N -o #{$output_dir}/#{$language}.#{$curriculum}.pdf)

	File.delete("#{$output_dir}/#{$tmp_file}")

end

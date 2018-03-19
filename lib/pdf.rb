def pdf(language, curriculum)

	unless File.directory?(LKDir::OUTPUT_DIR)
		FileUtils.mkdir_p(LKDir::OUTPUT_DIR)
	end

	lessons = Dir.glob("#{LKDir::LESSON_DIR}/**/#{language}.#{curriculum}l*.md")

	File.open("#{LKDir::OUTPUT_DIR}/#{LKDir::TMP_FILE}", 'w') { |file| file.write('') }

	puts "Combining the following files:\n\n"

	for lesson in lessons.sort do

		puts "\t- #{lesson}"

		lesson_name = File.basename(lesson)
		lesson_content = File.read(lesson)

		File.open("#{LKDir::OUTPUT_DIR}/#{LKDir::TMP_FILE}", 'a') { |file|

			file.puts(lesson_content)

			file.puts ""
			file.puts "\\pagebreak"
			file.puts ""

		}

	end

	puts "\nInto #{LKDir::OUTPUT_DIR}/#{language}.#{curriculum}.pdf"

	%x(pandoc #{LKDir::OUTPUT_DIR}/#{LKDir::TMP_FILE} -N -o #{LKDir::OUTPUT_DIR}/#{language}.#{curriculum}.pdf)

	File.delete("#{LKDir::OUTPUT_DIR}/#{LKDir::TMP_FILE}")

end

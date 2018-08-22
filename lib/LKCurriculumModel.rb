require 'yaml'
require 'json'

class Array
	def included_in? array
		array.to_set.superset?(self.to_set)
	end
end

class LKCurriculum

	attr_reader :raw
	attr_reader :uuid
	attr_reader :id
	attr_reader :author
	attr_reader :email
	attr_reader :date
	attr_reader :img
	attr_reader :languages
	attr_reader :title
	attr_reader :short_description
	attr_reader :lessons

	def initialize(curriculum)
		@raw = curriculum
		@uuid = curriculum['uuid']
		@id = curriculum['id']
		@author = curriculum['author']
		@email = curriculum['email']
		@date = curriculum['date']
		@img = curriculum['img']
		@languages = curriculum['languages']
		@lessons = curriculum['lessons']

		@title = {}
		@short_description = {}

		@languages.each do |lang|
			@title.store(lang, @raw[lang]['title'])
			@short_description.store(lang, @raw[lang]['short_description'])
		end
	end

	def include_lesson?(lesson_uuid)
		return @lessons.include?(lesson_uuid)
	end

	def push_json_to(json_file)
		json = File.read(json_file)

		File.open(json_file, 'w') do |f|
			f.puts JSON.pretty_generate(JSON.parse(json) << @raw)
		end
	end

	def title(lang = @languages[0])
		return @raw[lang]['title']
	end

	def short_description(lang = @languages[0])
		return @raw[lang]['short_description']
	end

end

def get_all_curriculums(issues, stage = LKLabel::Stage::READY)


	labels = []
	conditions = [LKLabel::Type::CURRICULUM, stage]

	# pp conditions

	issues.each do |issue|
		issue[:labels].each do |label|
			labels.push(label[:name])
		end


		# if	labels.include?(LKLabel::Stage::READY)
		# 	puts "#{issue[:title]} - #{labels} - ready"
		# end
		if	labels.include?(LKLabel::Type::CURRICULUM)
			puts "#{issue[:title]} - #{labels} - cur"
			if  labels.include?(stage)
				puts "#{issue[:title]} - #{labels} - cur & ready"
			end
		end

		labels = []
	end

	# if label[:name].eql? LKLabel::Type::CURRICULUM
	# 	puts "#{issue[:id]} #{issue[:title]}"
	# 	puts issue[:body].lines.to_a[2..-1].join
	# end
	# yssue = YAML.load(yam)
	# yssue = "json: " + issue
	# puts yssue[:labels][:name]
	# puts YAML.dump(yssue)
	puts ""
	# body = issue.body
	# yaml = YAML.load(body.lines.to_a[2..-1].join)

	# puts yaml["en_US"]["title"]

	# %x(echo "#{yaml["en_US"]["body"]}" | pandoc -o test.md)

	# puts YAML.dump(yaml)

	# return curriculums
end


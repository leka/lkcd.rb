module LKRegexp

	name = Regexp.new("(?<=name: ).*")
	global = Regexp.new("(?<=---\n\n)((?:.|\n)*?)(?=\n===)")
	content = Regexp.new("(?<=content:\n\n)((.|\n)*)(?=\n\+\+\+)")

end

module LKRegexp

	NAME = Regexp.new("(?<=name: ).*")
	GLOBAL = Regexp.new("(?<=---\n\n)((?:.|\n)*?)(?=\n===)")
	CONTENT = Regexp.new("(?<=content:\n\n)((.|\n)*)(?=\n\+\+\+)")

end

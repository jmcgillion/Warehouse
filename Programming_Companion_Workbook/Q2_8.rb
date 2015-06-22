flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index do |object|
	puts object[0,2] == "Be"
end


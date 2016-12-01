#!/user/bin/ruby -w
#encoding=utf-8

puts "nihao世界"
puts "nihao世界111"
print <<DOC
Z这是here document
this is a here document
DOC

print "a".ord

puts 111

BEGIN{
	puts "before exec!"
}
END{
	puts "end exec!"
}
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'net/http'

main_url = "http://adrinkwith.com/past-features/"
doc = Nokogiri::HTML(open(main_url))
url_array = []
name_array = []
doc.css('div#sidebar li a').each do |x|
	url_array << x['href']
	name_array << x.content
end

puts url_array.count

x = 0
while x < url_array.count
	
url = "#{url_array[x]}"
doc = Nokogiri::HTML(open(url))
document = doc.text

if document.match("If you could have a drink")
	puts "--------"
	puts "**#{name_array[x]}**"
	puts "#{url_array[x]}"
	beginindex = document.index("If you could have a drink")
	endindex = document.index("Facebook
				Twitter")
	puts qa = document[beginindex..endindex-1]
end
x = x + 1
end
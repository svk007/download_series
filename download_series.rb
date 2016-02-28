require 'rubygems'
require 'nokogiri'
require	'open-uri'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
series = ['flash', 'suits', 'arrow']
series.each do |item|
	url = "https://kat.cr/usearch/#{item}"
	doc = Nokogiri::HTML(open(url))
	link = doc.at_css(".firstr+ .odd .cellMainLink")['href']
	url2 = "https://kat.cr#{link}"
	#uri = URI.parse(URI.encode(url2.to_s, "[]"))
	doc2 = Nokogiri::HTML(open(url2))
	link2 = doc2.at_css(".iconButton")['href']
	url3 = "http:#{link2}"
	puts link2
	puts "\n Download? (y)"
	flag = gets.chomp
	if (flag=="y")
		system "start #{url3}"
	end
	omit , file_name = link2.split('=')
	path = "#{Dir.home}/Downloads/#{file_name}.torrent"
	puts "Proceed to start download? (y)"
	flag2 = gets.chomp
	if (flag2=="y")
		system "start #{path}"
	end
end

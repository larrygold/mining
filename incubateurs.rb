require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'mechanize'

mechanize = Mechanize.new

page_mechanize = Mechanize.new

page = mechanize.get('http://www.mon-incubateur.com/site_incubateur/incubateurs')

nom = page.css('td:nth-child(2) a:nth-child(1)').map{|x| x.content}
cp = page.css("td:nth-child(2) a:nth-child(3)").map{|x| x.content}

print nom
print cp

page = page.link_with(:text => 'Suivant >').click


nom2 = page.css('td:nth-child(2) a:nth-child(1)').map{|x| x.content}
cp2 = page.css("td:nth-child(2) a:nth-child(3)").map{|x| x.content}


print nom2
print cp2

# page = Nokogiri::HTML(open("http://www.mon-incubateur.com/site_incubateur/incubateurs"))
#
# nom = page.css("td:nth-child(2) a:nth-child(1)").map{|x| x.content}
# print nom
#
# cp = page.css("td:nth-child(2) a:nth-child(3)").map{|x| x.content}
# print cp

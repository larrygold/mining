require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url)

page = Nokogiri::HTML(open(url))

page.css("table.table:nth-child(1) > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)").text

end


def get_all_the_urls_of_val_doise_townhalls


    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

    links = page.css('.Style20 a')

    array_of_hashes = Array.new

    j = 0

    links.each do |i|
      page_url = i['href']
      page_url[0] = ""
      url = "http://annuaire-des-mairies.com" + page_url
      nom_ville = i.text

      url_hash = Hash.new
      url_hash[:name] = nom_ville
      url_hash[:email] = get_the_email_of_a_townhal_from_its_webpage(url)
      array_of_hashes[j] = url_hash

      j +=1

    end

print array_of_hashes

end

get_all_the_urls_of_val_doise_townhalls

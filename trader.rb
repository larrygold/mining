require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_stock

  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  i=1
  array_currencies = Array.new

    while i<page.css("tbody > tr").length

    price = page.css("tr:nth-child(#{i}) .price").text
    symbol = page.css("tr:nth-child(#{i}) .col-symbol").text


    hash_currencies = Hash.new
    hash_currencies[:symbol] = symbol
    hash_currencies[:price] = price


    array_currencies[i-1] = hash_currencies

    i+=1

    end


    print array_currencies

end



def each_hour

j = 0

  while j<1
  get_stock
  sleep(3600)
  end

end



each_hour

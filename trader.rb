require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_stock

  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  symbols = page.css(".col-symbol").map {|x| x.content}
  prices = page.css("a.price").map {|x| x.content}

  i=0
  myarray = Array.new

  while i<symbols.length
    myhash = Hash.new
    myhash[:symbols] = symbols[i]
    myhash[:prices] = prices[i]
    myarray[i] = myhash
    i+=1
  end

  print myarray

end


def each_hour

j = 0

  while j<1
  get_stock
  sleep(3600)
  end

end



each_hour

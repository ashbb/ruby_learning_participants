#! shoes
# shoes_all_courses.rb
# Mechanize compliant version: 0.9.0

require 'hpricot'

courses = %W(FORPC101-10C FORPC101-9C POIRPTDDC101-1I POIRPWMC101-2I 
             POIRPWSC101-3I FORPC101-3 FORPC101-4 FORPC101-5C FORPC101-6C 
             FORPC101-7C FORPC101-8C POIRPC101-1I POIRPWDC101-1I POIRPWMC101-1I 
             POIRPWSC101-1I POIRPWSC101-2I POJRPC101-1) << 'Teachers Lounge'

list, countries = [], []

courses.each do |course|
  filename = course + '.html' 
  doc = open(filename){|f| Hpricot(f)}
  doc.search("//td[@class='cell c3']").each do |e|
    n = e.inner_text.index(',')
    n = 0 unless n
    list << e.inner_text[0..n-1]
  end
end

list.sort!
pn = list.length

until list.empty?
  country, rest = list.partition{|e| list.first == e}
  countries << [country.first, country.length]
  list = rest
end

countries = countries.sort_by{|c, n| n}.reverse
cn = countries.length

titlename = 'All courses'

Shoes.app :title => titlename, :width => 280, :height => 500 do
  stack :width => 1.0, :height => 22 * cn + 50 do
    background orangered.to_s..green.to_s, :angle => 30
    para strong('Participants: ', pn, ', Countries: ', cn), :stroke => white
    countries.each_with_index do |e, i|
      y = 22 * i + 30
      nostroke
      rect :width => 240, :height => 20, :left => 10, :top => y, :fill => rgb(75, 0, 130, 0.2), :curve => 5
      para strong(e.first), :left => 20, :top => y, :stroke => white
      para strong(e.last), :left => 200, :top => y, :stroke => white
    end
  end
end

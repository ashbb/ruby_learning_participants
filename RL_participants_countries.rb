# RL_participants_countries.rb
require 'rubygems'
require 'mechanize'
require 'nokogiri'

agent = Mechanize.new
login_page = agent.get("http://rubylearning.org/class/login/index.php")
login_form = login_page.forms.first

#######################################
login_form['username'] = "your login name"
login_form['password'] = "your login password" 
course = "Core Ruby 20th batch"
teachers = {'India' => 1, 'Japan' => 1, 'United States' => 1}
#######################################

agent.submit(login_form)
main_page = agent.get('http://rubylearning.org/class/course/index.php')
course_link = main_page.link_with(:text => course)
course_page = agent.get(course_link.href)
participants_link = course_page.link_with(:text => 'Participants')
participants_page = agent.get(participants_link.href)

all_text = participants_page.search("//div[@id='showall']").inner_text
all_link = participants_page.link_with(:text => all_text)
all_page = agent.get(all_link.href)

list, countries = [], []
doc = Nokogiri all_page.body
doc.search("//td[@class='cell c3']").each do |e|
  n = e.inner_text.index(',')
  n = 0 unless n
  list << e.inner_text[0..n-1]
end

list.sort!

until list.empty?
  country, rest = list.partition{|e| list.first == e}
  countries << [country.first, country.length]
  list = rest
end

countries = countries.collect{|c, n| [c, teachers[c] ? n-teachers[c] : n]}
countries = countries.sort_by{|c, n| n}.collect{|c, n| [c, n] unless n.zero?}.reverse - [nil]

puts countries.map(&:first)
puts
puts countries.map(&:last)

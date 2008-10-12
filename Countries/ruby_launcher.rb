# ruby_launcher.rb
# usage: ruby ruby_launcher.rb FORPC101-8C
#
# NOTE: replace your username and passowrd, line 13 and 14

require 'mechanize'

agent = WWW::Mechanize.new

login_page = agent.get("http://rubylearning.org/class/login/index.php")

login_form = login_page.forms.first
login_form['username'] = "username"
login_form['password'] = "password"
main_page = agent.submit(login_form)

course_link = main_page.links.text(ARGV[0].upcase)
course_link.shift if course_link.length == 3
course_page = agent.get(course_link.href)

participants_link = course_page.links.text('Participants')
participants_page = agent.get(participants_link.href)

show_all_text = participants_page.search("//div[@id='showall']").inner_text
show_all_link = participants_page.links.text(show_all_text)
show_all_page = agent.get(show_all_link.href)

open('show_all_page.html', 'w'){|f| f.puts show_all_page.body}

%x(ruby shoes_countries_new.rb)
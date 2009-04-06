# ruby_launcher.rb
# usage: ruby ruby_launcher.rb POIRPWMC101-2I
# Mechanize compliant version: 0.9.0

require 'mechanize'
require 'highline/import'

agent = WWW::Mechanize.new

login_page = agent.get("http://rubylearning.org/class/login/index.php")

login_form = login_page.forms.first
login_form['username'] = ask('Username: '){|q|q.echo = true}
login_form['password'] = ask('Password: '){|q|q.echo = '*'}
main_page = agent.submit(login_form)

#course_link = main_page.links.text(ARGV[0].upcase)
course_link = main_page.link_with(:text => ARGV[0].upcase)

course_page = agent.get(course_link.href)

participants_link = course_page.link_with(:text => 'Participants')
participants_page = agent.get(participants_link.href)

show_all_text = participants_page.search("//div[@id='showall']").inner_text
show_all_link = participants_page.link_with(:text => show_all_text)
show_all_page = agent.get(show_all_link.href)

open('show_all_page.html', 'w'){|f| f.puts show_all_page.body}

%x(ruby shoes_countries_new.rb)


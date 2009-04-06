# ruby_launcher2.rb
# Mechanize compliant version: 0.9.0

require 'mechanize'
require 'highline/import'

courses = %W(FOFXR101-1I FOGGHC101-3L FORPC101-10C 
             FORPC101-11C FORPC101-12C FOUTWRC101-1I POIRPWMC101-3I 
             POIRPWSC101-3I POIRPWSC101-4I POIRPWSC101-4I POIRSC101-1I 
             FOGGHC101-1L FOGGHC101-2L FORPC101-3 FORPC101-4 
             FORPC101-5C FORPC101-6C FORPC101-7C FORPC101-8C 
             FORPC101-9C POIRPWMC101-1I POIRPWMC101-2I 
             POIRPWSC101-1I POIRPWSC101-2I) << 'Teachers Lounge'

agent = WWW::Mechanize.new
#agent.set_proxy('proxy server name', 'port', 'userid', 'password')

login_page = agent.get("http://rubylearning.org/class/login/index.php")

login_form = login_page.forms.first
login_form['username'] = ask('Username: '){|q|q.echo = true}
login_form['password'] = ask('Password: '){|q|q.echo = '*'}
agent.submit(login_form)

main_page = agent.get('http://rubylearning.org/class/')

courses.each do |course|
  course_link = main_page.link_with(:text => course)

  course_page = agent.get(course_link.href)

  participants_link = course_page.link_with(:text => 'Participants')
  participants_page = agent.get(participants_link.href)

  show_all_text = participants_page.search("//div[@id='showall']").inner_text
  show_all_link = participants_page.link_with(:text => show_all_text)
  show_all_page = agent.get(show_all_link.href)

  open(course + '.html', 'w'){|f| f.puts show_all_page.body}
end

%x(ruby shoes_all_courses.rb)

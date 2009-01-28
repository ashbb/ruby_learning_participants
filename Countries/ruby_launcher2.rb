# ruby_launcher2.rb
# Mechanize compliant version: 0.9.0

require 'mechanize'

courses = %W(FORPC101-10C FORPC101-9C POIRPTDDC101-1I POIRPWMC101-2I 
             POIRPWSC101-3I FORPC101-3 FORPC101-4 FORPC101-5C FORPC101-6C 
             FORPC101-7C FORPC101-8C POIRPC101-1I POIRPWDC101-1I POIRPWMC101-1I 
             POIRPWSC101-1I POIRPWSC101-2I POJRPC101-1) << 'Teachers Lounge'

agent = WWW::Mechanize.new
#agent.set_proxy('proxy server name', 'port', 'userid', 'password')

login_page = agent.get("http://rubylearning.org/class/login/index.php")

login_form = login_page.forms.first
login_form['username'] = "your username"
login_form['password'] = "your password"
agent.submit(login_form)

main_page = agent.get('http://rubylearning.org/class/course/index.php')

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
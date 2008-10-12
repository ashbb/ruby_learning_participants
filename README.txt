RubyLearning.org Participants' Countries

The NEW version,

Requirement:
  This new vesion uses Hpricot and WWW::Mechanize.

  gem install hpricot
  gem install mechanize


Usage:
- replace your username and passowrd, line 13 and 14 of ruby_launcher.rb
- input the following command line to launch the ruby program (not Shoes app) - ruby_launcher.rb,
  with one argument (course name).

    C:\> ruby ruby_launcher.rb FORPC101-8C

Change log:
13th Oct: Released new ruby_launcher.rb and shows_countries_new.rb
          This new version needs no local data files (i.e. forpc101-7c.html)
          It will directly access to the web site (http://rubylearning.org/class/login/index.php)

To do list:
- If the following Shoes feature works well, use it instead of the way launching from ruby.

    Shoes.setup do
      gem 'mechanize'
    end



--------------------------------------------------------------------
The OLD version:

Usage is:
- run Countries/shoes_countries.rb with Shoes
- open the ask_open_file window
- select Countries/xxxx.html file
- show the list of the Participants' Countries

Change log:
10th Oct: Updated data files (forpc101-7c.html and forpc101-8c.html)
--------------------------------------------------------------------

Cheers,
ashbb

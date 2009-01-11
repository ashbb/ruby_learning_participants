RubyLearning.org Participants' Countries

Requirement:
  This vesion uses Hpricot and Mechanize.

  gem install hpricot
  gem install mechanize


Usage:
- replace your username and passowrd, line 12 and 13 of ruby_launcher.rb
- input the following command line to launch the ruby program (not Shoes app)
- ruby_launcher.rb, with one argument (course name).

	C:\> ruby ruby_launcher.rb FORPC101-8C

Change log:
11th Jan: Supported the new spec of Mechanize 0.9.0. <br>
2009 <br>
16th Oct: Added 'nostroke' for Shoes-0.r1057 <br>
13th Oct: Released new ruby_launcher.rb and shows_countries_new.rb <br>
          This new version needs no local data files (i.e. forpc101-7c.html) <br>
          It will directly access to the web site (http://rubylearning.org/class/login/index.php) <br>

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

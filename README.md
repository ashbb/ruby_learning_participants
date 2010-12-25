RubyLearning.org Participants' Countries
--------------------------------------

Snapshot
---------
![Ruby_Metaprogramming_5th_batch.png](https://github.com/ashbb/ruby_learning_participants/raw/master/Ruby_Metaprogramming_5th_batch.png)


Requirement
------------

<pre>
gem install mechanize
gem install nokogiri
</pre>

Usage
------

- Set your login user name, password and course name at line 10-12 of RL_participants_countries.rb

<pre>
  login_form['username'] = "*****"  # input your login user name, i.e. "asakawa"
  login_form['password'] = "*****"  # input your login password, i.e. "12345"
  course = "*****"  # input course name, i.e. "Core Ruby 20th batch"
  #teachers = {'India' => 1, 'Japan' => 1, 'United States' => 1}
</pre>

- Execute RL_participants_countries.rb

<pre>
ruby RL_participants_countries.rb
</pre>

- Will get the output like this:

<pre>
>ruby RL_participants_countries.rb
United States
Brazil
Germany
Spain
Canada
United Kingdom
Australia
Italy
Austria
Mexico
India
Chile
New Zealand
Greece
Poland
Cambodia
Ukraine
Japan
Venezuela

18
7
5
4
4
3
3
3
2
2
2
1
1
1
1
1
1
1
1
>Exit code: 0
</pre>

- Open http://www.chartgo.com/ with your browser and input the data (copy and paste above output data) by hand.

You will get a chart!

Good luck,     
ashbb

# J-Cal ActiveRecord V1 Repo

This is my first official application.  It is a Cli application and is not currently available for phones, but a terminal.  
## How-To
You might have to install Ruby if you haven't done so already.  Use:
```
sudo apt-get install ruby-full
```
or if you're on a Mac it should already come installed.

Make a folder in your terminal typing "mkdir folder name"

Clone down the repository by pasting: 
```
git clone git@github.com:jsabath/J-Cal.git
```

If you don't have git installed on your computer you need to install it by running:
```
sudo apt install git-all
```

After that run: 
```
bundle install
rake db:migrate
ruby runner.rb
```
This will allow you to successfully launch J-Cal in your terminal.  
Be sure to enter your dates and times in the format of:
```
2020-03-25 09:00
2020-03-25 18:00
```

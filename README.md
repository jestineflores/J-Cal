# J-Cal ActiveRecord V1 Repo

This is my first official application.  It is a Cli application and is not currently available for phones, but a terminal.  
## How-To
Make a folder on your computer and run:
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

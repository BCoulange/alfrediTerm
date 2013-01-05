# alfrediTerm

Control iterm with alfred and have notifs! all command are launched in the currend directory 
of the current terminal window. Result of the command are prompt in the terminal as usual. This
adds just some notifs.


## Installation
* Install ruby
* Install growlnotify : http://growl.info/downloads#generaldownloads
* Install ruby-growl : `gem install ruby-growl`
* Install iTerm : http://www.iterm2.com/#/section/home
* clone repository in ~/code (or you will have to modify a bit the apple script)
* Install alfred extension

## Computed uses
### General behaviour
When nothing is computed for your command, this just prompt the result in one notification. Useful for some command like `pwd`

### Special commands
Special commands are shorcuts to very often used commands :
* `gpom` for `git push origin master`
* `gcam "my description"` for `git commit -am "my description"

### subl 
* `subl whatever` : does not prompt notification

### git 
* `git status` : display if there is changes to commit or not
* `git branch` : your working branch and the others.

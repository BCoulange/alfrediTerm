require 'ruby-growl'
require 'ruby-growl/ruby_logo'

$LOAD_PATH << './parsers'
require 'gitParsing.rb'

# exec the command in terminal
command = ARGV
puts command.join(' ')
result=`#{command.join(' ')}`

# preparing notif
g = Growl.new "localhost", "#{command.join(' ')}"
g.add_notification("notification", "ruby-growl Notification",
                   Growl::RUBY_LOGO_PNG)


# parsing for notifications
case command[0]
  when "git"
  	case command[1]
  		when "status"
  			parseGitStatus(result,g)
  		when "branch"
  			parseGitBranch(result,g)
  		when "commit"
  			parseGitCommit(result,g)
	end
   when "subl"
   	# do nothing
  else
  	g.notify "notification", "No alfred rule", "#{result}"
end

# prompt the result in terminal 
result.split("\n").each do |line|
	puts line
end

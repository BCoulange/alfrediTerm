require 'ruby-growl'
require 'ruby-growl/ruby_logo'

$LOAD_PATH << '~/code/alfrediTerm/parsers'
require 'gitParsing.rb'


command = ARGV

# preparing notif
g = Growl.new "localhost", "#{command.join(' ')}"
g.add_notification("notification", "ruby-growl Notification",
                   Growl::RUBY_LOGO_PNG)

# Get special commands...
if ['gpom','gcam','gpo'].include? command[0] then 
  case command[0]
    when "gpom"
      result=`git push origin master`
      parseGitPush(result,g)
    when "gcam"
      result=`git commit -am \"#{command[1]}\"`
      parseGitCommit(result,g)
    when "gpo"
      result=`git push origin \"#{command[1]}\"`
      parseGitPush(result,g)     
  end

else

# ... or exec the command in terminal
  #puts "executed : #{"\""+command.join("\" \"")+"\""}"
  result=`#{"\""+command.join("\" \"")+"\""}`

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
      when "push"
        parseGitPush(result,g)
	end
   when "subl"
   	# do nothing
  else
  	g.notify("notification", "No alfred rule", "#{result}") if result!=""
end

end


# prompt the result in terminal 
result.split("\n").each do |line|
  puts line
end
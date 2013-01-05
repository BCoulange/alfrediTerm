# git parsing
def parseGitStatus(result,g)
	unless result['nothing to commit'] then
			modifes=result.split("# Untracked files")[0]
			modifes=modifes.split("#	")
			modifes.shift
			modifes=modifes.map{|m| m.split("\n")[0]}
			g.notify "notification", "Some changes to commmit!", "#{modifes.join("\n")}"
	else
		if result['untracked'] then
			g.notify "notification", "Untracked files!", "#{result.split("\n")[-1]}"
		else
			g.notify "notification", "Nothing to commit!", "#{result.split("\n")[-1]}"
		end
	end
end

def parseGitBranch(result,g)
	# finding your branch
	myBranch=result.split("\n").find_all{|item| item.split.include?('*') }
	# finding others
	othersBranch=result.split("\n").find_all{|item| !item.split.include?('*') }
	# notify
	g.notify "notification", "On branch #{myBranch[0].split('*')[1]}", "#{othersBranch.join("\n")}"
end

def parseGitCommit(result,g)
	if result.split("\n").any? {|item| item['insertion'] || item['deletion']} then 
		g.notify "notification", "Commited!", "#{result.split("\n")[-1]}"
	else 
		g.notify "notification", "Commit error!", "#{result.split("\n")[-1]}"
	end

end

def parseGitPush(result,g)
	# get error
	unless result['error'] then
		g.notify "notification", "Pushing error!", "#{result.split("\n")[-1]}"
	else
		g.notify "notification", "Your work is pushed!", "#{result.split("\n")[-1]}"
	end

end
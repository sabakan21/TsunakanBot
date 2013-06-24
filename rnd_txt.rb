open('./random.txt')do|file|

	$rand=file.readlines.collect{|line|line.strip}
end

#while gets =~/end/
	p $rand.shuffle
#end

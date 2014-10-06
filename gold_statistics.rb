
gold = File.open("gold_statistics.csv","r")
a = gold.readlines
	a.flatten!
	a.drop(1)
	a.pop
	a.pop
	a.pop
	a.delete_at(0)
a.collect! do |x|
	x.split(",")[1].chomp.to_f
end

sum = 0
i = 0
	while i < a.length
		sum = a[i] + sum
		i+=1
	end
mean = sum / a.length
puts "Mean = #{mean}"

i = 0
variance = 0
variance_sum = 0
	while i < a.length
		variance_sum = (a[i] ** 2) + variance_sum
		i+=1
	end
variance = variance_sum / a.length
standard_deviation = variance ** (/.5)
puts "Standard Deviation = #{standard_deviation}"

i = 0
zscore = 0
zscore_top = 0
file = File.open("zscores_gold.txt","a")	
	while i < a.length
		zscore_top = a[i] - mean
		zscore = zscore_top / standard_deviation
		file.write("#{zscore},")
		i+=1
	end
file.close
gold.close

puts "Thanks so much!"


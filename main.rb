require_relative "Gladiator" 
require_relative "Audience" 
require_relative "Arena"
def main()

puts 'enter name'
character=gets.chomp

puts 'enter speed'
speed=gets.to_i
	
puts 'enter intellegence'
intellegence=gets.chomp.to_i

puts 'enter strength'
strength=gets.chomp.to_i

puts 'enter health'
health=gets.chomp.to_i
	
if speed+strength+health+intellegence>20
	
	while(speed+strength+health+intellegence>20)	
		puts "appereance total should not exceed 20 so reenter these values"
		puts 'enter speed'
		speed=gets.to_i
		
		puts 'enter intellegence'
		intellegence=gets.chomp.to_i

		puts 'enter strength'
		strength=gets.chomp.to_i

		puts 'enter health'
		health=gets.chomp.to_i
	end
end
puts'please choose select a weapon'
puts'a)Boot Knife'
puts'b)Swiss Knife'
puts'c)Katana'
weapon=gets.chomp
if weapon=='a'
	puts "Boot Knife"
	strength=strength+2
end

if weapon=='b'
	puts "Swiss Knife"
	strength=strength+1
end
if weapon=='c'
	puts "Katana"
	strength=strength+3
end
array=[]
b=Gladiator.new(character,speed,strength,intellegence,health);

for i in 0..10

	responseType=rand(3)
	if(responseType==0)
		type=Rival.new
	elsif responseType==1
		type=Friend.new
	else
		type=Notur.new
	end

a1=Audience.new(b,type)
array.push(a1)
end
check=false
while (!check)
puts "Choose an arena"
puts "arena 1 or 2"
choose=gets.chomp.to_i
if choose==1
	e=Arena1.new(b)
	check=true
elsif choose == 2
	e=Arena2.new(b)
	check=true
end
end
	
for i in array
	i.unsubscribe()
end	
end
main
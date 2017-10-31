require_relative 'Gladiator'
require_relative 'Audience'
require 'io/console'
class Arena
	def initialize
		raise NotImplementedError
	end
	def temp(gladiator)
		intellegenceTest(gladiator)
		speedTest(gladiator)
		strengthTest(gladiator)
	end
	def intellegenceTest(gladiator)
	raise NotImplementedError
	end
	def speedTest(gladiator)
	raise NotImplementedError
	end
	def strengthTest(gladiator)
	raise NotImplementedError
	end
	def printAttacks
		puts 'Select an attack'
		puts'a)low kick'
		puts'b)stab by the leg'
		puts'c)headbutt'

	end
	def printHealt(gladiator,rival_health)
		puts "you:#{gladiator.health}\t opponent#{rival_health}"
	end
end
class Arena1 < Arena
	def initialize(gladiator)
		@gladiator=gladiator
		temp(gladiator)
	end
	def intellegenceTest(gladiator)
		puts 'intellegence test'
		if(gladiator.intelligence>5)
			puts'calculate 5+3'
			puts gladiator.health

			res=gets.chomp.to_i
			if res!=8
				gladiator.health=gladiator.health-3
				if(gladiator.health<=0)
					event='l'
					gladiator.notify(event)
				else
					event='h'
					gladiator.notify(event)
				end
			else
				event='w'
					gladiator.notify(event)
					gladiator.health=gladiator.health+3

			end
		else
			puts'calculate 123515*45512+120/40'
			res=gets.chomp.to_i	
			if res!=123515*45512+120/40
				gladiator.health=gladiator.health-3
				if(gladiator.health<=0)
					event='l'
					gladiator.notify(event)
				else
					event='h'
					gladiator.notify(event)
				end
			else
				event='w'
					gladiator.health=gladiator.health+1
					gladiator.notify(event)
			end
		end	
		puts"your health: #{gladiator.health}"
	end
	def speedTest(gladiator)
		if(gladiator.health>0)
			input = nil
			puts "Type as much as you can in #{gladiator.speed} seconds"
			print "press any key"                                                                                                    
			STDIN.getch
			puts"\n"
			timer = Thread.new do
			  (gladiator.speed).downto(0) do |i|
			    sleep 1
			    if input
			      Thread.exit()
			   end

			  end
			  puts 'Time is up'
			end

			answer = Thread.new do
			  puts 'What is your answer?'
			  input = gets.chomp
			end 

			answer.join(gladiator.speed)
			timer.join

			if input==nil
			  input=''
			  puts 'No Answer'
			  event='l'
			  puts 's'
			  gladiator.health=gladiator.health-1
			else
			  	puts input.length
				if input.length<25 and input.length>20 
					event='h'
					gladiator.health=gladiator.health-1
				end
				if input.length<20
					event='l'
					gladiator.health=gladiator.health-2
				end
				if input.length>25
					event='w'
					gladiator.health=gladiator.health+1
				end
				
			end
			gladiator.notify(event)
			puts"your health: #{gladiator.health}"
		else
			puts"you already dead"
		end
	end
	def strengthTest(gladiator)
			if(gladiator.health>0)
			rival_health=8
			rival_strength=5
			puts'This is the final battle'
			while(rival_health>0 and gladiator.health>0)
				printAttacks
				hit=gets.chomp
				if(hit=='a')
					rival_health=rival_health-2*gladiator.strength*0.25
					puts 'opponent stab you by the leg'
					gladiator.health=gladiator.health-3*rival_strength*0.25
					event='h'
					gladiator.notify(event)
					printHealt(gladiator,rival_health)	
				end
				if(hit=='b')
					rival_health=rival_health-3*gladiator.strength*0.25
					puts 'opponent use headbutt'
					gladiator.health=gladiator.health-1*rival_strength*0.25
					printHealt(gladiator,rival_health)
				end
				if(hit=='c')
					rival_health=rival_health-1*gladiator.strength*0.25
					puts 'opponent use low kick'
					gladiator.health=gladiator.health-2*rival_strength*0.25
					printHealt(gladiator,rival_health)
				end
			end
			if(rival_health<=0)
				event='w'
			elsif (gladiator.health<=0)
				event='l'
			end
			gladiator.notify(event)
		end
	end
	
end
class Arena2 < Arena
	def initialize(gladiator)
		@gladiator=gladiator
		temp(gladiator)
	end
	def intellegenceTest(gladiator)
		puts 'intellegence test'
		if(gladiator.intelligence>5)
			puts'calculate 5+5'
			puts gladiator.health

			res=gets.chomp.to_i
			if res!=10
				gladiator.health=gladiator.health-3
				if(gladiator.health<=0)
					event='l'
					gladiator.notify(event)
				else
					event='h'
					gladiator.notify(event)
				end
			else
				event='w'
					gladiator.notify(event)
					gladiator.health=gladiator.health+3

			end
		else
			puts'calculate 745845*40001+160/40'
			res=gets.chomp.to_i	
			if res!=745845*40001+160/40
				gladiator.health=gladiator.health-2
				if(gladiator.health<=0)
					event='l'
					gladiator.notify(event)
				else
					event='h'
					gladiator.notify(event)
				end
			else
				event='w'
					gladiator.health=gladiator.health+1
					gladiator.notify(event)
			end
		end	
		puts"your health: #{gladiator.health}"
	end
	def speedTest(gladiator)
		if(gladiator.health>0)
			input = nil
			puts "Type as much as you can in #{gladiator.speed*2} seconds"
			print "press any key"                                                                                                    
			STDIN.getch
			puts"\n"
			timer = Thread.new do
			  (gladiator.speed*2).downto(0) do |i|
			    #puts "\r00:00:#{'%02d' % i}"
			    sleep 1
			    if input
			      Thread.exit()
			   end

			  end
			  puts 'Time is up'
			end

			answer = Thread.new do
			  puts 'What is your answer?'
			  input = gets.chomp
			end 

			answer.join(gladiator.speed*2)
			timer.join

			if input==nil
			  input=''
			  puts 'No Answer'
			  event='l'
			  puts 's'
			  gladiator.health=gladiator.health-1
			else
			  	puts input.length
				if input.length<25 and input.length>20 
					event='h'
					gladiator.health=gladiator.health-1
				end
				if input.length<20
					event='l'
					gladiator.health=gladiator.health-2
				end
				if input.length>25
					event='w'
					gladiator.health=gladiator.health+1
				end
				
			end
			gladiator.notify(event)
			puts"your health: #{gladiator.health}"
		else
			puts"you already dead"
		end
	end
	def strengthTest(gladiator)
			if(gladiator.health>0)
			rival_health=6
			rival_strength=4
			puts'This is the final battle'
			printHealt(gladiator,rival_health)
			while(rival_health>0 and gladiator.health>0)
				printAttacks
				hit=gets.chomp
				if(hit=='a')
					rival_health=rival_health-2*gladiator.strength*0.1
					puts 'opponent stab you by the leg'
					gladiator.health=gladiator.health-3*rival_strength*0.1
					event='h'
					gladiator.notify(event)
					printHealt(gladiator,rival_health)	
				end
				if(hit=='b')
					rival_health=rival_health-3*gladiator.strength*0.1
					puts 'opponent use headbutt'
					gladiator.health=gladiator.health-1*rival_strength*0.1
					printHealt(gladiator,rival_health)
				end
				if(hit=='c')
					rival_health=rival_health-1*gladiator.strength*0.1
					puts 'opponent use low kick'
					gladiator.health=gladiator.health-2*rival_strength*0.1
					printHealt(gladiator,rival_health)
				end
			end
			if(rival_health<=0)
				event='w'
			elsif (gladiator.health<=0)
				event='l'
			end
			gladiator.notify(event)
		end
	end
	
end
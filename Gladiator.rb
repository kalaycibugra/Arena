
class Gladiator
attr_reader :speed, :strength, :intelligence
attr_accessor :observers, :health
def initialize(character,speed,strength,intelligence,health)
	@character=character
	@speed=speed
	@strength=strength
	@intelligence=intelligence
	@health=health
	@observers = []

end
def notify(event)
	@observers.each{ |o|
		o.update(event)
	}
end
def reg(observer)	
	@observers.push(observer)

end
	
def dereg(observer)
	@observers.delete(observer)
	
end

end

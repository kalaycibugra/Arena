require_relative "Gladiator"
require_relative "Responses"

class Audience
	def initialize(subject,type)
	@subject = subject
	@subject.reg(self)
	@type=type
	
		

	end
	def unsubscribe()
		@subject.dereg(self)
		
	end
	
	def update(event)

		setResponse(event)
		
				
			
	end
	def setResponse(event)
		if event=='h'
			@type.react2
		end
		if event == 'l'
			@type.react3
		end
		if event=='w'
			@type.react1	
		end
	end
end

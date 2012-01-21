class Message < ActiveRecord::Base
	validates_presence_of :name
	Pusher.app_id = '14039'
	Pusher.key = '5429b6aec033c7844e27'
	Pusher.secret = 'fe4f1ef9440536e56530'
	
	after_create :send_to_pusher #esto es a nivel de la base de datos. Luego de crear en la 
								#base de datos llama a send_to_pusher
								#puedo sumar más acciones en el after_create :log_actions por ejemplo- 

	def send_to_pusher
		Pusher["global_room"].trigger!('message:create',self.to_json)
	end
end
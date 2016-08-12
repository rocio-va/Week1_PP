require "pry"

class Room
	attr_reader :doors, :description
	def initialize description, doorN, doorE, doorS, doorW
		@description = description
		@doors = {n: doorN, e: doorE, s: doorS, w: doorW}
	end
end

class Game
	attr_accessor :current_room
	def initialize rooms, win_room
		@current_room = 0
		@win_room = win_room
		@rooms = rooms
	end
	def print_description
		puts "Estás en #{@rooms[@current_room].description}."
		@rooms[@current_room].doors.each do |key, value|
			if(value != -1)
				puts "Hay una puerta en direccion #{key.to_s}"
			end
		end
	end
	def change_room num_room
		@current_room = num_room
	end
	def make_decition decition
		doors = @rooms[@current_room].doors
		case decition.downcase
			when "n"
				if(doors[:n] != -1)
					change_room(doors[:n])
				end
			when "e"
				if(doors[:e] != -1)
					change_room(doors[:e])
				end
			when "s"
				if(doors[:s] != -1)
					change_room(doors[:s])
				end
			when "w"
				if(doors[:w] != -1)
					change_room(doors[:w])
				end
			else
				puts "Debes escoger una opción correcta."
		end
	end
	def play_game
		puts "Bienvenido a Game of Rooms!"
		exit = false
		win = false
		while( !exit && !win) 
			print_description
			puts "¿En qué dirección quieres ir?\nPara ir al norte pulsa n."
			puts "Para ir al este pulsa e.\nPara ir al sur pulsa s."
			puts "Para ir al oeste pulsa w.\nPara salir escribe x."
			decition = gets.chomp
			if(decition.downcase == "x")
				exit = true
			else
				make_decition(decition)
				if (@current_room == @win_room)
					win = true
					puts "HAS GANADO!!"
				end
			end

		end
	end
end

game_array = [
	Room.new("hab0", -1, 1, 2, -1),
	Room.new("hab1", -1, -1, 3, 0), 
	Room.new("hab2", 0, -1, -1, -1),
	Room.new("hab3", 1, -1, -1, -1)
]
game = Game.new(game_array, 3)
game.play_game

binding.pry
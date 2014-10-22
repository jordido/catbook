module Api
	module v1
		class CatsController < ApplicationController
			def show
				cat = Cat.find(params[:id])
				render json: {
					name: cat.name
					birthday: cat.birthday
				}
			end
		end
	end
end

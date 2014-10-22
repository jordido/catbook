module Api
	module V1
		class CatsController < ApplicationController
			def show
				@cat = Cat.find(params[:id])
				respond_to do |format|
				format.html  #show.html.erb
				format.json { 
					render json: {
					name: @cat.name,
					birthday: @cat.birthday
					}
				}
				end
			end
			def index

			end
		end
	end
end

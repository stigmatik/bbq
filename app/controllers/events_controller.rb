class EventsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	before_action :set_current_user_event, only: [:edit, :update, :destroy]

	def index
		@events = Event.all
	end

	def show
	end

	def new
		@event = current_user.events.build
	end

	def edit
	end

	def create
		@event = current_user.events.build(event_params)

		if @event.save
			redirect_to @event, notice: 'Событие успешно создано!'
		else
			render :new
		end
	end

	def update
		if @event.update(event_params)
			redirect_to @event, notice: 'Событие успешно обновлено!'
		else
			render :edit
		end
	end

	def destroy
		@event.destroy
		redirect_to events_url, notice: 'Событие удалено.'
	end

	private

	def set_current_user_event
		@event = current_user.events.find(params[:id])
	end

	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:title, :address, :datetime, :description)
	end
end
class Api::V1::VehiclesController < ApplicationController
  def index
    vehicles = Vehicle.all
    render json: vehicles
  end

  def create
    begin
      vehicle = Vehicle.new(vehicle_params)
      if vehicle.save
        render json: vehicle, status: :created
      else
        errors = vehicle.errors.full_messages.to_sentence
        render json: { error: 'validation_error', message: errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.class.name, message: e.message }, status: :internal_server_error
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:plate, :capacity_kg, :driver_name, :status)
  end
end

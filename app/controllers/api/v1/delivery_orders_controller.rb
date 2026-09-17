require "securerandom"
require "active_support/core_ext/string/inflections"

class Api::V1::DeliveryOrdersController < ApplicationController
  def index
    @delivery_orders = DeliveryOrder.all
    if params[:status]
      @delivery_orders = @delivery_orders.where(status: params[:status])
    end
    if params[:scheduled_date]
      @delivery_orders = @delivery_orders.where(scheduled_date: params[:scheduled_date])
    end

    if @delivery_orders.empty?
      render json: { error: "not_found", message: "No delivery orders found" }, status: :not_found
      return
    end

    render json: @delivery_orders
  end

  def create
    begin
      code = SecureRandom.alphanumeric(10).upcase
      @delivery_order = DeliveryOrder.new(delivery_order_params.merge(code: code))
      if @delivery_order.save
        render json: @delivery_order, status: :created
      else
        errors = @delivery_order.errors.full_messages
        render json: { error: "validation_error", message: errors }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: e.class.name.underscore, message: e.message }, status: :internal_server_error
    end
  end

  private

  def delivery_order_params
    params.require(:delivery_order).permit(:code, :weight_kg, :destination_address, :status, :scheduled_date)
  end
end

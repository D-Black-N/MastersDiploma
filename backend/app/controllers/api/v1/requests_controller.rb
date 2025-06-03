# frozen_string_literal: true

module Api
  module V1
    class RequestsController < ApplicationController
      def index
        render json: Oj.to_json(requests: Request.includes(:client).all.as_json(include: { client: { only: %i[first_name last_name middle_name id] } }))
      end

      schema(:show) do
        required(:id).filled(:integer)
      end

      def show
        request = Request.find_by(id: safe_params[:id]).as_json(
          include: {
            client:  { only: %i[first_name last_name middle_name id phone_number] },
            user:    { only: %i[first_name last_name middle_name id] },
            vehicle: { only: %i[brand vehicle_model year price] }
          },
        )

        render json: Oj.to_json(request: request)
      end

      schema(:create) do
        required(:request).hash do
          required(:client_id).value(:integer)
          required(:user_id).value(:integer)
          required(:leasing_term).value(:integer)
          required(:payment_type).filled(:string)
          required(:status).filled(:string)
          optional(:conditions).value(:string)
          required(:vehicle_attributes).hash do
            required(:brand).filled(:string)
            required(:vehicle_model).filled(:string)
            required(:year).value(:integer)
            required(:vin).filled(:string)
            required(:price).value(:integer)
            required(:status).filled(:string)
          end
        end
      end

      def create
        request = Request.new(safe_params.output[:request])

        if request.save
          render json: Oj.to_json(request: request.as_json(
            client:  { only: %i[first_name last_name middle_name id phone_number] },
            user:    { only: %i[first_name last_name middle_name id] },
            vehicle: { only: %i[brand vehicle_model year price] }
          ))
        else
          render json: request.errors.messages, status: :unprocessable_entity
        end
      end

      schema(:update) do
        required(:id).filled(:integer)
      end

      def update
        case resolve('').call(safe_params.output)
        in Success(data)
          render json: Oj.to_json({ body: data }), status: :ok
        in Failure[]
        in Failure[]
        end
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class ClientsController < ApplicationController
      def index
        render json: Oj.to_json(clients: Client.includes(:user).order(:id).all.as_json(include: { user: { only: %i[first_name last_name middle_name id] } }))
      end

      schema(:show) do
        required(:id).filled(:integer)
      end

      def show
        render json: Oj.to_json(client: Client.includes(:user).find_by(id: safe_params[:id]).as_json(include: { user: { only: %i[first_name last_name middle_name id] } }))
      end

      schema(:create) do
        required(:client).hash do
          required(:last_name).filled(:string)
          required(:first_name).filled(:string)
          optional(:middle_name).filled(:string)
          required(:phone_number).filled(:string)
          required(:passport_series).filled(:string)
          required(:passport_number).filled(:string)
          required(:email).filled(:string)
          required(:user_id).filled(:integer)
        end
      end

      def create
        client = Client.create!(safe_params[:client])

        render json: Oj.to_json(client: client)
      end

      schema(:update) do
        required(:client).hash do
          required(:id).value(:integer)
          required(:email).filled(:string)
          required(:first_name).filled(:string)
          required(:last_name).filled(:string)
          required(:passport_series).filled(:string)
          required(:passport_number).filled(:string)
          required(:phone_number).filled(:string)
          required(:user_id).value(:integer)
          optional(:middle_name).value(:string)
        end
      end

      def update
        client = Client.find_by(id: safe_params[:client][:id])
        client.update!(safe_params[:client])

        render json: Oj.to_json(client: client.as_json(include: { user: { only: %i[first_name last_name middle_name id] } }))
      end
    end
  end
end

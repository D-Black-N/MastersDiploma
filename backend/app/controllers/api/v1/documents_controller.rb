# frozen_string_literal: true

module Api
  module V1
    class DocumentsController < ApplicationController
      schema(:index) do
        required(:id).filled(:integer)
      end
      
      def index
        client = Client.find_by(id: safe_params[:id])

        render json: client.documents
      end

      schema(:create) do
        required(:client_id).filled(:integer)
        required
      end

      def create
      end

      schema(:destroy) do
        required(:id).filled(:integer)
      end

      def destroy
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

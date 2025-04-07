# frozen_string_literal: true

module API
  class RequestsController < ApplicationController
    schema(:index) do
      required(:id).filled(:integer)
    end

    def index
      authorize(:user)

      case resolve('').call(safe_params.output)
      in Success(data)
        render json: Oj.to_json({ body: data }), status: :ok
      in Failure[]
      in Failure[]
      end
    end

    schema(:show) do
      required(:id).filled(:integer)
    end

    def show
      authorize(:user)

      case resolve('').call(safe_params.output)
      in Success(data)
        render json: Oj.to_json({ body: data }), status: :ok
      in Failure[]
      in Failure[]
      end
    end

    schema(:create) do
      required(:id).filled(:integer)
    end

    def create
      authorize(:user)

      case resolve('').call(safe_params.output)
      in Success(data)
        render json: Oj.to_json({ body: data }), status: :ok
      in Failure[]
      in Failure[]
      end
    end

    schema(:update) do
      required(:id).filled(:integer)
    end

    def update
      authorize(:user)

      case resolve('').call(safe_params.output)
      in Success(data)
        render json: Oj.to_json({ body: data }), status: :ok
      in Failure[]
      in Failure[]
      end
    end

    schema(:destroy) do
      required(:id).filled(:integer)
    end

    def destroy
      authorize(:user)

      case resolve('').call(safe_params.output)
      in Success(data)
        render json: Oj.to_json({ body: data }), status: :ok
      in Failure[]
      in Failure[]
      end
    end
  end
end

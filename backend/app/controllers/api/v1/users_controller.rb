# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: Oj.to_json(users: User.all)
      end
    end
  end
end

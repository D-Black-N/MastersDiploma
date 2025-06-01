# frozen_string_literal: true

module Api
  module V1
    class DocumentsController < ApplicationController
      schema(:index) do
        required(:client_id).filled(:integer)
      end
      
      def index
        client = Client.find_by(id: safe_params[:client_id])

        render json: Oj.to_json(documents: client.documents.map { |doc| document_json(doc) })
      end

      schema(:create) do
        required(:client_id).filled(:integer)
        required(:document).hash do
          required(:file)
        end
      end

      def create
        client = Client.find_by(id: safe_params[:client_id])
        document = client.documents.create!(name: safe_params[:document][:file].original_filename)
        document.file.attach(safe_params[:document][:file])

        render json: Oj.to_json(document: document_json(document))
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

      private

      def document_json(document)
        {
          id: document.id,
          name: document.file.filename.to_s,
          doc_type: document.file_type,
          uploaded_at: document.created_at,
          size: document.file.byte_size,
          url: url_for(document.file)
        }
      end
    end
  end
end

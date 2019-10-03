# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Json Objects API', type: :request do
  let!(:json_objects) { create_list(:json_object, 5) }
  let(:json_object_id) { json_objects.first.id }

  describe 'GET /json_objects' do
    before { get '/json_objects' }

    it 'returns json_objects' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /json_objects/:id' do
    before { get "/json_objects/#{json_object_id}" }

    context 'when the record exists' do
      it 'returns the json object' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(json_object_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:json_object_id) { 6 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find JsonObject/)
      end
    end
  end

  # I am passing JSON files and need the rspec mock syntax for this.
  # describe 'POST /json_objects' do
  #   let(:valid_attributes) do
  #     { "hello": 'goodbye' }
  #   end
  #
  #   context 'when the request is valid' do
  #     before { post '/json_objects', params: { "hello": 'goodbye' } }
  #
  #     it 'creates an object' do
  #       expect(json['json_string']).to eq('{"hello": "goodbye"}')
  #     end
  #
  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end
  #
  #   Need to figure out how to test this. All strings are currently valid!
  #   context 'when the request is invalid' do
  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end
  #   end
  # end

  # describe 'PUT /json_objects/:id' do
  #   let(:valid_attributes) do
  #     { "hello": 'goodbye' }
  #   end
  #   context 'when the record exists' do
  #     before { put "/json_objects/#{json_object_id}", params: valid_attributes }
  #
  #     it 'updates the record' do
  #       expect(response.body).to be_empty
  #     end
  #
  #     it 'returns status code 204' do
  #       expect(response).to have_http_status(204)
  #     end
  #   end
  # end
  describe 'DELETE /json_objects/:id' do
    before { delete "/json_objects/#{json_object_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

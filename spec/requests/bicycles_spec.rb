# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bicycles API', type: :request do
  let!(:bicycles) { create_list(:bicycle, 5) }
  let(:bicycle_id) { bicycles.first.id }

  describe 'GET /bicycles' do
    before { get '/bicycles' }

    it 'returns bicycles' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /bicycles/:id' do
    before { get "/bicycles/#{bicycle_id}" }

    context 'when the record exists' do
      it 'returns the bicycle object' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(bicycle_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:bicycle_id) { 6 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Bicycle/)
      end
    end
  end

  describe 'POST /bicycles' do
    let(:valid_attributes) do
      {
        brand: 'Kona',
        colour: 'green',
        tyre_width: 40
      }
    end

    context 'when the request is valid' do
      before { post '/bicycles', params: valid_attributes }

      it 'creates a bicycle object' do
        expect(json['brand']).to eq('Kona')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/bicycles', params: { brand: 'Carrera' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Colour can't be blank/)
      end
    end
  end

  describe 'PUT /bicycles/:id' do
    let(:valid_attributes) do
      {
        brand: 'Specialized',
        colour: 'black',
        tyre_width: 25
      }

      context 'when the record exists' do
        before { put "/bicycles/#{bicycle_id}", params: valid_attributes }

        it 'updates the record' do
          expect(response.body).to be_empty
        end

        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end
    end

    describe 'DELETE /bicycles/:id' do
      before { delete "/bicycles/#{bicycle_id}" }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'Stores API request', type: :request do
  let!(:stores) { create_list(:store, 10) }
  let!(:store_id) { stores.first.id }
  let!(:store_name) { stores.first.name }
  # GET LIST OF stores
  describe 'GET /stores' do
    before { get '/stores' }
    it 'returns stores' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  # Search store by name
  describe 'GET /stores/?keyword=:name' do
    before { get "/stores/?keyword=#{store_name}" }
    context 'when the record exists' do
      it 'returns the store' do
        expect(json).not_to be_empty
        expect(json['name']).to eq("#{store_name}")
      end
      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
  # Show store by ID
  describe 'GET /stores/:id' do
    before { get "/stores/#{store_id}" }
    context 'when the store exists' do
      it 'returns the store' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(store_id)
      end
      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'when the store does not exist' do
      let!(:store_id) { 100 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Store/)
      end
    end
  end
  describe 'POST /stores' do
    let(:name) { Faker::Company.name }
    let(:valid_attributes){ {name: name} }
    context 'when the request is valid' do
      before { post '/stores', params: valid_attributes}
      it 'creates store' do
        expect(json['name']).to eq(name)
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

end

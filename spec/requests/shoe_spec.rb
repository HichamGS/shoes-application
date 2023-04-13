require 'rails_helper'

RSpec.describe 'Shoes API request', type: :request do
  let!(:shoes) { create_list(:shoe, 10) }
  let!(:shoe_id) { shoes.first.id }
  let!(:shoe_name) { shoes.first.name }
  # GET LIST OF SHOES
  describe 'GET /shoes' do
    before { get '/shoes' }
    it 'returns shoes' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  # Search Shoe by name
  describe 'GET /shoes/?keyword=:name' do
    before { get "/shoes/?keyword=#{shoe_name}" }
    context 'when the record exists' do
      it 'returns the shoe' do
        expect(json).not_to be_empty
        expect(json['name']).to eq("#{shoe_name}")
      end
      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
  # Show Shoe by ID
  describe 'GET /shoes/:id' do
    before { get "/shoes/#{shoe_id}" }
    context 'when the shoe exists' do
      it 'returns the shoe' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(shoe_id)
      end
      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'when the shoe does not exist' do
      let!(:shoe_id) { 100 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Shoe/)
      end
    end
  end
  describe 'POST /shoes' do
    let(:name) { Faker::Company.name }
    let(:valid_attributes){ {name: name} }
    context 'when the request is valid' do
      before { post '/shoes', params: valid_attributes}
      it 'creates shoe' do
        expect(json['name']).to eq(name)
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

end

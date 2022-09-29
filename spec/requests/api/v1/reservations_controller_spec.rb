require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  describe 'GET #index' do
    context 'User is not authenticated' do
      before :each do
        get api_v1_reservations_path
      end

      it 'assigns all categories to @categories' do
        expect(assigns(:categories)).to_not eq(Reservation.all)
      end

      it 'gives an error message' do
        expect(response.body).to eq "{\"reservation\":[]}"
      end
    end

    context 'User is authenticated' do
      before :each do
        auth_token = signup
        headers = { 'ACCEPT' => 'application/json', 'Authorization' => auth_token }
        get api_v1_reservations_path, headers:
      end

      it 'returns http success' do
        expect(response).to have_http_status(:ok)
      end

      it 'redirects to the home page' do
        expect(current_path).to eq(api_v1_reservations_path)
      end

      it 'assigns all categories to @categories' do
        expect(response.body).to eq "{\"reservation\":[]}"
      end
    end
  end
end

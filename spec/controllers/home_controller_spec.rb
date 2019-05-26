require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views
  
  describe "GET #index" do
    let!(:movie) { create :movie }

    before { get :index }

    specify do
      expect(response.response_code).to eq 200
      expect(assigns(:movies)).to match_array([movie])
      expect(response).to render_template 'home/index'
    end
  end
end

require 'rails_helper'

RSpec.describe Movies::SharesController, type: :controller do
  render_views

  describe "when user login" do
    login_user

    describe "GET #new" do
      before { get :new }

      specify do
        expect(response.response_code).to eq 200
        expect(response).to render_template 'movies/shares/new'
      end
    end

    describe "GET #create" do
      context "when params valid" do
        let(:params) do
          {
            :movie => {
              :url => 'https://www.youtube.com/watch?v=T-fXzUsPZtM'
            }
          }
        end

        specify do
          expect do
            post :create, :params => params
          end.to change { Movie.count }.by(1)
          expect(response.response_code).to eq 302
          expect(response).to redirect_to root_url
        end
      end

      context "when params invalid" do
        let(:params) do
          {
            :movie => {
              :url => ''
            }
          }
        end

        specify do
          expect do
            post :create, :params => params
          end.to_not change { Movie.count }
          expect(response.response_code).to eq 200
          expect(response).to render_template 'movies/shares/new'
        end
      end
    end
  end

  describe "when user not login" do
    describe "GET #new" do
      before { get :new }

      specify do
        expect(response.response_code).to eq 302
        expect(response).to redirect_to '/users/sign_in'
      end
    end

    describe "POST #create" do
      before { post :create }

      specify do
        expect(response.response_code).to eq 302
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end

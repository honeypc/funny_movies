require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :name => "",
      :description => "",
      :url => "",
      :thumbnails => "",
      :play_list_id => "",
      :owner_id => 1
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input[name=?]", "movie[name]"

      assert_select "input[name=?]", "movie[description]"

      assert_select "input[name=?]", "movie[url]"

      assert_select "input[name=?]", "movie[thumbnails]"

      assert_select "input[name=?]", "movie[play_list_id]"

      assert_select "input[name=?]", "movie[owner_id]"
    end
  end
end

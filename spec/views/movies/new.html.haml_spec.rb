require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      :name => "",
      :description => "",
      :url => "",
      :thumbnails => "",
      :play_list_id => "",
      :owner_id => 1
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[name]"

      assert_select "input[name=?]", "movie[description]"

      assert_select "input[name=?]", "movie[url]"

      assert_select "input[name=?]", "movie[thumbnails]"

      assert_select "input[name=?]", "movie[play_list_id]"

      assert_select "input[name=?]", "movie[owner_id]"
    end
  end
end

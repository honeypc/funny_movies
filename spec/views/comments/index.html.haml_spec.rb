require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :movie_id => 2,
        :user_id => 3,
        :content => "Content"
      ),
      Comment.create!(
        :movie_id => 2,
        :user_id => 3,
        :content => "Content"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end

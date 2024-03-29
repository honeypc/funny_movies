require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :movie_id => 2,
      :user_id => 3,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Content/)
  end
end

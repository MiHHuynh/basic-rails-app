require 'rails_helper'

describe Product do
	context "when the product has comments" do

		before do
  			@product = Product.create!(name: "Possets Lavender Pepys", image_url: "http://i.imgur.com/hPFhIlQ.jpg", price: "5")
  			@user = FactoryGirl.create(:user)
  			@product.comments.create!(rating: 1, user: @user, body: "smells bad")
  			@product.comments.create!(rating: 3, user: @user, body: "not bad but goes dusty")
  			@product.comments.create!(rating: 5, user: @user, body: "best thing I've ever smelled")
		end

		it "returns the average ratings of all comments" do
			expect(@product.average_rating).to eq 3
		end

		it "is not valid" do
			expect(Product.new(description: "Nice bike")).not_to be_valid
		end

	end




end
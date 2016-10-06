class PaymentsController < ApplicationController
	def create
	  @product = Product.find(params[:product_id])
	  @user = current_user
	  token = params[:stripeToken]

	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      :amount => Product.price, # amount in cents, again
	      :currency => "usd",
	      :source => token,
	      :description => params[:stripeEmail]
	    )
	  if charge.paid
  		  Order.create(:product_id => @product.product_id, :user_id => @user.user_id, :total => @product.price)
	  	  redirect_to product_path(@product)
	  end

	  rescue Stripe::CardError => e
	    # The card has been declined
	  end

    end # end create
end # end paymentscontroller

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_x3umanvyQ7Mc8dSpGPIYMUyR',
    :secret_key => 'sk_test_1gaPAFdQTFxRl3PVdojp29QM'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
class DonationsController < ApplicationController

  def new
    @amount = Amount.new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "$#{@amount} Pledge",
      amount: @amount
    }
  end

  def create
    @amount = Amount.new(amount_params)

    @amount.save
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: @amount,
      description: "#{@amount} Donation",
      currency: 'usd'
    )

    flash[:notice] = "Thank you for the donation!"
    redirect_to new_donation_path # or wherever

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_donation_path
  end
  private
  def amount_params
    params.require(:amounts).permit(:amount)
  end
end

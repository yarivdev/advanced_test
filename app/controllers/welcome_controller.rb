class WelcomeController < ApplicationController
  def index
    # Fetch or create a user, reset balance to 0
    @user = User.first
    if @user
      @user.update_attribute(:balance, 0)  
    else
      @user = User.create(balance: 0) if @user.nil?
    end
    
    # begin excercise. checkout models/user.rb
    10.times do
      @user.increase_balance(10)
    end
      
    render text: "expected balance to equal 100, received: #{User.first.balance}"
  end
end

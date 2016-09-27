class User < ApplicationRecord

  def increase_balance(amount)
    threads = []

    amount.times do
      threads << Thread.new do # Note: solution must include threading! #
        self.balance+=1
        self.save!
      end
      ActiveRecord::Base.connection.close
    end

    threads.each { |thr| thr.join }    
  end

end

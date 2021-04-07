class Transaction

  class << self

    def create
      Transaction.new
    end

  end

  def deposit(money)
    money
  end

end
require_relative 'transaction'
require_relative 'statement'

class Account 

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount, transaction = Transaction.create)
    @balance += transaction.deposit(amount)
  end

end
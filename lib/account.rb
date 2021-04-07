require_relative 'transaction'
require_relative 'statement'

class Account 

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(money, transaction = Transaction.create)
    @balance += transaction.deposit(money)
  end

  def withdraw(money, transaction = Transaction.create )
    @balance += transaction.withdraw(money)
  end

end
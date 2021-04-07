require_relative 'transaction'
require_relative 'statement'

class Account
  MINIMUM_BALANCE = 0

  attr_reader :balance

  def initialize(balance = 0, statement = Statement)
    @statement = Statement.create
    @balance = balance
  end

  def deposit(money, transaction = Transaction.create)
    @balance += transaction.deposit(money)
  end

  def withdraw(money, transaction = Transaction.create)
    if @balance > money 
      @balance += transaction.withdraw(money)
    else
      raise 'Your account cannot go below £0'
    end
  end

end
require_relative 'transaction'
require_relative 'statement'

class Account
  MINIMUM_BALANCE = 0

  attr_reader :balance, :statement

  def initialize(balance = 0, statement = Statement)
    @statement = Statement.create
    @balance = balance
  end

  def deposit(money, transaction = Transaction.create)
    @balance += transaction.deposit(money)
    add_to_statement(credit = money, debit = nil, @balance)
  end

  def withdraw(money, transaction = Transaction.create)
    if @balance > money 
      @balance += transaction.withdraw(money)
      add_to_statement(credit = nil, debit = money, @balance)
    else
      raise 'Your account cannot go below £0'
    end
  end

  def add_to_statement(credit, debit, balance)
    @statement.store_transaction(credit, debit, balance)
  end

  def return_statement
    @statement.return_statement
  end

  def view_statement
    @statement.output_statement_to_user
  end

end
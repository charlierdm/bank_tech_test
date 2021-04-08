require_relative 'statement'

class Account
  MINIMUM_BALANCE = 0

  attr_reader :balance, :statement

  def initialize(balance = 0, statement = Statement)
    @statement = Statement.create
    @balance = balance
  end

  def deposit(money)
    @balance += money
    add_to_statement(credit = '%.2f' % money, debit = nil, '%.2f' % @balance)
  end

  def withdraw(money)
    if @balance > money
      @balance -= money
      add_to_statement(credit = nil, debit = '%.2f' % money, '%.2f' % @balance)
    else
      raise 'Your account cannot go below £0'
    end
  end

  def add_to_statement(credit, debit, balance)
    @statement.store_transaction(credit, debit, balance)
  end

  def view_statement
    @statement.return_statement
  end

end

require_relative 'statement'

class Account
  
  attr_reader :balance, :transaction_history

  def initialize(balance = 0, statement = Statement.new)
    @balance = balance
    @statement = statement
    @transaction_history = []
  end

  def deposit(money)
    store_transaction(credit = '%.2f' % money, debit = nil, '%.2f' % @balance += money)
  end

  def withdraw(money)
    if @balance > money
      store_transaction(credit = nil, debit = '%.2f' % money, '%.2f' % @balance -= money)
    else
      raise 'Your account cannot go below £0'
    end
  end

  def store_transaction(date = Time.now.strftime('%d/%m/%Y'), credit, debit, balance)
    @transaction_history.push({ date: date, credit: credit, debit: debit, balance: balance })
  end

  def view_statement
    @statement.display_statement(@transaction_history)
  end

end

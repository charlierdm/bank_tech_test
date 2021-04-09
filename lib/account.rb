require_relative 'transaction'

class Account
  attr_reader :balance, :transaction_history

  def initialize(balance = 0)
    @balance = balance
    @transaction_history = []
  end

  def deposit(amount)
    @transaction_history << Transaction.new(credit = amount, debit = nil, @balance += amount)
  end

  def withdraw(amount)
    if @balance > amount
      @transaction_history << Transaction.new(credit = nil, debit = amount, @balance -= amount)
    else
      raise 'Your account cannot go below £0'
    end
  end

  def view_statement(transactions = @transaction_history)
    footer = transactions.reverse.map do |transaction|
      "#{transaction.date} || #{format_currency(transaction.credit)} || #{format_currency(transaction.debit)} || #{format_currency(transaction.balance)}"
    end
    puts "date || credit || debit || balance\n#{footer.join("\n")}"
  end
    
  def format_currency(amount)
    amount == nil ? amount : format('%.2f', amount) 
  end
end

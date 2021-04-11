require_relative 'transaction'

class Account
  attr_reader :balance, :transaction_history

  def initialize(balance = 0)
    @balance = balance
    @transaction_history = []
  end

  def deposit(amount, transaction = Transaction)
    @transaction_history << transaction.new(credit = amount, debit = nil, @balance += amount)
  end

  def withdraw(amount, transaction = Transaction)
    if @balance > amount
      @transaction_history << transaction.new(credit = nil, debit = amount, @balance -= amount)
    else
      raise 'Your account cannot go below £0'
    end
  end

  def view_statement
    footer = @transaction_history.reverse.map do |transaction|
      "#{transaction.date.strftime('%d/%m/%Y')} || #{format_currency(transaction.credit)} || #{format_currency(transaction.debit)} || #{format_currency(transaction.balance)}"
    end
    puts "date || credit || debit || balance\n#{footer.join("\n")}"
  end
    
  def format_currency(amount)
    amount == nil ? amount : format('%.2f', amount) 
  end
end

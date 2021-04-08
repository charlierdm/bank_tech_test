class Statement
  attr_reader :account_history

  class << self
    def create
      Statement.new
    end
  end

  def initialize
    @account_history = []
  end

  def store_transaction(date = Time.now.strftime('%d/%m/%Y'), credit, debit, balance)
    new_transaction = { date: date, credit: credit, debit: debit, balance: balance }
    @account_history.push(new_transaction)
  end

  def return_statement
    footer = @account_history.reverse.map do |transaction|
      "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
    puts "date || credit || debit || balance\n#{footer.join("\n")}"
  end
    
end

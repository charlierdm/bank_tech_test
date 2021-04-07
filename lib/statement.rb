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

  def store_transaction(credit, debit, balance)
    new_transaction = {date: Time.now.strftime("%d/%m/%Y"), credit: credit, debit: debit, balance: balance }
    @account_history.push(new_transaction)
  end

  def display_statement 
    header = "date || credit || debit || balance\n"
    footer = @account_history.map do |transaction|
      "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end

    header + footer.join("\n")
  end


end
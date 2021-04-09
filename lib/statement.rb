class Statement
  def display_statement(transaction_history)
    footer = transaction_history.reverse.map do |transaction|
      "#{transaction[:date]} || #{format_currency(transaction[:credit])} || #{format_currency(transaction[:debit])} || #{format_currency(transaction[:balance])}"
    end
    puts "date || credit || debit || balance\n#{footer.join("\n")}"
  end

  def format_currency(amount)
    if amount == nil 
      amount
    else
      format('%.2f', amount)
    end
  end
end

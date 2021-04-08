class Statement

  def display_statement(transaction_history)
    footer = transaction_history.reverse.map do |transaction|
      "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
    puts "date || credit || debit || balance\n#{footer.join("\n")}"
  end
    
end

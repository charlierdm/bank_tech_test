require 'statement'

describe Statement do
  it 'prints the users transactions in a readable format' do
    expect do
      subject.display_statement([{ date: '07/04/2021', credit: format('%.2f', 500), debit: nil,
                                   balance: format('%.2f', 500) }])
    end.to output("date || credit || debit || balance\n07/04/2021 || 500.00 ||  || 500.00\n").to_stdout
  end
end

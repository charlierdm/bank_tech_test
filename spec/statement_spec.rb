require 'statement'

describe Statement do

  it 'prints the users transactions in a readable format' do
    expect { subject.display_statement([{date: "07/04/2021", credit: '%.2f' % 500, debit: nil , balance: '%.2f' % 500}])}.to output("date || credit || debit || balance\n07/04/2021 || 500.00 ||  || 500.00\n").to_stdout
  end

end

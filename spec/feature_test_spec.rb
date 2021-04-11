require 'account'

describe 'user experience' do
  

  xit 'allows the user to make transactions and see their statement' do
    transaction_deposit = double('Transaction', date: "07/04/2021", credit: 500, debit: nil, balance: 1500)
    transaction_withdraw = double("Transaction", date: "07/04/2021", credit: nil, debit: 50, balance: 1450)
    Time.stub(:now).and_return(Time.mktime(2021, 4, 7))
    account = Account.new(400)
    expect(account.balance).to eq(400)
    allow(transaction_deposit).to receive(:new)
    account.deposit(500, transaction_deposit)
    allow(transaction_withdraw).to receive(:new)
    account.withdraw(50, transaction_withdraw)
    expect do
      account.view_statement
    end.to output("date || credit || debit || balance\n07/04/2021 ||  || 300.00 || 600.00\n07/04/2021 || 500.00 ||  || 900.00\n").to_stdout
  end
end

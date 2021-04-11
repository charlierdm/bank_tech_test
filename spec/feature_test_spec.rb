require 'account'

describe 'user experience' do
  let(:transaction) { class_double('Transaction') }

  xit 'allows the user to make transactions and see their statement' do
    Time.stub(:now).and_return(Time.mktime(2021, 4, 7))
    account = Account.new(400)
    expect(account.balance).to eq(400)
    allow(transaction).to receive(:new) { {date: "07/04/2021", credit: 500} }
    account.deposit(transaction)
    account.withdraw(transaction)
    expect do
      account.view_statement
    end.to output("date || credit || debit || balance\n07/04/2021 ||  || 300.00 || 600.00\n07/04/2021 || 500.00 ||  || 900.00\n").to_stdout
  end
end

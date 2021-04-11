require 'account'

describe Account do
  let(:account) { Account.new(1000) }
  let(:transaction) { class_double('Transaction') }


  it 'allows the user to set an initial balance instead of 0' do
    expect(account.balance).to eq(1000)
  end

  context 'creates a deposit' do
    it 'allows the user to create a deposit transaction' do
      allow(transaction).to receive(:new) { date = "07/04/2021", credit = 500, debit = nil, balance = 1500 }
      account.deposit(500 ,transaction)
      expect(account.balance).to eq(1500)
    end
  end

  context 'making a withdrawal' do
    it 'allows the user to create a withdrawal transaction' do
      allow(transaction).to receive(:new) { date = "07/04/2021", credit = nil, debit = 50, balance = 1500 }
      account.withdraw(50)
      expect(account.balance).to eq(950)
    end

    it 'raises an error if the user tries to withdraw more than is in their account' do
      expect { subject.withdraw(1001) }.to raise_error('Your account cannot go below £0')
    end
  end

  context 'tracking transaction history' do
    it 'adds a new transaction to transaction history' do
      expect { account.deposit(50) }.to change { account.transaction_history.length }.by(1)
    end
  end

  context 'diplays the transaction history to the user' do 
    xit 'prints the users transactions in a readable format' do
      transaction_withdraw = double("Transaction", date: "07/04/2021", credit: nil, debit: 50, balance: 1450)
      allow(transaction_withdraw).to receive(:new)
      account.withdraw(50, transaction_withdraw)
      expect do
        account.view_statement
      end.to output("date || credit || debit || balance\n07/04/2021 || 500.00 ||  || 500.00\n").to_stdout
    end
  end
end

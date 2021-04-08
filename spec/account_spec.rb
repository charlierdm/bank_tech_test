require 'account'

describe Account do
  let(:account) { Account.new(1000) }
  let(:transaction) { instance_double('Transaction') }
  let(:statement) { instance_double('Statement', account_history: []) }

  it 'allows the user to set an initial balance instead of 0' do
    expect(account.balance).to eq(1000)
  end

  context 'making a deposit' do
    before(:each) do
      allow(transaction).to receive(:deposit) { 50 }
    end

    it 'allows the user to create a deposit transaction' do
      account.deposit(50, transaction)
      expect(account.balance).to eq(1050)
    end
  end

  context 'making a withdrawal' do
    before(:each) do
      allow(transaction).to receive(:withdraw) { -50 }
    end

    it 'allows the user to create a withdrawal transaction' do
      account.withdraw(50, transaction)
      expect(account.balance).to eq(950)
    end

    it 'raises an error if the user tries to withdraw more than is in their account' do
      new_account = Account.new(40)
      expect { new_account.withdraw(50, transaction) }.to raise_error('Your account cannot go below £0')
    end
  end

  context 'accessing and updating the statement' do
    before(:each) do
      allow(transaction).to receive(:deposit) { 50 }
      allow(statement).to receive(:store_transaction) 
      allow(statement).to receive(:return_statement) {
                            "date || credit || debit || balance\n07/04/2021 || 100.00 ||  || 1100.00\n07/04/2021 ||  || 500.00 || 600.00"
                          }
    end

    xit 'adds a new transaction to the statement' do
      expect { account.deposit(credit = 50) }.to change { statement.account_history.length }.by(1)
    end

    it 'displays the transaction history to the user' do
      account.deposit(100)
      account.withdraw(500)
      expect { account.view_statement }.to output("date || credit || debit || balance\n07/04/2021 || 100.00 ||  || 1100.00\n07/04/2021 ||  || 500.00 || 600.00\n").to_stdout
    end
  end
end

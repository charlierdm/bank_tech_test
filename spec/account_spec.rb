require 'account'

describe Account do
  let(:account) { Account.new(1000) }
  let(:transaction) { instance_double("Transaction") }
  let(:statement) { instance_double("Statement", :account_history => []) }
    
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
      expect{ new_account.withdraw(50, transaction) }.to raise_error('Your account cannot go below £0')
    end

  end

  context 'updating statement' do

    before(:each) do
      allow(transaction).to receive(:deposit) { 50 }
      allow(statement).to receive(:store_deposit_transaction) { transaction }
    end

    xit 'adds a new transaction to the statement' do
      new_account = Account.new(1000, statement)
      expect{ account.deposit(50, transaction) }.to change { statement.account_history.length }.by(1)
    end
    
  end

end
require 'account'

describe Account do
  let(:statement) { instance_double('Statement')}
  let(:account) { Account.new(1000, statement) }

  it 'allows the user to set an initial balance instead of 0' do
    expect(account.balance).to eq(1000)
  end

  context 'creates a deposit' do
   
    it 'allows the user to create a deposit transaction' do
      account.deposit(50)
      expect(account.balance).to eq(1050)
    end
    
  end

  context 'making a withdrawal' do

    it 'allows the user to create a withdrawal transaction' do
      account.withdraw(50)
      expect(account.balance).to eq(950)
    end

    it 'raises an error if the user tries to withdraw more than is in their account' do
      new_account = Account.new(40, statement)
      expect { new_account.withdraw(50) }.to raise_error('Your account cannot go below £0')
    end

  end

  context 'tracking transaction history' do
    
    it 'adds a new transaction to transaction history' do
      expect { account.deposit(50) }.to change { account.transaction_history.length }.by(1)
    end

  end
  
end

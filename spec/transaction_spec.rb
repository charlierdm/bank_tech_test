require 'transaction'

describe Transaction do

  it 'returns the user specified amount of money for a deposit' do
    transaction = Transaction.create
    expect(transaction.deposit(50)).to eq(50)
  end
  
end
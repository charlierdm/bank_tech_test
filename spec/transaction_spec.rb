require 'transaction'

describe Transaction do
  let(:transaction) { transaction = Transaction.create }
    
  it 'returns the users input for a deposit' do
    expect(transaction.deposit(50)).to eq(50)
  end

  it 'returns the inverse of the users input for a withdrawal' do
    expect(transaction.withdraw(50)).to eq(-50)
  end
  
end
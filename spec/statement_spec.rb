require 'statement'

describe Statement do

  it 'stores a users transactions in the account history' do
    expect{ subject.store_transaction(credit = 100, debit = nil, balance = 1100) }.to change { subject.account_history.length }.by(1)
  end

  it 'stores multiple, individual transactions' do
    subject.store_transaction(credit = 100, debit = nil, balance = 1100)
    subject.store_transaction(credit = 200, debit = nil, balance = 1300)
    expect(subject.account_history.length).to be(2)
    expect(subject.account_history[0][:balance]).not_to eq(subject.account_history[1][:balance])
  end
  
end
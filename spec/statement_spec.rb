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

  it 'prints the users transactions in a readable format' do
    statement = Statement.new
    statement.store_transaction(credit = 100, debit = nil, balance = 1100)
    statement.store_transaction(credit = nil, debit = 500, balance = 600)
    expect(statement.display_statement).to eq("date || credit || debit || balance\n07/04/2021 || 100 ||  || 1100\n07/04/2021 ||  || 500 || 600")
  end
  
end
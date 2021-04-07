require 'statement'

describe Statement do

  it 'stores a users transactions in the account history' do
    expect{ subject.store_transaction(credit = 100, debit = nil, balance = 1100) }.to change { subject.account_history.length }.by(1)
  end

  it 'stores the correct date of the users transcation' do
    statement = Statement.new
    statement.store_transaction(credit = 100, debit = nil, balance = 1100)
    expect(statement.account_history[0][:date]).to eq(Time.now.strftime("%d/%m/%Y"))
  end
  
end
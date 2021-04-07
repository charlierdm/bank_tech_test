require 'account'

describe Account do
  
  it 'allows the user to set an initial balance' do
    account = Account.new(1000)
    expect(account.balance).to eq(1000)
  end

end
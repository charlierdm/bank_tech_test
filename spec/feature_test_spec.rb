require 'account'

describe 'user experience' do

  it 'allows the user to make transactions and see their statement' do
    Time.stub(:now).and_return(Time.mktime(2021,4,7))
    account = Account.new(400)
    expect(account.balance).to eq(400)
    account.deposit(500)
    account.withdraw(300)
    expect{ account.view_statement }.to output("date || credit || debit || balance\n07/04/2021 ||  || 300.00 || 600.00\n07/04/2021 || 500.00 ||  || 900.00\n").to_stdout
  end

end



=begin
> takeaway = Takeaway.new
> takeaway.print_menu
Dish 1: 5 pounds
Dish 2: 3 pounds
> takeaway.add_to_basket("Dish 1")
> takeaway.total
5
Then your RSpec test could take all of those same commands and test their output and that the final total is 5. There is no need to start an IRB in a terminal or anything like that:
it "allows a user to see a menu, order dishes and see their order total" do
  takeaway = Takeaway.new
  expect(takeaway.print_menu).to # exercise for the reader: fill in something here to check the output of print_menu
  takeaway.add_to_basket("Dish 1")
  expect(takeaway.total).to eq(5)
end
=end
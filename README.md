# bank_tech_test

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)


![ethical banking](https://user-images.githubusercontent.com/75075773/113856124-ba383100-9798-11eb-95de-e7d7e43e7e4a.jpg)

## task

 To complete a banking tech test within a short time frame. 
 The idea for this week of Makers Academy is to focus on code quality, making sure that I am practicing the principles learnt through previous weeks such as SRP(single responsibility principle) and DRY(don't repeat yourself) as well as following effective Object Orientated Design methods and a TDD workflow for each step of the development. 

## acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

```

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

```

Edge case: The client has not asked for an overdraft feature, I have included it as a safe guard against users being able to withdraw more than they have as a safety measure before discussing with the client.

<img width="894" alt="Screenshot 2021-04-09 at 09 00 40" src="https://user-images.githubusercontent.com/75075773/114149595-fd1e1400-9912-11eb-9ba1-46db26f3aa79.png">


## user stories

```
As a user,
So I can store my money in my bank account,
I’d like to be able to make a deposit.

As a user, 
So I can access money in my bank account,
I’d like to be able to make a withdrawal.

As a user,
So I can keep track of what state my account is in,
I’d like to see an account statement which details transactions and their respective dates as well as my current balance.
```

## how to use

```
Fork and clone this repo, then run the following in the command line once in this projects directory.
$ bundle install
$ irb
$ require './lib/account'
```

```
To interact with your account in your command line, run the following:
$ account = Account.new(your_starting_balance, eq: 1000)
$ account.deposit(500)  | deposit however much you like |
$ account.withdraw(500) | withdraw, as long as you have it in your account|
$ account.view_statement | view your transaction history |

```

```
To run the tests using RSpec enter the following in your command line:
$ rspec

Test coverage = 100% (Simplecov)

```

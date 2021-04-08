# bank_tech_test

[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="114" height="20" role="img" aria-label="coverage: 95.19%"><title>coverage: 95.19%</title><linearGradient id="s" x2="0" y2="100%"><stop offset="0" stop-color="#bbb" stop-opacity=".1"/><stop offset="1" stop-opacity=".1"/></linearGradient><clipPath id="r"><rect width="114" height="20" rx="3" fill="#fff"/></clipPath><g clip-path="url(#r)"><rect width="61" height="20" fill="#555"/><rect x="61" width="53" height="20" fill="#4c1"/><rect width="114" height="20" fill="url(#s)"/></g><g fill="#fff" text-anchor="middle" font-family="Verdana,Geneva,DejaVu Sans,sans-serif" text-rendering="geometricPrecision" font-size="110"><text aria-hidden="true" x="315" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="510">coverage</text><text x="315" y="140" transform="scale(.1)" fill="#fff" textLength="510">coverage</text><text aria-hidden="true" x="865" y="150" fill="#010101" fill-opacity=".3" transform="scale(.1)" textLength="430">95.19%</text><text x="865" y="140" transform="scale(.1)" fill="#fff" textLength="430">95.19%</text></g></svg>


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
$ **bundle install**
$ **irb**
$ **require './lib/account'**
```

```
To interact with your account in your command line, run the following:
$ **account = Account.new**(your_starting_balance, eq: 1000)
$ **account.deposit(500)**  | deposit however much you like |
$ **account.withdraw(500)** | withdraw, as long as you have it in your account|
$ **account.view_statement** | view your transaction history |

```

```
To run the tests using RSpec enter the following in your command line:
$ **rspec**

Test coverage = 96.08% (Simplecov)

```
class Account
  def credit(amount)
    @balance = amount
  end
  def balance
    @balance
  end
  def debit(amount)
    @balance -= amount
  end
end

class Teller
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end
  def withdraw_from(account, amount)
    account.debit(amount)
    @cash_slot.dispense(amount)
  end
end

class CashSlot
  def contents
    @contents or raise("I'm empty!")
  end
  def dispense(amount_to_dispense)
    @contents = amount_to_dispense
  end
end

require 'sinatra'
get '/' do
  %{
    <html>
      <body>
        <form action="/withdraw" method="post">
          <label for="amount">Amount</label>
          <input type="text" id="amount" name="amount">
          <button type="submit">Withdraw</button>
        </form>
      </body>
    </html>
  }
end

set :cash_slot, CashSlot.new
post '/withdraw' do
  teller = Teller.new(settings.cash_slot)
  fail "I don't know how to withdraw yet, sorry"
end
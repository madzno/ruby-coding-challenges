require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def test_accept_money
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(25)
    transaction.amount_paid = 50
    cash_register.accept_money(transaction)
    assert_equal(150, cash_register.total_money)
  end

  def test_change
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(25)
    transaction.amount_paid = 50
    assert_equal(25, cash_register.change(transaction))
  end

  def test_give_receipt
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(50)
    assert_output(/You've paid \$50.\n/) do
      cash_register.give_receipt(transaction)
    end
  end
end

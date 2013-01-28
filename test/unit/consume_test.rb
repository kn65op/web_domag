require 'test_helper'

class ConsumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Add new" do
    consume = Consume.new
    consume.thing_instance = thing_instances(:one_beer1)
    consume.amount = 1;
    consume.user = users(:one)
    consume.date = Date.today
    assert consume.save, "Not saved"
  end


end

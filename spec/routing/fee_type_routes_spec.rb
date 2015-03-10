require "rails_helper"

RSpec.describe "FeeType", type: :routing do
  it 'routes /fee/:id/:amount to fee_type#amount', type: :routing do
    expect(get: '/fee/one/100').to route_to(
      controller: 'fee_types',
      action: 'amount',
      id: 'one',
      amount: '100'
    )
  end
end

require "rails_helper"

RSpec.describe 'Fee', type: :routing do
  it 'routes /fee/:id/:amount to fee#amount', type: :routing do
    expect(get: '/fee/one/100').to route_to(
      controller: 'fees',
      action: 'amount',
      id: 'one',
      amount: '100'
    )
  end
end

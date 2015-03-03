require "rails_helper"

RSpec.describe "routing to profiles", type: :routing do
  it "routes /statutory_instrument/:id to statutory_instruments#show", type: :routing do
    expect(:get => "/statutory_instrument/1").to route_to(
      controller: "statutory_instruments",
      action: "show",
      id: "1"
    )
  end
end

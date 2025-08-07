require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it 'is valid with a title, description, and status' do
    ticket = Ticket.new(
      title: 'Sample ticket',
      description: 'A test ticket',
      status: 'open'
    )
    expect(ticket).to be_valid
  end
end

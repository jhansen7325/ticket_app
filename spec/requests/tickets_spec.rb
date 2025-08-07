require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  # Create a ticket in the test database before each example
  let!(:ticket) do
    Ticket.create!(
      title: "Test ticket",
      description: "This is a test",
      status: "open"
    )
  end

  describe "GET /tickets" do
    it "returns HTTP success and lists tickets" do
      get tickets_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Test ticket")
    end
  end

  describe "GET /tickets/:id" do
    it "returns HTTP success and shows the ticket" do
      get ticket_path(ticket)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("This is a test")
    end
  end
end

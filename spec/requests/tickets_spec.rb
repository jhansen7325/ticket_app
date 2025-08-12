require 'rails_helper'

RSpec.describe "Tickets", type: :request do
  # Seed one ticket for read/update/delete paths
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

  describe "POST /tickets" do
    context "with valid params" do
      it "creates a ticket and redirects to show" do
        expect {
          post tickets_path, params: { ticket: { title: "New", description: "X", status: "open" } }
        }.to change(Ticket, :count).by(1)

        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(ticket_path(Ticket.last))
        follow_redirect!
        expect(response.body).to include("New")
      end
    end

    context "with invalid params" do
      it "does not create and re-renders with 422" do
        expect {
          post tickets_path, params: { ticket: { title: "", description: "X", status: "open" } }
        }.not_to change(Ticket, :count)

        expect(response).to have_http_status(:unprocessable_content)
        expect(response.body).to match(/can(?:'|&#39;)t be blank/)
      end
    end
  end

  describe "PATCH /tickets/:id" do
    it "updates and redirects" do
      patch ticket_path(ticket), params: { ticket: { status: "resolved" } }
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(ticket_path(ticket))
      ticket.reload
      expect(ticket.status).to eq("resolved")
    end

    it "rejects invalid status with 422" do
      patch ticket_path(ticket), params: { ticket: { status: "bogus" } }
      expect(response).to have_http_status(:unprocessable_content)
      expect(ticket.reload.status).to eq("open")
      expect(response.body).to include("is not included in the list")
    end
  end

  describe "DELETE /tickets/:id" do
    it "destroys and redirects to index" do
      expect {
        delete ticket_path(ticket)
      }.to change(Ticket, :count).by(-1)

      expect(response).to have_http_status(:see_other)
      expect(response).to redirect_to(tickets_path)
    end
  end
end

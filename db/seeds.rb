# db/seeds.rb
Ticket::STATUSES.each_with_index do |st, i|
  Ticket.find_or_create_by!(title: "Seeded Ticket #{i + 1}") do |t|
    t.description = "Created by seeds in #{Rails.env}"
    t.status = st
  end
end
puts "Seeded #{Ticket.count} tickets in #{Rails.env}."

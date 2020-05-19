require 'rails_helper'

describe 'Can find phoenix members' do
  it 'from members of a house' do
    visit root_path
    select "Gryffindor", from: "house"
    click_on "Search For Member"

    expect(current_path).to eq("/search")
    expect(page).to have_content("Total Members: 21")

    within("ul#AberforthDumbledore") do
      expect(page).to have_content("Name: Aberforth Dumbledore")
      expect(page).to have_content("Role: Owner, Hog's Head Inn")
      expect(page).to have_content("House: Gryffindor")
      expect(page).to have_content("Patronus: goat")
    end
  end
end

describe Tournament do

  let(:tourn) {Tournament.create(name: "test", num_players: 4, status: "Pending")}
  let(:round){Round.create(num:1, tournament: tourn,status: "pending" )}
  it "complete tournament works" do
    expect(tourn.status).to eq("Pending")
    tourn.complete_torn
    expect(tourn.status).to eq("Completed")
  end


end

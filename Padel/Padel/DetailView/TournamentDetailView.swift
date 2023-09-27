//
//  TournamentDetailView.swift
//  Padel
//
//  Created by Tommy Bakkane on 18/09/2023.
//
import SwiftUI

struct TournamentDetailView: View {
    @EnvironmentObject var tournaments: Tournaments
    @State private var isShowingPopup: Bool = false
    @State var team1: [Player] = []
    @State var team2: [Player] = []
    @State var combinedTeamPoints: Int = 0
    var tournament: Tournament
    
    init(tournament: Tournament) {
        self.tournament = tournament
    
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            TitleView(tournament: tournament)
            
            TournamentDetailRoundView(
                combinedTeamPoints: $combinedTeamPoints,
                tournament: tournament
            )
            
            PointboardView(
                team1: $team1,
                team2: $team2,
                combinedTeamPoints: $combinedTeamPoints,
                tournament: tournament
            )
            
            Spacer()
            
        }
        .padding()
        .frame(minHeight: 0, alignment: .top)
        .onAppear{
            assignTeams()
        }
    }
    
    private func assignTeams(){
        guard tournament.players.count >= 4 else {
            return
        }
        team1 = Array(tournament.players.prefix(2))
        team2 = Array(tournament.players.dropFirst(2))
    }
}



struct TournamentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let tournaments = Tournaments()
        return TournamentDetailView(tournament: Tournament(name: "NameTest", mode: "ModeTest", pointPerRound: 32, players: [Player.init(name: "Tommy", points: 0), Player.init(name: "Tommy", points: 0), Player.init(name: "Tommy", points: 0), Player.init(name: "Tommy", points: 0)]))
            .environmentObject(tournaments)
    }
}



//
//  TournamentViewModel.swift
//  Padel
//
//  Created by Tommy Bakkane on 27/09/2023.
//

import Combine

class TournamentViewModel: ObservableObject {
    @Published var team1: [Player] = []
    @Published var team2: [Player] = []
    @Published var team1Score = 0
    @Published var team2Score = 0
    @Published var combinedTeamPoints: Int = 0
    @Published var isSheetPresented = false
    
    var tournament: Tournament
    
    init(tournament: Tournament){
        self.tournament = tournament
    }
    
    func assignTeams(){
        guard tournament.players.count >= 4 else {
            return
        }
        team1 = Array(tournament.players.prefix(2))
        team2 = Array(tournament.players.dropFirst(2))
    }
}

//
//  ListTournamentView.swift
//  Padel
//
//  Created by Tommy Bakkane on 06/09/2023.
//

import SwiftUI

struct ListTournamentView: View {
    
    var tournament: Tournament
    @EnvironmentObject var tournaments: Tournaments
    
    var body: some View {
            ZStack{
                Rectangle()
                    .foregroundColor(.blue)
                    .cornerRadius(20)
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text(tournament.name)
                            .font(.title)
                        Text(tournament.mode)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    }
                    
                    HStack{
                        Text("Players: \(tournament.players.count)")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                        Text("Rounds: 6")
                    }
                    
                }
                .frame(height: 150)
                .padding(EdgeInsets(top: 0, leading: -125, bottom: 0, trailing: 0))
                .foregroundColor(.white)
                
            }
            .contextMenu{
                Button(action: {
                    tournaments.remove(tournament)
                }){
                    Text("Delete")
                    Image(systemName: "trash")
                }
            }
        }
}

struct ListTournamentView_Previews: PreviewProvider {
    static var previews: some View {
        ListTournamentView(tournament: Tournament(name: "NameTest", mode: "ModeTest", pointPerRound: 32, players: [Player.init(name: "Tommy", points: 0)]))
            .environmentObject(Tournaments())
    }
}

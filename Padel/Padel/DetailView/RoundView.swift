//
//  TournamentDetailRoundView.swift
//  Padel
//
//  Created by Tommy Bakkane on 27/09/2023.
//

import SwiftUI

struct TournamentDetailRoundView: View {
    @State private var rounds: [String] = ["1"]
    @State private var newRound: Int = 2
    @Binding var combinedTeamPoints: Int
    var tournament: Tournament
    
    var body: some View{
        
        Section(header: Text("Rounds:")){
            ScrollView(.horizontal){
                HStack{
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                        ForEach(rounds, id: \.self) { round in
                            Text(round)
                                .font(.title)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    }
                }
                
            }
        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
    }
}

//struct TournamentDetailRoundView_Previews: PreviewProvider {
//    @State private var combinedTeamPoints: Int = 0
//
//    static var previews: some View {
//        TournamentDetailRoundView(combinedTeamPoints: combinedTeamPoints, tournament: Tournament())
//            .environmentObject(Tournaments())
//    }
//}

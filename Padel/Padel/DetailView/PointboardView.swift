//
//  TournamentDetailPointboardView.swift
//  Padel
//
//  Created by Tommy Bakkane on 27/09/2023.
//

import SwiftUI

struct PointboardView: View {
    @Binding var team1: [Player]
    @Binding var team2: [Player]
    @Binding var combinedTeamPoints: Int
    @State var team1Score = 0
    @State var team2Score = 0
    @State var isSheetPresented = false
    
    var tournament: Tournament
    
    
    var body : some View{
        if !team1.isEmpty && !team2.isEmpty {
            VStack {
                HStack {
                    Text("\(team1Score)")
                        .font(.largeTitle)
                    
                    Text("VS")
                        .font(.subheadline)
                    
                    Text("\(team2Score)")
                        .font(.largeTitle)
                }
                .frame(maxWidth: .infinity)
                
                HStack {
                    VStack {
                        ForEach(team1, id: \.id) { player in
                            Text(player.name)
                                .font(.title2)
                        }
                        .padding(10)
                        .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        ForEach(team2, id: \.id) { player in
                            Text(player.name)
                                .font(.title2)
                        }
                        .padding(10)
                        .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
        }
        
        HStack{
            Spacer()
            AddPointsSheetView(
                team1: $team1,
                team2: $team2,
                team1Score: $team1Score,
                team2Score: $team2Score,
                combinedTeamPoints: $combinedTeamPoints,
                tournament: tournament
            )
            Spacer()
        }
    }
}

struct AddPointsSheetView: View {
    @Binding var team1: [Player]
    @Binding var team2: [Player]
    @Binding var team1Score: Int
    @Binding var team2Score: Int
    @Binding var combinedTeamPoints: Int
    var tournament: Tournament
    @State var isSheetPresented = false
    
    var maxPoints: Int {
        return tournament.pointPerRound
    }
    
    
    
    var body: some View {
        HStack {
            Button("Add Score") {
                isSheetPresented.toggle()
            }
            .font(.largeTitle)
            .sheet(isPresented: $isSheetPresented, content: {
                VStack {
                    HStack{
                        Spacer()
                        Text("Max Points: \(maxPoints)")
                        Spacer()
                    }
                    HStack {
                        Text("Team 1")
                            .font(.largeTitle)
                        Spacer()
                        Button(action: {
                            if team1Score == 0 {
                                team1Score = 0
                            }else{
                                team1Score -= 1
                            }
                        }) {
                            Image(systemName: "minus.circle")
                                .font(.largeTitle)
                        }
                        
                        Text("\(team1Score)")
                            .font(.largeTitle)
                        
                        Button(action: {
                            if team1Score + 1 + team2Score <= maxPoints{
                                team1Score += 1
                            }
                        }) {
                            Image(systemName: "plus.circle")
                                .font(.largeTitle)
                        }
                    }
                    .padding()
                    HStack {
                        Text("Team 2")
                            .font(.largeTitle)
                        Spacer()
                        Button(action: {
                            if team2Score == 0 {
                                team2Score = 0
                            }else{
                                team2Score -= 1
                            }
                        }
                        ){
                            Image(systemName: "minus.circle")
                                .font(.largeTitle)
                        }
                        
                        Text("\(team2Score)")
                            .font(.largeTitle)
                        
                        Button(action: {
                            if team2Score + 1 + team1Score <= maxPoints{
                                team2Score += 1
                            }
                        }) {
                            Image(systemName: "plus.circle")
                                .font(.largeTitle)
                        }
                    }
                    .padding()
                    
                    HStack {
                        Spacer()
                        
                        Button("Cancel") {
                            team1Score = 0
                            team2Score = 0
                            isSheetPresented = false
                        }
                        .font(.title)
                        
                        Spacer()
                        
                        Button("Done") {
                            if team1Score + team2Score == maxPoints {
                                combinedTeamPoints = team1Score + team2Score
                                
                                for index in 0..<team1.count {
                                    team1[index].points += team1Score
                                }
                                
                                for index in 0..<team2.count {
                                    team2[index].points += team2Score
                                }
                            }
                            
                            isSheetPresented = false
                        }
                        .font(.title)
                        
                        Spacer()
                    }
                    .padding()
                }
            })
        }
    }
}


struct TournamentDetailPointboardView_Previews: PreviewProvider {
    static var previews: some View {
        TournamentDetailView(tournament: Tournament(name: "NameTest", mode: "ModeTest", pointPerRound: 32, players: [Player.init(name: "Tommy", points: 0), Player.init(name: "Tommy", points: 0), Player.init(name: "Tommy", points: 0), Player.init(name: "Tommy", points: 0)]))
    }
}


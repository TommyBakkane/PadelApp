//
//  CreateTournamentView.swift
//  Padel
//
//  Created by Tommy Bakkane on 06/09/2023.
//

import SwiftUI

struct CreateTournamentView: View {
    
    @EnvironmentObject var tournaments: Tournaments
    
    @State private var tournamentName: String = ""
    @State private var tournamentMode = "Americano"
    @State private var pointsPerRound: Int = 8
    @State private var newPlayerName: String = ""
    @State private var playerNames: [String] = []
    @State private var players: [Player] = []
    
    private let modes = ["Americano", "Mexicano"]
    private let pointOptions: [Int] = [8, 16, 21, 24, 32, 40]
    
    @State private var showCreatePlayerAlert: Bool = false
    @State private var isCreatingTournament = false
    @State private var isAddingPlayer = false
    @State private var showErrorAlert = false
    
    
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Name")){
                    TextField("Enter Tournament Name:", text: $tournamentName)
                }
                
                Section(header: Text("Game Mode")){
                    Picker("Select Game Mode", selection: $tournamentMode){
                        ForEach(modes, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Points per Round")){
                    Picker("Points Per Round", selection: $pointsPerRound){
                        ForEach(pointOptions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Players")){
                    ForEach(playerNames, id: \.self){ playerNames in
                        Text(playerNames)
                    }
                    
                    TextField("Name", text: $newPlayerName)
                        .foregroundColor(.black)
                    
                    Button("Add Player"){
                        if !newPlayerName.isEmpty{
                            playerNames.append(newPlayerName)
                            newPlayerName = ""
                        }
                    }
                    .foregroundColor(.black)
                }
                    
                HStack{
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.blue.opacity(0.7))
                            .frame(width: 100)
                        Button("Create") {
                            if tournamentName.isEmpty || tournamentMode.isEmpty || playerNames.isEmpty {
                                showErrorAlert = true
                            } else {
                                let lastPlayer = Player(name: newPlayerName, points: 0)
                                let players = playerNames.map { Player(name: $0, points: 0)} + [lastPlayer] 
                                let newTournament = Tournament(
                                    name: tournamentName, mode: tournamentMode, pointPerRound: pointsPerRound, players: players
                                )
                                tournaments.add(newTournament)
                                isCreatingTournament = true
                            }
                        }
                        .disabled(tournamentName.isEmpty || tournamentMode.isEmpty || playerNames.isEmpty)
                        .foregroundColor(.white)
                        .alert(isPresented: $showErrorAlert) {
                            Alert(
                                title: Text("Error"),
                                message: Text("Please fill in all required fields"),
                                dismissButton: .default(Text("Ok"))
                            )
                        }
                    }
                    Spacer()
                }
                
            }
            .scrollContentBackground(.hidden)
            .foregroundColor(.black)
                        
            
            // Form Ending
            NavigationLink("", destination: MainView(), isActive: $isCreatingTournament).opacity(0)
        }
        .navigationTitle("New Tournament")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CreateTournamentView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTournamentView()
            .environmentObject(Tournaments())
    }
}

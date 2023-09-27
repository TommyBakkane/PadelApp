//
//  MainView.swift
//  Padel
//
//  Created by Tommy Bakkane on 18/09/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var tournaments: Tournaments
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach(tournaments.tournaments){tournament in
                    HStack(){
                        NavigationLink{
                            TournamentDetailView(tournament: tournament)
                        }label:{
                            ListTournamentView(tournament: tournament)
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        Spacer()
                    }.foregroundColor(.black)
                }
                
                NavigationLink("Create New Tournament", destination: CreateTournamentView())
                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                
            }.navigationTitle("Padel")
        }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Tournaments())
    }
}

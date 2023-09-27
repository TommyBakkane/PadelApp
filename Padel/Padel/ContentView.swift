//
//  ContentView.swift
//  Padel
//
//  Created by Tommy Bakkane on 06/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var tournaments = Tournaments()
    
    
    var body: some View {
        NavigationView{
            TabView{
                MainView()
                    .tabItem {
                        Label("Touraments", systemImage: "figure.tennis")
                    }
                Text("Leaderboard")
                    .tabItem{
                        Label("Leaderboard", systemImage: "list.bullet")
                    }
                Text("Settings")
                    .tabItem {
                        Label("Settings", systemImage: "pencil")
                    }
            }
            .environmentObject(tournaments)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Tournaments())
    }
}

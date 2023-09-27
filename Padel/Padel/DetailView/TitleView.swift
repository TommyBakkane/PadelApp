//
//  TournamentDetailTitleView.swift
//  Padel
//
//  Created by Tommy Bakkane on 27/09/2023.
//

import SwiftUI

struct TitleView: View {
    var tournament: Tournament
    
    var body: some View{
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading){
                Text(tournament.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(tournament.mode)
                    .font(.subheadline)
                
                Text("Points Per Round: \(tournament.pointPerRound)")
                    .font(.subheadline)
            }
        }
    }
}


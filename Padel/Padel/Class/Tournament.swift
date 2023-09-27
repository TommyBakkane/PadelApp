//
//  Tournament.swift
//  Padel
//
//  Created by Tommy Bakkane on 06/09/2023.
//

import Foundation

class Tournament: Identifiable, Codable {
    
    var id: UUID;
    var name: String;
    var mode: String;
    var pointPerRound: Int;
    var players: [Player];
    
    init(name: String, mode: String, pointPerRound: Int, players: [Player]) {
        self.id = UUID()
        self.name = name
        self.mode = mode
        self.pointPerRound = pointPerRound
        self.players = players
    }
}



@MainActor class Tournaments: ObservableObject{
    @Published var tournaments: [Tournament]
    
    let saveKey = "SavedData"
    
    init(){
        if let data = UserDefaults.standard.data(forKey: saveKey){
            if let decoded = try? JSONDecoder().decode([Tournament].self, from: data){
                tournaments = decoded
                return
            }
        }
        tournaments = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(tournaments){
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func add(_  tournament: Tournament){
        tournaments.append(tournament)
        save()
    }
    
    func toggle(_ tournament: Tournament){
        objectWillChange.send()
        save()
    }
    
    func remove(_ tournament: Tournament){
        if let index = tournaments.firstIndex(where: {$0.id == tournament.id}){
            tournaments.remove(at: index)
            save()
        }
    }
}



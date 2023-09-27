//
//  Player.swift
//  Padel
//
//  Created by Tommy Bakkane on 20/09/2023.
//

import Foundation

class Player: Identifiable, Codable, Hashable, Equatable{
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.points == rhs.points
    }
    
    
    var id: UUID;
    var name: String;
    var points: Int;
    
    init(name: String, points: Int) {
        self.id = UUID()
        self.name = name
        self.points = points
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(points)
    }
}

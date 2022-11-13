//
//  GameModel.swift
//  ggTracker
//
//  Created by Siobahn Devlin on 11/7/22.
//

import Foundation

struct Game: Codable {
    var id: Int
    var name: String
    var rating: Double
    var summary: String
    var release_date: Int?
    var cover: Int
}

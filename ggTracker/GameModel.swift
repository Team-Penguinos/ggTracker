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

struct Cover: Codable {
    var game: Int
    var image_id: String
    var url: String
    var width: Int
    var height: Int
}


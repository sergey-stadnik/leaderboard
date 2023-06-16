//
//  LeaderDisplayModel.swift
//  leaderboard
//
//  Created by Sergii Stadnyk on 16.06.2023.
//

import Foundation

struct LeaderDisplayModel: Identifiable {
    let id = UUID()

    let firstName: String
    let lastName: String
    let rating: Int = Int.random(in: 0..<36)
    let imageName: String = "person.crop.circle.fill.badge.questionmark.ar"
}

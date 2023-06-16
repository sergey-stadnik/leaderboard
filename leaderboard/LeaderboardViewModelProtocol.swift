//
//  LeaderboardViewModelProtocol.swift
//  leaderboard
//
//  Created by Sergii Stadnyk on 16.06.2023.
//

import Foundation

protocol LeaderboardViewModelProtocol: ObservableObject {
    var leaderboardType: LeaderboardType { get set }
    var leaders: [LeaderDisplayModel] { get }
}

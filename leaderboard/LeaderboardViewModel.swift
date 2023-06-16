//
//  LeaderboardViewModel.swift
//  leaderboard
//
//  Created by Sergii Stadnyk on 16.06.2023.
//

import Foundation

enum LeaderboardType: Int {
    case region = 0
    case national = 1
    case global = 2

    var description: String {
        var result: String = ""

        switch self {
        case .region:
            result = "Region"
        case .national:
            result = "National"
        case .global:
            result = "Global"
        }

        return result
    }
}

final class LeaderboardViewModel: LeaderboardViewModelProtocol {
    @Published var leaderboardType: LeaderboardType = .region {
        didSet {
            switch leaderboardType {
            case .region:
                leaders = [
                    LeaderDisplayModel(firstName: "John", lastName: "Smith"),
                    LeaderDisplayModel(firstName: "Gabriella", lastName: "Phelps"),
                    LeaderDisplayModel(firstName: "Mia", lastName: "Simon"),
                    LeaderDisplayModel(firstName: "Katie", lastName: "Hensley")
                ]
            case .national:
                leaders = [
                    LeaderDisplayModel(firstName: "Stella", lastName: "Cline"),
                    LeaderDisplayModel(firstName: "Jimmy", lastName: "Wang"),
                    LeaderDisplayModel(firstName: "Montgomery", lastName: "Wilson"),
                    LeaderDisplayModel(firstName: "Tomasz", lastName: "Sandoval")
                ]
            case .global:
                leaders = [
                    LeaderDisplayModel(firstName: "Deacon", lastName: "Becker"),
                    LeaderDisplayModel(firstName: "Dan", lastName: "Stark"),
                    LeaderDisplayModel(firstName: "Mia", lastName: "Simon"),
                    LeaderDisplayModel(firstName: "Arthur", lastName: "Carey")
                ]
            }
        }
    }
    @Published var leaders: [LeaderDisplayModel] = []
}

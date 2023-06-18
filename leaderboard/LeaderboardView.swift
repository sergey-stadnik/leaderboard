//
//  LeaderboardView.swift
//  leaderboard
//
//  Created by Sergii Stadnyk on 16.06.2023.
//

import SwiftUI

struct LeaderboardView<ViewModelType: LeaderboardViewModelProtocol>: View {

    @ObservedObject var viewModel: ViewModelType

    var body: some View {
        NavigationView {
            Form {
                VStack() {
                    Picker("", selection: $viewModel.leaderboardType) {
                        Text(LeaderboardType.region.description).tag(LeaderboardType.region)
                        Text(LeaderboardType.national.description).tag(LeaderboardType.national)
                        Text(LeaderboardType.global.description).tag(LeaderboardType.global)
                    }
                    .pickerStyle(.segmented)

                    HStack(alignment: .bottom) {
                        ratingView("Ellipse-2")
                            .padding()
                        ratingView("Rectangle", firstPosition: true)
                            .padding()
                        ratingView("Ellipse-4")
                            .padding()
                    }
                    .padding()

                    leaderboardList()
                }
                .onAppear {
                    viewModel.leaderboardType = .region
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Leaderboard")
        }
    }

    private func ratingView(_ imageName: String, firstPosition: Bool = false) -> some View {
        VStack {
            if firstPosition {
                Image("king")
                    .padding(.bottom, 20)
            }
            Image(imageName)
                .frame(width: 50, height: 50)
                .padding(.bottom, 20)

            if let randomLeader = viewModel.leaders.randomElement() {
                Text(randomLeader.firstName)
                Text(randomLeader.lastName)
                Text("\(randomLeader.rating)")
                    .padding(.top, 20)
            }
        }
    }

    private func leaderboardList() -> some View {
        List(viewModel.leaders) { item in
            HStack(alignment: .center) {
                Image(systemName: item.imageName)
                    .padding()

                VStack(alignment: .leading) {
                    Text(item.firstName)
                    Text(item.lastName)
                }

                Spacer()

                Text("\(item.rating)")
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(viewModel: LeaderboardViewModel())
    }
}

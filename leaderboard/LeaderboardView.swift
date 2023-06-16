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
                VStack(alignment: .leading) {
                    Picker("", selection: $viewModel.leaderboardType) {
                        Text(LeaderboardType.region.description).tag(LeaderboardType.region)
                        Text(LeaderboardType.national.description).tag(LeaderboardType.national)
                        Text(LeaderboardType.global.description).tag(LeaderboardType.global)
                    }
                    .pickerStyle(.segmented)

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
                .onAppear {
                    viewModel.leaderboardType = .region
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Leaderboard")
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(viewModel: LeaderboardViewModel())
    }
}

//
//  ProfileHeader.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/25/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

struct ProfileHeader: View {

    // MARK: Initializer
    public init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Stored Properties
    private let viewModel: ProfileViewModel

    // MARK: Configured View
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    self.viewModel.image
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .scaledToFit()
                        .frame(width: 200.0, height: 200.0)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .padding(.top, 20.0)
                        .padding(.bottom, 20.0)
                    Text(self.viewModel.name)
                        .font(.system(size: 20.0, weight: .bold))
                }
                Spacer()
            }
            Spacer()
        }
        .background(LinearGradient(
            gradient: self.viewModel.gradient,
            startPoint: UnitPoint.top,
            endPoint: UnitPoint.bottom
        ))
    }
}

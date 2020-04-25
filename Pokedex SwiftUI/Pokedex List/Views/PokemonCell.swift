//
//  PokemonCell.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

struct PokemonCell: View {

    // MARK: Initializer
    public init(viewModel: PokemonDataViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Stored Properties
    private let viewModel: PokemonDataViewModel

    // MARK: Configured Views
    var body: some View {
        HStack {
            self.viewModel.image
                .resizable()
                .scaledToFit()
                .frame(width: 75.0, height: 75.0)
            Spacer()
            VStack {
                Text(self.viewModel.name.uppercased())
                    .font(.system(size: 20.0, weight: .bold))
                    .padding(.bottom, 10.0)

                Text("HEIGHT: \(self.viewModel.height)")
                    .font(.system(size: 16.0))
                Text("WEIGHT: \(self.viewModel.weight)")
                    .font(.system(size: 16.0))
            }
            .padding(.top, 10.0)
            .padding(.bottom, 10.0)
            Spacer()
            Spacer()
        }
    }
}

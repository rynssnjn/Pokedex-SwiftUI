//
//  ProfileDetails.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

struct ProfileDetails: View {

    // MARK: Initializer
    public init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Stored Properties
    private let viewModel: ProfileViewModel

    // MARK: Configured Views
    var body: some View {
        VStack {
            HStack {
                VStack {
                    CharacteristicLabel(
                        characteristic: Characteristic.height,
                        value: self.viewModel.height,
                        color: self.viewModel.color
                    )
                    CharacteristicLabel(
                        characteristic: Characteristic.weight,
                        value: self.viewModel.weight,
                        color: self.viewModel.color
                    )
                }
                VStack {
                    CharacteristicLabel(
                        characteristic: Characteristic.id,
                        value: self.viewModel.id,
                        color: self.viewModel.color
                    )
                    CharacteristicLabel(
                        characteristic: Characteristic.type,
                        value: self.viewModel.types,
                        color: self.viewModel.color
                    )
                }
            }.padding()
            Text(self.viewModel.description).padding()
            Spacer()
        }
        .background(Color.white)
    }
}

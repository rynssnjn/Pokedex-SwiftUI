//
//  SegmentedChildView.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct SegmentedChildView: View {

    // MARK: Initializer
    public init(viewModel: DetailModel) {
        self.viewModel = viewModel
        self.setApperance()
    }

    // MARK: Stored Properties
    @State private var selectedIndex = 0
    private let viewModel: DetailModel

    // MARK: Configured View
    var body: some View {
        VStack {
            Picker("PokemonDetails", selection: self.$selectedIndex) {
                Text("Details").tag(0)
                Text("Stats").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 200.0, height: 50.0, alignment: Alignment.center)
            .shadow(radius: 10.0)

            if self.selectedIndex == 0 {
                ProfileHeader(viewModel: ProfileViewModel(model: self.viewModel))
                ProfileDetails(viewModel: ProfileViewModel(model: self.viewModel))
            } else {
                Text(self.viewModel.species.evolutionURL.absoluteString)
            }
        }
        .background(Color(PokemonType(rawValue: self.viewModel.pokemon.types.primaryType)!.color))
    }

    // MARK: Instance Methods
    private func setApperance() {
        let primaryColor: UIColor = PokemonType(rawValue: self.viewModel.pokemon.types.primaryType)!.color
        let appearance = UISegmentedControl.appearance()
        appearance.selectedSegmentTintColor = primaryColor
        appearance.backgroundColor = UIColor.white
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        appearance.setTitleTextAttributes([.foregroundColor: primaryColor], for: .normal)
    }
}

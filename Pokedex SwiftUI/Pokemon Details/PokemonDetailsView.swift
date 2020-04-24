//
//  PokemonDetailsView.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

struct PokemonDetailsView: View {

    private let details: DetailModels

    public init(details: DetailModels) {
        self.details = details
    }

    var body: some View {
        VStack {
            Text(self.details.pokemon.name)
            Text("\(self.details.pokemon.stats.specialAttack)")
            Text(self.details.species.text)
        }
    }
}


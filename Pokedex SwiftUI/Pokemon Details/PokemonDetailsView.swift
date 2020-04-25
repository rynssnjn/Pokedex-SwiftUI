//
//  PokemonDetailsView.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI
import Astral
import os

struct PokemonDetailsView: View {

    // MARK: Initializers
    public init(pokemon: PokemonData) {
        self.pokemon = pokemon
    }

    // MARK: Stored Properties
    private let pokemon: PokemonData

    // MARK: Configured View
    var body: some View {
        VStack {
            Text(self.pokemon.description)
        }
    }
}


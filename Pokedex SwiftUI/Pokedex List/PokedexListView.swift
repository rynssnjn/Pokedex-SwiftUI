//
//  PokedexListView.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI
import Astral

struct PokedexListView: View {

    // MARK: Initializers
    public init(pokemons: [PokemonData]) {
        self.pokemons = pokemons
    }

    // MARK: Stored Properties
    private let pokemons: [PokemonData]

    // MARK: Configured View
    var body: some View {
        NavigationView {
            List(self.pokemons) { pokemon in
                NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
                    PokemonCell(viewModel: PokemonDataViewModel(pokemonData: pokemon))
                }
            }
            .navigationBarTitle(Text("Pokemons"))
        }
    }
}

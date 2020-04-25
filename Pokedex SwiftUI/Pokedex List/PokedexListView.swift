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

    public init(pokemons: [PokemonData]) {
        self.pokemons = pokemons
    }

    @State var isLoading: Bool = false

    private let service: PokemonDetailService = PokemonDetailService()
    private let pokemons: [PokemonData]
    
    var body: some View {
        LoadingView(isShowing: .constant(self.isLoading)) {
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
}

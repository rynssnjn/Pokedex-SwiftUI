//
//  PokedexListView.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

struct PokedexListView: View {
    @State var pokemons: [PokemonData] = PokemonsCSVConverter().decodedPokemons
    var body: some View {
        List(self.pokemons) { pokemonData in
            Button(action: {
                print(pokemonData.name)
            }) {
                PokemonCell(viewModel: PokemonDataViewModel(pokemonData: pokemonData))
            }
        }
    }
}

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
    @State private var searchText: String = ""
    @State private var isSearching: Bool = false
    private let pokemons: [PokemonData]

    // MARK: Configured View
    var body: some View {
        NavigationView {
            List {
                if self.isSearching {
                    SearchBar(text: $searchText)
                }
                ForEach(self.pokemons.filter {
                    self.searchText.isEmpty
                        ? true
                        : $0.name.localizedCaseInsensitiveContains(self.searchText)
                    },
                    id: \.id
                ) { pokemon in
                    NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
                        PokemonCell(viewModel: PokemonDataViewModel(pokemonData: pokemon))
                    }
                }
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.isSearching = !self.isSearching
                    switch self.isSearching {
                        case true:
                            break
                        case false:
                            self.searchText = ""
                    }
                }) {
                    Image(self.isSearching ? "cancel" : "search")
                        .renderingMode(Image.TemplateRenderingMode.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25.0, height: 25.0)
                }
            )
            .navigationBarTitle(Text("Pokemons"))
        }
    }
}

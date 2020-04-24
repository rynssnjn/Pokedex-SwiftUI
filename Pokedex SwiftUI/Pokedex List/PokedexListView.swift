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
    @State var pokemons: [PokemonData] = PokemonsCSVConverter().decodedPokemons
    @State var isLoading: Bool = false
    private let service: PokedexListService = PokedexListService()
    var body: some View {
        LoadingView(isShowing: .constant(self.isLoading)) {
            NavigationView {
                List(self.pokemons) { data in
                    Button(action: {
                        self.isLoading = true
                        self.getDetails(pokemonData: data)
                    }) {
                        PokemonCell(viewModel: PokemonDataViewModel(pokemonData: data))
                    }
                }
                .navigationBarTitle(Text("Pokemons"))
            }
        }
    }

    private func getDetails(pokemonData: PokemonData) {
        self.service.getDetailData(with: pokemonData)
            .onSuccess { (details: DetailModels) -> Void in
                print(details.species.text)
                NavigationLink(destination: PokemonDetailsView(details: details)) {
                    Text("Do Something")
                }
            }
            .onFailure { (error: NetworkingError) -> Void in
                print(error.localizedDescription)
            }
            .onComplete { (_) -> Void in
                self.isLoading = false
            }
    }
}

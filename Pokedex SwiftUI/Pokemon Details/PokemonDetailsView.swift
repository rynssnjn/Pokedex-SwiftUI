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
    @State public var isLoading = false
    @State private var selectedIndex = 0
    @ObservedObject private var viewModel = DetailViewModel()

    // MARK: Configured View
    var body: some View {
        LoadingView(isShowing: .constant(isLoading)) {
            VStack {
                if self.viewModel.details == nil {
                    EmptyView()
                } else {
                    Picker("PokemonDetails", selection: self.$selectedIndex) {
                        Text("Details").tag(0)
                        Text("Stats").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200.0, height: 50.0, alignment: Alignment.center)

                    if self.selectedIndex == 0 {
                        PokemonProfile(details: self.viewModel.details!)
                    } else {
                        Text(self.viewModel.details!.species.evolutionURL.absoluteString)
                    }

                }
            }
        }
        .onAppear {
            self.isLoading = true
            self.viewModel.fetchDetails(pokemon: self.pokemon) {
                self.isLoading = false
            }
        }
        .navigationBarTitle(Text("Current Name"), displayMode: .inline)
    }
}


private class DetailViewModel: ObservableObject {

    private let service: PokemonDetailService = PokemonDetailService()

    @Published public var details: DetailModel? = nil

    public func fetchDetails(pokemon: PokemonData, onComplete: @escaping () -> Void) {
        self.service.getDetailData(with: pokemon)
            .onSuccess { (details: DetailModel) -> Void in
                self.details = details
            }
            .onFailure { (error: NetworkingError) -> Void in
                os_log("%s", error.localizedDescription)
            }
            .onComplete { (_) -> Void in
                onComplete()
            }
    }
}

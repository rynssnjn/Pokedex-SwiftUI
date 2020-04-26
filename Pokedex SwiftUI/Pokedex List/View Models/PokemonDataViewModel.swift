//
//  PokemonDataViewModel.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

public struct PokemonDataViewModel: Equatable {

    // MARK: Stored Properties
    public let pokemonData: PokemonData

    // MARK: Computed Properties
    public var name: String {
        return self.pokemonData.name.uppercased()
    }

    public var height: String {
        let heightInMeters: Double = self.pokemonData.height.kio.doubleValue / 10.0
        return "\(heightInMeters) m"
    }

    public var weight: String {
        let weightInKilograms: Double = self.pokemonData.weight.kio.doubleValue / 10.0
        return "\(weightInKilograms) kg"
    }

    public var image: Image {
        return Image(pokemonData.id).renderingMode(Image.TemplateRenderingMode.original)
    }

}

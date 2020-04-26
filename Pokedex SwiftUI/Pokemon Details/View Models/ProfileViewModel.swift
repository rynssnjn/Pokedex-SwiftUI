//
//  ProfileViewModel.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

public struct ProfileViewModel {

    // MARK: Initializer
    public init(model: DetailModel) {
        self.model = model
    }

    // MARK: Stored Properties
    private let model: DetailModel

    // MARK: Computed Properties
    public var id: String {
        if self.model.pokemon.id < 10 {
            return "00\(self.model.pokemon.id)"
        } else if self.model.pokemon.id < 100 {
            return "0\(self.model.pokemon.id)"
        } else {
            return "\(self.model.pokemon.id)"

        }
    }

    public var image: Image {
        return Image("\(self.model.pokemon.id)")
    }

    public var name: String {
        return self.model.pokemon.name.uppercased()
    }

    public var gradient: Gradient {
        return Gradient(colors: [
            Color(PokemonType(rawValue: self.model.pokemon.types.primaryType)!.color),
            Color.white
        ])
    }

    public var height: String {
        let heightInMeters: Double = Double(self.model.pokemon.height) / 10.0
        return "\(heightInMeters) m"
    }

    public var weight: String {
        let weightInKg: Double = Double(self.model.pokemon.weight) / 10.0
        return "\(weightInKg) kg"
    }

    public var color: Color {
        return Color(PokemonType(rawValue: self.model.pokemon.types.primaryType)!.color)
    }

    public var types: String {
        switch self.model.pokemon.types.secondaryType.isEmpty {
            case true:
                return self.model.pokemon.types.primaryType.capitalized

            case false:
                return "\(self.model.pokemon.types.primaryType.capitalized)/\(self.model.pokemon.types.secondaryType.capitalized)"
        }
    }

    public var description: String {
        self.model.species.text.replacingOccurrences(of: "\n", with: "")
    }
}

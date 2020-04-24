//
//  PokemonsCSVConverter.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import os

public final class PokemonsCSVConverter {
    private let csvPath: String? = Bundle.main.path(forResource: "pokemon", ofType: "csv")

    public var decodedPokemons: [PokemonData] {
        do {
            let rawCSV: RawCSV = try RawCSV(filePath: self.csvPath)
            let pokemons: [PokemonData] = rawCSV.rows.map { PokemonData(dict: $0) }

            return pokemons
        } catch let error {
            os_log("%s", error.localizedDescription)
            return []
        }
    }
}

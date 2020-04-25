//
//  PokemonDetailService.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Astral
import BrightFutures
import BFAstral

public struct PokemonDetailService {

    private let decoder: JSONDecoder = JSONDecoder()

    private func getPokemonData(with data: PokemonData) -> Future<Pokemon, NetworkingError> {
        let request: Request = PokemonRequest(pokemonData: data)

        return BFDispatcher().response(of: request)
            .map(NetworkQueue.context) { (response: Response) -> Pokemon in
                do {

                    return try self.decoder.decode(Pokemon.self, from: response.data)

                } catch let error {

                    fatalError(error.localizedDescription)

                }
        }
    }

    private func getSpeciesData(with data: PokemonData) -> Future<Species, NetworkingError> {

        let request: Request = SpeciesRequest(pokemonData: data)

        return BFDispatcher().response(of: request)
            .map(NetworkQueue.context) { (response: Response) -> Species in
                do {

                    return try self.decoder.decode(Species.self, from: response.data)

                } catch let error {

                    fatalError(error.localizedDescription)

                }
        }
    }

    private func getEvolutionData(with species: Species) -> Future<Evolution, NetworkingError> {

        let request: Request = EvolutionRequest(url: species.evolutionURL)

        return BFDispatcher().response(of: request)
            .map(NetworkQueue.context) { (response: Response) -> Evolution in
                do {

                    return try self.decoder.decode(Evolution.self, from: response.data)

                } catch let error {

                    fatalError(error.localizedDescription)

                }
        }
    }

    public func getDetailData(with icon: PokemonData) -> Future<DetailModel, NetworkingError> {
        return self.getPokemonData(with: icon)
            .zip(self.getSpeciesData(with: icon))
            .flatMap(NetworkQueue.context) { (pokemon: Pokemon, species: Species) -> Future<DetailModel, NetworkingError> in

                return self.getEvolutionData(with: species)
                    .map(NetworkQueue.context) { (evolution: Evolution) -> DetailModel in

                        return DetailModel(
                            pokemon: pokemon,
                            species: species,
                            evolution: evolution
                        )
                }
        }
    }

}

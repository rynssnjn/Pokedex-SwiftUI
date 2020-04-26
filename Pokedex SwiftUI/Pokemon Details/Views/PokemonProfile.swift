//
//  PokemonProfile.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/25/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

struct PokemonProfile: View {

    // MARK: Initializer
    public init(details: DetailModel) {
        self.details = details
        self.gradientBackground = Gradient(colors: [
            Color(PokemonType(rawValue: self.details.pokemon.types.primaryType)!.color),
            Color.white
        ])
    }

    private let details: DetailModel
    private let gradientBackground: Gradient

    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Image("\(self.details.pokemon.id)")
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .scaledToFit()
                        .frame(width: 200.0, height: 200.0)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .padding(.top, 20.0)
                        .padding(.bottom, 20.0)
                    Text(self.details.pokemon.name.uppercased())
                        .font(.system(size: 20.0, weight: .bold))
                }
                Spacer()
            }
            Spacer()
        }
        .background(LinearGradient(
            gradient: self.gradientBackground,
            startPoint: UnitPoint.top,
            endPoint: UnitPoint.bottom
        ))
    }
}

//
//  EvolutionView.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

struct EvolutionView: View {

    // MARK: Initializer
    public init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        self.evolutionImages = viewModel.evolutions.map {
            EvolutionImage(image: Image("\($0.id)"), name: $0.name)
        }
    }

    // MARK: Stored Properties
    private let viewModel: ProfileViewModel
    private let evolutionImages: [EvolutionImage]

    // MARK: Configured View
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("EVOLUTION(S)")
                    .font(.system(size: 20.0, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding()
                Spacer()
            }
            .background(self.viewModel.color)
            Spacer()
            HStack {
                Spacer()
                ForEach(self.evolutionImages, id: \.id) { EvolutionImageView(evolution: $0) }
                Spacer()
            }
            Spacer()
        }
        .background(LinearGradient(
            gradient: self.viewModel.gradient,
            startPoint: UnitPoint.bottom,
            endPoint: UnitPoint.top
        ))
    }
}

private struct EvolutionImageView: View {

    // MARK: Initializer
    public init(evolution: EvolutionImage) {
        self.evolution = evolution
    }

    // MARK: Stored Properties
    private let evolution: EvolutionImage

    // MARK: Configured View
    var body: some View {
        VStack {
            Spacer()
            self.evolution.image
                .resizable()
                .clipShape(Circle())
                .shadow(radius: 10)
                .scaledToFit()
                .frame(width: 75.0, height: 75.0)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .padding(.bottom, 20.0)
            Text(self.evolution.name.uppercased())
                .font(.system(size: 16.0, weight: .bold))
                .frame(width: 100.0)
                .lineLimit(1)
            Spacer()
        }
    }
}

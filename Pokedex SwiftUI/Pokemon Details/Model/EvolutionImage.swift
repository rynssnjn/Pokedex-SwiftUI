//
//  EvolutionImage.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

public struct EvolutionImage {

    // MARK: Initializer
    public init(image: Image, name: String) {
        self.image = image
        self.name = name
        self.id = UUID()
    }

    // MARK: Stored Properties
    public let image: Image
    public let name: String
    public let id: UUID
}

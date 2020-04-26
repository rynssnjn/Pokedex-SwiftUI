//
//  Statistic.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

public struct Statistic {

    // MARK: Initializer
    public init(name: String, value: CGFloat, color: UIColor) {
        self.name = name
        self.value = value
        self.color = Color(color)
    }

    // MARK: Stored Properties
    public let name: String
    public let value: CGFloat
    public let color: Color
}

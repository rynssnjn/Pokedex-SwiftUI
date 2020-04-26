//
//  CharacteristicLabel.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

struct CharacteristicLabel: View {

    // MARK: Initializer
    public init(characteristic: Characteristic, value: String, color: Color) {
        self.characteristic = characteristic
        self.value = value
        self.color = color
    }

    // MARK: Stored Properties
    private let characteristic: Characteristic
    private let value: String
    private let color: Color

    // MARK: Configured View
    var body: some View {
        HStack {
            Text(self.characteristic.stringValue).foregroundColor(self.color)
            Spacer()
            Text(self.value)
            Spacer()
        }
        .padding(.top, 10.0)
        .padding(.bottom, 10.0)
    }
}

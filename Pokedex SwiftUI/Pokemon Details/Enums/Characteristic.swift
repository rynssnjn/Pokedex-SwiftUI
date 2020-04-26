//
//  Characteristic.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

public enum Characteristic {
    case id
    case height
    case weight
    case type

    var stringValue: String {
        switch self {
            case .id:
                return "ID:"
            case .height:
                return "Height:"
            case .weight:
                return "Weight:"
            case .type:
                return "Type:"
        }
    }
}

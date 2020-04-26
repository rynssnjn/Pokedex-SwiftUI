//
//  BaseConfiguration.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Astral

public struct BaseConfiguration: RequestConfiguration {

    // MARK: Computed Properties
    public var scheme: URLScheme {
        return .https
    }

    public var host: String {
        return "pokeapi.co"
    }

    public var basePathComponents: [String] {
        return [
            "api",
            "v2"
        ]
    }

    public let baseHeaders: Set<Header> = [
        Header(key: Header.Key.contentType, value: Header.Value.mediaType(MediaType.applicationJSON))
    ]
}

//
//  EvolutionChainRequest.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 04/24/2020.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation
import Astral

public struct EvolutionRequest: Request {
    
    public init(url: URL) {
        self.id = url.lastPathComponent
    }
    
    // MARK: Stored Properties
    private let id: String
    
    // MARK: Stored Properties - Request
    public var configuration: RequestConfiguration {
        return BaseConfiguration()
    }
    
    public var method: HTTPMethod {
        return HTTPMethod.get
    }
    
    public var pathComponents: [String] {
        return [
            "evolution-chain",
            "\(self.id)"
        ]
    }
    
    public var parameters: Parameters = Parameters.none
    
    public var headers: Set<Header> = []
    
    public var cachePolicy: URLRequest.CachePolicy? {
        return nil
    }
}


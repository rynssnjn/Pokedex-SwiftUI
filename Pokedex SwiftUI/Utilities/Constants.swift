//
//  Constants.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

let NetworkQueue: DispatchQueue = DispatchQueue(
    label: "NetworkQueue",
    qos: DispatchQoS.utility,
    attributes: DispatchQueue.Attributes.concurrent
)

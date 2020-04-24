//
//  CSVError.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/24/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import Foundation

public enum CSVError: Error {

    public var title: String {

        let stringValue: String = "\(self)".splitBefore(separator: {$0.isUpperCase})
            .map { String($0).capitalized }
            .joined(separator: " ")

        return CSVError.trimAssociatedValue(stringValue: stringValue)

    }

    public var localizedDescription: String {

        switch self {

        case .invalidFilePath(let path):
            guard let path = path else { return "No Path" }

            return "Invalid path: \(path)"
        }

    }

    case invalidFilePath(String?)

    private static func trimAssociatedValue(stringValue: String) -> String {
        let range: Range<String.Index> = stringValue.range(of: "\\s\\(.*\\)", options: String.CompareOptions.regularExpression)!
        return String(stringValue[..<range.lowerBound])
    }

}

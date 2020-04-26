//
//  SearchBarCoordinator.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

public final class SearchBarCoordinator: NSObject, UISearchBarDelegate {
    @Binding var text: String

    public init(text: Binding<String>) {
        _text = text
    }

    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.becomeFirstResponder()
        self.text = searchText
    }

    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

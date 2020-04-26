//
//  SearchBar.swift
//  Pokedex SwiftUI
//
//  Created by Rael San Juan on 4/26/20.
//  Copyright © 2020 Rael San Juan. All rights reserved.
//

import SwiftUI

public struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    public func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(text: $text)
    }

    public func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar: UISearchBar = UISearchBar(frame: CGRect.zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    public func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        DispatchQueue.main.async {
            uiView.becomeFirstResponder()
            uiView.text = self.text
        }
    }
}

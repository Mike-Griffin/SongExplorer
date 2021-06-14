//
//  AppTabView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/12/21.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        NavigatableTabView {
            SearchView().tab(title: "Search", image: "magnifyingglass")
            FavoritesHomeView().tab(title: "Favorites", image: "star.circle")
            Text("Shazam").tab(title: "Shazam", image: "shazam")
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}

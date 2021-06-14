//
//  FavoritesHomeView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/12/21.
//

import SwiftUI

struct FavoritesHomeView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Favorited Songs")) {
                    Label("Songs", systemImage: "music.note")
                        .font(.title2)
                }
                .padding(.vertical)
                NavigationLink(destination: Text("Favorited Artists")) {
                    Label("Artists", systemImage: "person.3.sequence")
                        .font(.title2)

                }
                .padding(.vertical)
                NavigationLink(destination: Text("Favorited Albums")) {
                    Label("Albums", systemImage: "record.circle")
                        .font(.title2)

                }
                .padding(.vertical)
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Your Favorites")
        }
    }
}

struct FavoritesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesHomeView()
    }
}

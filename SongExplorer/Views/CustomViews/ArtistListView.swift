//
//  ArtistListView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import SwiftUI

struct ArtistListView: View {
    var artists: [ArtistPreview]
    var headerText: String
    var body: some View {
        Section(header: Text(headerText)) {
            ForEach(artists) { artist in
                NavigationLink(
                    destination: ArtistDetailView(artist: artist),
                label: {
                    Text(artist.name.capitalized)
                    //ArtistPreviewCell(artist: artist)
                })
                    .foregroundColor(.textColor)
            }
        }
    }
}

struct ArtistListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListView(artists: [MockData.artistPreview], headerText: "Producers")
    }
}

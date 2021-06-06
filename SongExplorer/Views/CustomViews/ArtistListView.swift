//
//  ArtistListView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import SwiftUI

struct ArtistListView: View {
    var artists: [ArtistPreview]
    var body: some View {
        ForEach(artists) { artist in
            NavigationLink(
                destination: ArtistDetailView(artist: artist),
            label: {
                Text(artist.name.capitalized)
            })
                .foregroundColor(.textColor)
        }
    }
}

struct ArtistListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListView(artists: [MockData.artistPreview])
    }
}

//
//  SongAdditionalDetailsView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/12/21.
//

import SwiftUI

struct SongAdditionalDetailsView: View {
    var album: AlbumPreview
    var body: some View {
        Section {
            HStack {
                Text("Album")
                Spacer()
                NavigationLink(album.name.capitalized, destination: AlbumDetailView(album: album))
            }
        }
        .padding(.horizontal, 64)

    }
}

struct SongAdditionalDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SongAdditionalDetailsView(album: MockData.albumPreview)
    }
}

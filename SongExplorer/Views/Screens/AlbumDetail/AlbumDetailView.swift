//
//  AlbumDetailView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import SwiftUI

struct AlbumDetailView: View {
    var album: AlbumPreview
    var body: some View {
        VStack {
            Text("Album details will go here eventually")
            Text(album.name)
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: MockData.albumPreview)
    }
}

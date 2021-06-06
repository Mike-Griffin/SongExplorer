//
//  SongListView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import SwiftUI

struct SongListView: View {
    var songs: [SongPreview]
    var body: some View {
        ScrollView {
            ForEach(songs) { song in
                NavigationLink(
                    destination: SongDetailView(song: song),
                    label: {
                        SongPreviewCell(songPreview: song)
                    })
            }
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(songs: [MockData.songPreview])
    }
}

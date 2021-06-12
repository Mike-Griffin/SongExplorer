//
//  SongHeaderView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/12/21.
//

import SwiftUI

struct SongHeaderView: View {
    var title: String
    var artist: ArtistPreview
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground)
                .frame(height: 130)
                .frame(maxWidth: .infinity)
                .cornerRadius(12)
            VStack(alignment: .leading, spacing: 16) {
                Text(title)
                    .lineLimit(2)
                NavigationLink("""
                                \(Text("By: ")
                                    .font(.system(size: 20, weight: .light, design: .default))) \(artist.name)
                                """,
                               destination: ArtistDetailView(artist: artist))
            }
            .songNameStyle()
        }
        .padding()
    }
}

struct SongHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SongHeaderView(title: "Song song song", artist: MockData.artistPreview)
    }
}

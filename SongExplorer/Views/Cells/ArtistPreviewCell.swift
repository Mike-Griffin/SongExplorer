//
//  ArtistPreviewCell.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/6/21.
//

import SwiftUI

struct ArtistPreviewCell: View {
    var artist: ArtistPreview
    var body: some View {
        HStack {
            Text(artist.name.capitalized)
                .font(.title3)
                .padding()
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .padding(.horizontal)

    }
}

struct ArtistPreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ArtistPreviewCell(artist: MockData.artistPreview)
    }
}

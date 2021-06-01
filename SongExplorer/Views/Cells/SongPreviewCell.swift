//
//  SongPreviewCell.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/31/21.
//

import SwiftUI

struct SongPreviewCell: View {
    var songPreview: SongPreview
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(songPreview.censoredTitle)
                .font(.title).bold()
                .lineLimit(2)
                .minimumScaleFactor(0.75)
            HStack {
                Text("Artist: ")
                Text(songPreview.artist.name)
            }
            .font(.subheadline)
        }
        .padding()
        .frame(height: 80)
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .padding(.horizontal)
    }
}

struct SongPreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        SongPreviewCell(songPreview: MockData.songPreview)
    }
}

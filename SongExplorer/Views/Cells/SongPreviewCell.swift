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
        HStack {
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
            .foregroundColor(.textColor)
            .padding(.horizontal)
            .frame(height: 80)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.secondarySystemBackground))

            Spacer()
        }
    }
}

struct SongPreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        SongPreviewCell(songPreview: MockData.songPreview)
    }
}

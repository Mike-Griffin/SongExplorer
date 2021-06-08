//
//  ArtistDetailView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/1/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArtistDetailView: View {
    var artist: ArtistPreview
    @StateObject var viewModel = ArtistDetailViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                if let urlString = artist.image {
                    if let imageUrl = URL(string: urlString) {
                    WebImage(url: imageUrl)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 84)
                        .clipShape(Circle())
                    }
                }
                Spacer()
                Text(artist.name)
                    .font(.system(size: 32, weight: .bold))
                    .lineLimit(3)
                    .minimumScaleFactor(0.75)
                    .padding(.trailing, 16)

            }
            .padding(.trailing, 32)
            .padding(.vertical)
            .background(Color(.secondarySystemBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous)))
            .padding(.horizontal)
            VStack {
                Text("Popular Songs")
                    .font(.title)
                SongListView(songs: viewModel.songs)
            }
            Spacer()
        }
        .onAppear {
            viewModel.getSongs(id: artist.id)
        }
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailView(artist: MockData.artistPreview)
    }
}

//
//  SongDetailView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/1/21.
//

import SwiftUI

struct SongDetailView: View {
    var song: SongPreview
    @StateObject var viewModel = SongDetailViewModel()
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ZStack {
                        Color(.secondarySystemBackground)
                            .frame(height: 130)
                            .cornerRadius(12)
                            .padding(.horizontal)
                        VStack(alignment: .leading) {
                            Text(viewModel.title)
                            NavigationLink(song.artist.name, destination: ArtistDetailView(artist: song.artist))
                            NavigationLink(viewModel.albumName, destination: AlbumDetailView(album: viewModel.album))
                        }
                        .songNameStyle()
                    }
                    .padding()
                    RelatedArtistsView(artists: viewModel.featuredArtists, text: "Featured Artists")
                    RelatedArtistsView(artists: viewModel.writerArtists, text: "Writing Credits")
                    RelatedArtistsView(artists: viewModel.producerArtists, text: "Producing Credits")
                    Spacer()
                }

            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .onAppear {
            viewModel.getSong(id: song.id)
    }
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(song: MockData.songPreview)
    }
}

struct RelatedArtistsView: View {
    var artists: [ArtistPreview]
    var text: String
    var body: some View {
        if !artists.isEmpty {
            VStack {
                Text(text)
                    .font(.title)
                ArtistListView(artists: artists)
            }
            .padding(.top)
        }
    }
}

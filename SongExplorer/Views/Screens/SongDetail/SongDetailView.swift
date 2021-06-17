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
            //ScrollView {
                VStack {
                    SongHeaderView(title: viewModel.title, artist: song.artist)
                    SongAdditionalDetailsView(album: viewModel.album)
                    List {
                        RelatedArtistsView(artists: viewModel.featuredArtists, text: "Featured Artists")
                        RelatedArtistsView(artists: viewModel.writerArtists, text: "Writing Credits")
                        RelatedArtistsView(artists: viewModel.producerArtists, text: "Producing Credits")
                    }
                    Spacer()
                }

            //}
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .onAppear {
            viewModel.getSong(id: song.id)
            print(viewModel.writerArtists)
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
                ArtistListView(artists: artists, headerText: text)
        }
    }
}

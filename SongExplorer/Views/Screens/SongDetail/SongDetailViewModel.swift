//
//  SongDetailViewModel.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import Foundation
import Combine

final class SongDetailViewModel: ObservableObject {
    var song: Song? {
        didSet {
            if let song = song {
                self.title              = song.censoredTitle.capitalized
                self.album              = song.album
                self.featuredArtists    = song.featuredArtists
                self.writerArtists      = song.writerArtists
                self.producerArtists    = song.producerArtists
            }
        }
    }
    @Published var title: String                    = ""
    @Published var album: AlbumPreview              = PlaceholderModel.albumPreview
    @Published var albumName: String                = ""
    @Published var featuredArtists: [ArtistPreview] = []
    @Published var writerArtists: [ArtistPreview]   = []
    @Published var producerArtists: [ArtistPreview] = []
    @Published var isLoading                        = false
    private var cancellables                        = Set<AnyCancellable>()
    func getSong(id: Int) {
        showLoadingView()
        geniusManager.getSong(id)
            .sink(receiveCompletion: {_ in}, receiveValue: { [self] result in
                hideLoadingView()
                song = result.response.song
            })
            .store(in: &cancellables)
    }
    private func showLoadingView() { isLoading = true }
    private func hideLoadingView() { isLoading = false }
}

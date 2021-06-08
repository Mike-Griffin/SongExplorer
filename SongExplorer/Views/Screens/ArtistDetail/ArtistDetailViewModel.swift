//
//  ArtistDetailViewModel.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import Foundation
import Combine

final class ArtistDetailViewModel: ObservableObject {
    @Published var songs: [SongPreview] = []
    private var cancellables = Set<AnyCancellable>()
    func getSongs(id: Int) {
        geniusManager.getArtistSongs(id)
            .sink(receiveCompletion: {_ in}, receiveValue: { result in
                self.songs = result.response.songs
            })
            .store(in: &cancellables)
    }
}

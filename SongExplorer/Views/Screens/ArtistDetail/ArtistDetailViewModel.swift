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
    @Published var isLoading            = false
    private var cancellables = Set<AnyCancellable>()
    func getSongs(id: Int) {
        showLoadingView()
        geniusManager.getArtistSongs(id)
            .sink(receiveCompletion: {_ in}, receiveValue: { [self] result in
                hideLoadingView()
                songs = result.response.songs
            })
            .store(in: &cancellables)
    }
    private func showLoadingView() { isLoading = true }
    private func hideLoadingView() { isLoading = false }
}

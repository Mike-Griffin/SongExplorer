//
//  SearchViewModel.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/7/21.
//

import Foundation
import Combine

extension SearchView {
    class ViewModel: ObservableObject {
        @Published var searchText: String = ""
        @Published var isSearching: Bool = false
        var fetchedHits: [SongHit] = [] {
            didSet {
                fetchedSongs = fetchedHits.map({ $0.result })
            }
        }
        @Published var fetchedSongs: [SongPreview] = []
        private var cancellables = Set<AnyCancellable>()
        init() {
            $searchText
                .debounce(for: 0.3, scheduler: DispatchQueue.main)
                .removeDuplicates()
                .sink(receiveValue: { str in
                    if str.isEmpty {
                        self.fetchedSongs = []
                    } else {
                        self.fetchedSongs = []
                        self.searchSongs()
                    }
                }).store(in: &cancellables)
        }
        func searchSongs() {
            geniusManager.search(searchText)
                .sink(receiveCompletion: {_ in}, receiveValue: { result in
                    self.fetchedHits = result.response.hits
                })
                .store(in: &cancellables)
        }
    }
}

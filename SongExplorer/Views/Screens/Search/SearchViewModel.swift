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
        var searchCancellable: AnyCancellable? = nil
        
        init() {
            searchCancellable = $searchText
                .removeDuplicates()
                .debounce(for: 0.4, scheduler: RunLoop.main)
                .sink(receiveValue:  { str in
                    if str == "" {
                        self.fetchedSongs = []
                    } else {
                        self.fetchedSongs = []
                        self.searchSongs()
                    }
                })
        }
        
        func searchSongs() {
            let noSpaceQuery = searchText.replacingOccurrences(of: " ", with: "%20")
            let urlString = "https://api.genius.com/search?q=\(noSpaceQuery)&per_page=3"
            guard let url = URL(string: urlString) else { return }
            var request = URLRequest(url: url)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) { (data,_, err) in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                
                guard let APIData = data else {
                    print("no response found")
                    return
                }
                
                do {
                    let songs = try JSONDecoder().decode(SearchResult.self, from: APIData)
                    
                    DispatchQueue.main.async {
                        if self.fetchedSongs.isEmpty {
                            self.fetchedHits = songs.response.hits
                        }
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            .resume()
        }
    }
}

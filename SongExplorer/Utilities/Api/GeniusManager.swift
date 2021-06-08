//
//  SearchManager.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/7/21.
//

import Foundation
import Combine

let geniusManager = GeniusManager()

struct GeniusManager {
    func search(_ query: String) -> AnyPublisher<SearchResult, Error> {
        let noSpaceQuery = query.replacingOccurrences(of: " ", with: "%20")
        let endpoint = "search?q=\(noSpaceQuery)&per_page=3"
        return apiManager.fetch(endpoint)
    }
    func getSong(_ id: Int) -> AnyPublisher<SongIdResult, Error> {
        let endpoint = "songs/\(id)"
        return apiManager.fetch(endpoint)
    }
    func getArtistSongs(_ id: Int) -> AnyPublisher<ArtistSongResult, Error> {
        let endpoint = "artists/\(id)/songs?sort=popularity"
        return apiManager.fetch(endpoint)
    }
}

//
//  SearchResult.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/7/21.
//

import Foundation

// these are all used as part of the genius API search
public struct SongHit: Codable {
    let result: SongPreview
}

struct SearchResponse: Codable {
    let hits: [SongHit]
}

struct SearchResult: Codable {
    let response: SearchResponse
}

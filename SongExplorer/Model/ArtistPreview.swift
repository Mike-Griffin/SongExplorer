//
//  ArtistPreview.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/7/21.
//

import Foundation

// I'm wondering if this could be made to be any more generic
// I am seeing a difference between Song Preview and Artist Preview
// so maybe this is the best way to do it
struct ArtistPreview: Codable, Equatable, Identifiable, Hashable {
    let name: String
    let id: Int
    // I don't think that I want the image on the Preview...but I'm doing this to do some testing
    let image: String?
    private enum CodingKeys: String, CodingKey {
        case id, name, image = "image_url"
    }
}

struct ArtistSongResponse: Codable {
    let songs: [SongPreview]
}

struct ArtistSongResult: Codable {
    let response: ArtistSongResponse
}

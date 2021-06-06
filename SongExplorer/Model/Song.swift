//
//  Song.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import Foundation

struct Song: Codable {
    let id: Int
    let title: String
    let artist: ArtistPreview
    let album: AlbumPreview
    let featuredArtists: [ArtistPreview]
    let writerArtists: [ArtistPreview]
    let producerArtists: [ArtistPreview]
    var censoredTitle: String { return title.replacingOccurrences(of: "Nigg", with: "N***") }
    private enum CodingKeys: String, CodingKey {
        case artist = "primary_artist", featuredArtists = "featured_artists", writerArtists = "writer_artists", producerArtists = "producer_artists", id, title, album
    }
}

struct SongResponse: Codable {
    let song: Song
}

struct SongIdResult: Codable {
    let response: SongResponse
}

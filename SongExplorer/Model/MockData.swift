//
//  MockData.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/31/21.
//

import Foundation

enum MockData {
    static var songPreview: SongPreview {
        let preview = SongPreview(title: "Best Song Ever", artist: artistPreview, image: nil, id: 1)
        return preview
    }
    static var artistPreview: ArtistPreview {
        let artist = ArtistPreview(name: "Mike Griffin", id: 1,
                                   image: "https://images.genius.com/b9d6cf24ceb76fa5d8ebf02569e16e2f.1000x1000x1.png")
        return artist
    }
    static var albumPreview: AlbumPreview {
        let album = AlbumPreview(name: "Greatest Hits Ever", id: 1, image: nil)
        return album
    }
}

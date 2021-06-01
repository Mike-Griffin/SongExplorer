//
//  MockData.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/31/21.
//

import Foundation

struct MockData {
    static var artistPreview: ArtistPreview {
        let artist = ArtistPreview(name: "Mike Griffin", id: 1)
        return artist
    }
    
    static var songPreview: SongPreview {
        let preview = SongPreview(title: "Best Song Ever", artist: artistPreview, image: nil, id: 1)
        return preview
    }
}

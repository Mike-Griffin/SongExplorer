//
//  AlbumPreview.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import Foundation

struct AlbumPreview: Codable, Equatable, Identifiable, Hashable {
    let name: String
    let id: Int
    // I don't think that I want the image on the Preview...but I'm doing this to do some testing
    let image: String?
    private enum CodingKeys: String, CodingKey {
        case id, name, image = "cover_art_url"
    }
}

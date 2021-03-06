//
//  SongPreview.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/7/21.
//

import Foundation

struct SongPreview: Codable, Equatable, Identifiable, Hashable {
    static func == (lhs: SongPreview, rhs: SongPreview) -> Bool {
        return lhs.id == rhs.id
    }
    // certainly has some flaws but also I'm just trying to be able to search
    // for Kanye West
    var censoredTitle: String { return title.replacingOccurrences(of: "Nigg", with: "N***") }
    let title: String
    let artist: ArtistPreview
    // might want this to be a URL instead of String
    let image: String?
    let id: Int
    private enum CodingKeys: String, CodingKey {
        case id, title = "title_with_featured", artist = "primary_artist", image = "header_image_thumbnail_url"
    }
}

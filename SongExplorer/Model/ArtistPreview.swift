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
}

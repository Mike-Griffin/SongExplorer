//
//  SongDetailViewModel.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import Foundation
import Combine

final class SongDetailViewModel: ObservableObject {
    var song: Song? {
        didSet {
            if let song = song {
                self.title = song.censoredTitle.capitalized
                self.album = song.album
                self.albumName = song.album.name.capitalized
                self.featuredArtists = song.featuredArtists
                self.writerArtists = song.writerArtists
                self.producerArtists = song.producerArtists
            }
        }
    }
    @Published var title: String = ""
    @Published var album: AlbumPreview = PlaceholderModel.albumPreview
    @Published var albumName: String = ""
    @Published var featuredArtists: [ArtistPreview] = []
    @Published var writerArtists: [ArtistPreview] = []
    @Published var producerArtists: [ArtistPreview] = []
    // Need to refactor this ASAP but I really just want to mess with the UI
    func getSong(id: Int) {
        let urlString = "https://api.genius.com/songs/\(id)"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, _, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            guard let APIData = data else {
                print("no response found")
                return
            }
            do {
                let result = try JSONDecoder().decode(SongIdResult.self, from: APIData)
                DispatchQueue.main.async {
                    self.song = result.response.song
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}

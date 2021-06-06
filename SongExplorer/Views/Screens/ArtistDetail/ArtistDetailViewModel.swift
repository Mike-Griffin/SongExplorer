//
//  ArtistDetailViewModel.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import Foundation
import Combine

final class ArtistDetailViewModel: ObservableObject {
    @Published var songs: [SongPreview] = []
    
    func getSongs(id: Int) {
        let urlString = "https://api.genius.com/artists/\(id)/songs?sort=popularity"
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
                let result = try JSONDecoder().decode(ArtistSongResult.self, from: APIData)
                DispatchQueue.main.async {
                    self.songs = result.response.songs
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}

//
//  ApiManager.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/7/21.
//

import Foundation
import Combine

let baseUrl = "https://api.genius.com/"
let apiManager = ApiManager()

public struct ApiManager {
    func fetch<T: Codable>(_ endPoint: String) -> AnyPublisher<T, Error> {
        let urlString = baseUrl + endPoint
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                          throw URLError(.badServerResponse)
                      }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .map({ result in
                return result
            })
            .eraseToAnyPublisher()
    }
}

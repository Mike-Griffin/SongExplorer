//
//  ContentView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/7/21.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = ViewModel()
//    init(viewModel: ViewModel = .init()) {
//        _viewModel = ObservedObject(wrappedValue: viewModel)
//
//    }
    var body: some View {
        NavigationView {
            VStack {
                if #available(iOS 15.0, *) {
                    SongListView(songs: viewModel.fetchedSongs)
                        .searchable(text: $viewModel.searchText)
                        .disableAutocorrection(true)
                } else {
                    SearchBarView(searchText: $viewModel.searchText,
                              isSearching: $viewModel.isSearching,
                              placeholderText: "Search Music")
                    SongListView(songs: viewModel.fetchedSongs)
                }
                Spacer()
            }
            .navigationTitle("Search")
        }

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

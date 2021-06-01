//
//  ContentView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/7/21.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: ViewModel
    init(viewModel: ViewModel = .init()) {
        _viewModel = ObservedObject(wrappedValue: viewModel)

    }
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchText, isSearching: $viewModel.isSearching, placeholderText: "Search Music")
            ForEach(viewModel.fetchedSongs) { song in
                SongPreviewCell(songPreview: song)
                    .padding(.vertical)
            }
            Spacer()
        }

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

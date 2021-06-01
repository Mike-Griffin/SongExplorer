//
//  SearchBarView.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/7/21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var placeholderText: String
    var body: some View {
        HStack {
            HStack {
                TextArea(placeholderText, text: $searchText)
                    .padding(.leading, 24)
                    .padding(.vertical, -8)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            .padding()
            .background(Color.searchbar)
            .cornerRadius(8)
            .padding()
            .onTapGesture {
                isSearching = true
            }
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if isSearching {
                        Button(action: {
                            searchText = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                    }
                }
                .padding(.horizontal, 32)
                .foregroundColor(.gray)
            )
            .transition(.move(edge: .trailing))
            .animation(.spring())
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    UIApplication.shared.sendAction(
                        #selector(UIResponder.resignFirstResponder),
                        to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, -12)
                })
                .offset(x: isSearching ? 0 : 100)
                .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static var searchText = "text"
    @State static var isSearching = true
    static var previews: some View {
        SearchBarView(searchText: $searchText, isSearching: $isSearching, placeholderText: "Search")
    }
}

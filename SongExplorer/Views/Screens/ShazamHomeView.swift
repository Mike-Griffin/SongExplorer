//
//  ShazamScreen.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/16/21.
//

import SwiftUI

struct ShazamHomeView: View {
    var body: some View {
        List {
            Section(header: Text("hi there")) {
                ForEach(0..<5) { item in
                    Text("hi")
                }
            }
        }
    }
}

struct ShazamScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShazamHomeView()
    }
}

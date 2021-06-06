//
//  View+Ext.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import SwiftUI

extension View {
    func songNameStyle() -> some View {
        self.modifier(SongNameText())
    }
}

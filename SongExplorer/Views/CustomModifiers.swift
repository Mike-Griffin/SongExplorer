//
//  CustomModifiers.swift
//  SongExplorer
//
//  Created by Mike Griffin on 6/5/21.
//

import SwiftUI

struct SongNameText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.textColor)
            .font(.system(size: 32, weight: .bold))
            .lineLimit(1)
            .minimumScaleFactor(0.75)
    }
}

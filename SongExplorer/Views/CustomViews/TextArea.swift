//
//  TextArea.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/7/21.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    var placeholder: String
    var alignment: Alignment
    init(_ placeholder: String, text: Binding<String>, alignment: Alignment = .leading) {
        self.placeholder = placeholder
        self._text = text
        self.alignment = alignment
    }
    var body: some View {
        // Unsure how this will scale exactly, but I guess it also doesn't hurt to pass in
        // whatever is needed to be a parm
        ZStack(alignment: alignment) {
            if text.isEmpty { Text(placeholder).foregroundColor(.placeholderColor)}
            TextField("", text: $text, onCommit: {
                UIApplication.shared.endEditing()
            })
            .foregroundColor(.textColor)
        }
    }
}

struct TextArea_Previews: PreviewProvider {
    @State static var val = "Hello"
    static var previews: some View {
        TextArea("Value", text: $val)
    }
}

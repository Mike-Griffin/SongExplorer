//
//  UIApplication.swift
//  SongExplorer
//
//  Created by Mike Griffin on 5/7/21.
//

import SwiftUI

extension UIApplication {
    // This method dismisses the keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

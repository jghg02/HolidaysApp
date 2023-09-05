//
//  View+Extensions.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 04-09-23.
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}

//
//  HolidaysssApp.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 01-09-23.
//

import SwiftUI

@main
struct HolidaysssApp: App {
    @StateObject private var dateViewModel = DateViewModel()

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(dateViewModel)
        }
    }
}

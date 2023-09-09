//
//  ToastViewModel.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 08-09-23.
//

import Foundation
import SwiftUI

class ToastViewModel: ObservableObject {
    @Published var showToast = false
    @Published var toastMessage = ""
    @Published var toastOffset: CGFloat = 100 // Initial offset to be out of view
    @Published var toastOpacity: Double = 0.0 // Initial opacity to be fully transparent

    func show(message: String) {
        self.toastMessage = message

        // Reset properties to initial values
        self.toastOffset = 100
        self.toastOpacity = 0.0
        self.showToast = true

        // Animate toast entering
        withAnimation(.easeInOut(duration: 0.5)) {
            self.toastOffset = 0
            self.toastOpacity = 1.0
        }

        // After 3 seconds, animate toast exiting
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.toastOffset = 100
                self.toastOpacity = 0.0
            }
            self.showToast = false
        }
    }
}



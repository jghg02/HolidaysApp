//
//  ToastViewModel.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 08-09-23.
//

import Foundation
import SwiftUI

class ToastViewModel: ObservableObject {
    @Published var showToast: Bool = false
    @Published var toastOffset: CGFloat = 0
    @Published var toastOpacity: Double = 0.0

    func showToastView(message: String) -> ToastView {
        return ToastView(message: message)
    }

    func show() {
        withAnimation(.spring()) {
            showToast = true
            toastOffset = self.toastOffset
            toastOpacity = 1.0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation(.spring()) {
                self.hide()
            }
        }
    }

    func hide() {
        showToast = false
        toastOffset = -400
        toastOpacity = 0.0
    }
}


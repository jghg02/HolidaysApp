//
//  LottieView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 05-09-23.
//

import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    let loopMode: LottieLoopMode

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }

    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: "wine")
        animationView.play()
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        return animationView
    }
}

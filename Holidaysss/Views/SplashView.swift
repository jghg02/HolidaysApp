//
//  SplashView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 05-09-23.
//

import SwiftUI

struct SplashView: View {

    @State var isActive: Bool = false

    // Define your gradient
    let gradient: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.blue, Color.white, Color.red]),
        startPoint: .top,
        endPoint: .bottom)

    var body: some View {
        ZStack {
            // Use gradient as background
            gradient.edgesIgnoringSafeArea(.all)
            if self.isActive {
                ContentView()
            } else {
                LottieView(loopMode: .loop, resource: "chile")
                    .scaleEffect(0.6)
            }
        }

        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.isActive = false
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

//
//  ErrorView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 22-09-23.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        LottieView(loopMode: .loop, resource: "error")
            .scaleEffect(0.4)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}

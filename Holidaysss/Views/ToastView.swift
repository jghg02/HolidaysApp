//
//  ToastView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 06-09-23.
//

import SwiftUI

struct ToastView: View {

    @State var message: String

    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding()
            .background(Capsule().fill(Color.black.opacity(0.7)))
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(message: "This is a ToastView....")
    }
}

//
//  ToastView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 06-09-23.
//

import SwiftUI

struct ToastView: View {

    @State var message: String
    @ObservedObject private var toastViewModel = ToastViewModel()

    var body: some View {
        Text(toastViewModel.toastMessage)
            .foregroundColor(.white)
            .padding()
            .background(Capsule().fill(Color.black.opacity(0.6)))
            .shadow(radius: 4)

    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(message: "This is a ToastView....")
    }
}

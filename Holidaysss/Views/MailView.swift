//
//  MailView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 24-10-23.
//

import MessageUI
import SwiftUI

struct MailView: UIViewControllerRepresentable {
    var subject: String
    var recipient: [String]
    @Binding var isShowing: Bool

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        viewController.mailComposeDelegate = context.coordinator
        viewController.setSubject(subject)
        viewController.setToRecipients(recipient)
        return viewController
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailView>) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(isShowing: $isShowing)
    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var isShowing: Bool

        init(isShowing: Binding<Bool>) {
            _isShowing = isShowing
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            isShowing = false
        }
    }
}

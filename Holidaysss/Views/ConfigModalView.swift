//
//  ConfigModalView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 23-10-23.
//

import SwiftUI
import MessageUI

struct ConfigModalView: View {

    @State private var isShowingMailView = false
    @State private var mailSubject = ""
    @State private var showAlert = false
    private var url = "https://jghg02.notion.site/ChileFest-c8bdc18649684639bac8a5de164bbf2b?pvs=4"
    private var mail = "jghg.02@gmail.com"

    var body: some View {
        NavigationView {
            VStack {
                List {
                    /**
                     Section {
                     Toggle("Push Notifications", isOn: $pushNotificationsToggle)
                     }
                     */

                    Section {
                        Button("FeedbackSupport".localized) {
                            if MFMailComposeViewController.canSendMail() {
                                mailSubject = "FeedbackSupport".localized
                                isShowingMailView.toggle()
                            } else {
                                showAlert = true
                            }
                        }

                        Button("ReportBug".localized) {
                            if MFMailComposeViewController.canSendMail() {
                                mailSubject = "ReportBug".localized
                                isShowingMailView.toggle()
                            } else {
                                showAlert = true
                            }
                        }

                        NavigationLink(destination: WebView(url: URL(string: url)!)) {
                            Text("PrivacyPolicy".localized)
                        }
                    }
                }
                Section {
                    Text(getInfoApp())
                        .font(.footnote)
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Settings".localized)
                .navigationBarTitleDisplayMode(.inline)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Mail not available"), message: Text("Please set up a mail account or use another method to contact support."), dismissButton: .default(Text("OK")))
                }
            }
            .sheet(isPresented: $isShowingMailView) {
                MailView(subject: mailSubject, recipient: [mail], isShowing: $isShowingMailView)
            }
        }
    }

    func getInfoApp() -> String {
        var result = ""

        if let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String {
            result += appName + " - "
        }

        if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            result += "Version " + appVersion + " - "
        }

        if let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            result += "Build " + appBuild
        }

        return result
    }

}

struct ConfigModalView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigModalView()
    }
}

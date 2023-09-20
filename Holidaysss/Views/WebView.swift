//
//  WebView.swift
//  Holidaysss
//
//  Created by Josue German Hernandez Gonzalez on 20-09-23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: self.url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

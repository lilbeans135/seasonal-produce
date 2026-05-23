//
//  ContentView.swift
//  Seasonal
//
//  Created by Lily Z on 5/21/26.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        SeasonalProduceWebView()
            .ignoresSafeArea()
    }
}

private struct SeasonalProduceWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences.allowsContentJavaScript = true

        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 0.984, green: 0.973, blue: 0.937, alpha: 1)
        webView.scrollView.backgroundColor = webView.backgroundColor
        loadSeasonalProduce(in: webView)
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        if webView.url == nil {
            loadSeasonalProduce(in: webView)
        }
    }

    private func loadSeasonalProduce(in webView: WKWebView) {
        guard let indexURL = Bundle.main.url(forResource: "index", withExtension: "html") else {
            webView.loadHTMLString(
                "<strong>Seasonal Produce</strong><p>The app bundle is missing index.html.</p>",
                baseURL: nil
            )
            return
        }

        let publicDirectory = indexURL.deletingLastPathComponent()
        webView.loadFileURL(indexURL, allowingReadAccessTo: publicDirectory)
    }
}

//
//  FullAdView.swift
//  TouchSchool
//
//  Created by 황성진 on 12/4/23.
//

import SwiftUI
import GoogleMobileAds

struct InterstitialAdView: View {
    @State private var interstitial: GADInterstitialAd?

    var body: some View {
        VStack {
            // Your other content

            // Call loadInterstitialAd when the view appears
        }
        .onAppear {
            loadInterstitialAd()
        }
    }

    private func loadInterstitialAd() {
            let adUnitID = "ca-app-pub-3940256099942544/4411468910"
            let request = GADRequest()

            GADInterstitialAd.load(withAdUnitID: adUnitID, request: request) { ad, error in
                if let error = error {
                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                } else {
                    print("Interstitial ad loaded successfully")
                    self.interstitial = ad

                    // Show the interstitial ad immediately when it's loaded
                    self.showInterstitialAd()
                }
            }
        }

    private func showInterstitialAd() {
        if let interstitial = interstitial,
           let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            interstitial.present(fromRootViewController: rootViewController)
        } else {
            print("Interstitial ad not ready yet.")
        }
    }
}


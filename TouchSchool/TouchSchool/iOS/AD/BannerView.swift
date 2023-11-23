//
//  BannerView.swift
//  TouchSchool
//
//  Created by 최동호 on 11/23/23.
//

import Foundation
import GoogleMobileAds
import SwiftUI


struct BannerView: UIViewControllerRepresentable {
    @State private var viewWidth: CGFloat = .zero
    private let bannerView = GADBannerView()
    private let adUnitID = "ca-app-pub-3940256099942544/2934735716"
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let bannerViewController = BannerViewController()
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = bannerViewController
        bannerViewController.view.addSubview(bannerView)
        
        bannerViewController.delegate = context.coordinator
        
        return bannerViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        guard viewWidth != .zero else { return }
        
        // Request a banner ad with the updated viewWidth.
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        bannerView.load(GADRequest())
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
      }

    internal class Coordinator: NSObject, BannerViewControllerWidthDelegate {
        let parent: BannerView

        init(_ parent: BannerView) {
          self.parent = parent
        }

        // MARK: - BannerViewControllerWidthDelegate methods

        func bannerViewController(_ bannerViewController: BannerViewController, didUpdate width: CGFloat) {
          // Pass the viewWidth from Coordinator to BannerView.
          parent.viewWidth = width
        }
      }

}

#Preview {
    BannerView()
}

//
//  TouchSchoolApp.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import SwiftUI
import Firebase
import GoogleMobileAds

@main
struct TouchSchoolApp: App {

    
    init() {
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SearchVM())
        }
        
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        return true
    }
}

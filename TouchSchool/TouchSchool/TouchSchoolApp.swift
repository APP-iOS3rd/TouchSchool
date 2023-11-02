//
//  TouchSchoolApp.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import SwiftUI
import Firebase

@main
struct TouchSchoolApp: App {
    @StateObject var firestoreManager = FireStoreManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(firestoreManager)
                .environmentObject(SearchVM())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Configured Firebase!")
        
        return true
    }
}

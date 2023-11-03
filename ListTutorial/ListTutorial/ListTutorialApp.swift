//
//  ListTutorialApp.swift
//  ListTutorial
//
//  Created by 황성진 on 11/2/23.
//

import SwiftUI

@main
struct ListTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SchoolStore(schools: schoolDatas))
        }
    }
}

//
//  FireBaseTestApp.swift
//  FireBaseTest
//
//  Created by Jared Eldridge on 10/31/22.
//

import SwiftUI
import Firebase

@main
struct FireBaseTestApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataManager())
        }
    }
}

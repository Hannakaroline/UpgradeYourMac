//
//  UpgradeYourMacApp.swift
//  UpgradeYourMac
//
//  Created by Hanna Torales Palacios on 2024/11/19.
//

import SwiftData
import SwiftUI

@main
struct UpgradeYourMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Buildlog.self)
    }
}

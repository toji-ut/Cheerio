import SwiftUI

@main
struct CheerioApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 500, minHeight: 300)
                .frame(maxWidth: 500, maxHeight: 300)
        }
    }
}

import SwiftUI

struct ContentView: View {
    @State private var currentQuote = ""
    @State private var quotes = [String]()

    var body: some View {
        VStack {
            Text(currentQuote)
                .font(.custom("font", size: 25))
                .foregroundColor(.white)
                .padding()

            Spacer()

            HStack {
                Button(action: {
                    self.generateQuote()
                }) {
                    Text("Shuffle")
                        .font(.custom("font", size: 21))
                        .padding()
                        .frame(maxWidth: .infinity)
                }

                Spacer()

                Button(action: {
                    self.copyToClipboard(text: self.currentQuote)
                }) {
                    Text("Copy")
                        .font(.custom("font", size: 21))
                        .padding()
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
        }
        .frame(width: 500, height: 300)
        .background(Color.black)
        .onAppear {
            self.loadQuotes()
            self.generateQuote()
        }
    }

    func loadQuotes() {
        if let filePath = Bundle.main.path(forResource: "quotes", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filePath)
                quotes = contents.components(separatedBy: .newlines).filter { !$0.isEmpty }
            } catch {
                print("Failed to load quotes: \(error.localizedDescription)")
            }
        }
    }

    func generateQuote() {
        guard !quotes.isEmpty else {
            currentQuote = "No quotes available."
            return
        }
        var rng = SystemRandomNumberGenerator()
        let randomIndex = Int.random(in: 0..<quotes.count, using: &rng)
        currentQuote = quotes[randomIndex]
    }

    func copyToClipboard(text: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(text, forType: .string)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

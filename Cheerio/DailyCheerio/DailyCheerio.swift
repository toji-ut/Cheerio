//
//  DailyCheerio.swift
//  DailyCheerio
//
//  Created by TOJI on 6/29/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
            SimpleEntry(date: Date(), quote: "Loading...")
        }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), quote: "Loading...")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []

        // Generate a timeline with a single entry for today's date
        let currentDate = Date()
        let entry = SimpleEntry(date: currentDate, quote: generateRandomQuote())
        entries.append(entry)

        // Set refresh policy to update daily
        let nextUpdateDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        let timeline = Timeline(entries: entries, policy: .after(nextUpdateDate))
        completion(timeline)
    }

    private func generateRandomQuote() -> String {
        // Simulated array of quotes
        let quotes = [
            "Admire someone else's beauty without questioning your own.",
            "So many years of education yet nobody ever taught us how to love ourselves and why it's important.",
            "It's better to love and lose than never love at all.",
            "Spend a little more time trying to make something of yourself and a little less time trying to impress people.",
            "Our purpose is never to get away from hard things. It's to find the hard things worth doing.",
            "Fill your life with adventures, not things. Have stories to tell, not stuff to show.",
            "Be strong, be weak, be whoever you want to be.",
            "You are enough.",
            "Cheer up, my dear. After every storm comes the sun. Happiness is waiting for you ahead.",
            "Do more things that make you forget to check your phone.",
            "Act as if it were impossible to fail.",
            "People wait all week for Friday, all year for summer, and all of life for happiness.",
            "Be the reason someone smiles today.",
            "My entire life can be described in one sentence: It didn't go as planned, and that's okay.",
            "Happiness looks good on you.",
            "The best view comes after the hardest climb.",
            "Life is not a waste as long as there is at least one person who cares for you.",
            "You were not born to just pay bills and die.",
            "Be who you needed when you were younger.",
            "Be a combination of all the best people you meet, not the worst.",
            "Stop being afraid of what could go wrong and start being positive about what could go right.",
            "A wolf does not lose sleep over the opinion of sheep.",
            "Be a Fruit Loop in a world of Cheerios.",
            "Just remember; someone loves everything you hate about yourself ~ Frank Ocean",
            "Selfish people end up having only their self.",
            "It is not death that a man should fear, but he should fear never beginning to live. ~ Marcus Aurelius",
            "Comparison is the thief of joy. ~ Theodore Roosevelt",
            "Take care of your body. It’s the only place you have to live in.",
            "Sleep is the best meditation ~ Dalai Lama",
            "You can’t do big things if you’re distracted by small things",
            "Know the difference between those who stay to feed the soil and those who come to grab the fruit.",
            "Chains of habit are too light to be felt until they are too heavy to be broken. ~ Warren Buffett",
            "Clutter is anything that doesn’t support your better self. ~ Eleanor Brown",
            "If it’s not a Hell Yeah!, it’s a no",
            "Live life as if everything is rigged in your favor ~ Rumi",
            "This too shall pass",
            "Not all who wander are lost",
            "Live each day as if your life had just begun",
            "Make yourself a priority",
            "Light tomorrow with today",
            "Don't worry about those who talk behind your back. They are behind you for a reason.",
            "In the end, everything will be okay. If it's not okay, it's not yet the end.",
            "When it rains, look for rainbows. When it's dark, look for stars.",
            "You have everything you need for the extravagant journey that is your life",
            "Be willing to be a beginner every single morning",
            "It is never too late to be what you might have been ~ George Eliot",
            "Go where you feel most alive",
            "Be yourself and you can be anything",
            "Don't get upset with people or situations, because both are powerless without your reaction.",
            "A warm smile is the universal language of kindness",
            "Wherever you go, go with all your heart",
            "No rain, no flowers",
            "If it doesn't open, it's not your door",
            "Push yourself, nobody else is going to do it for you",
            "Find something to be enthusiastic about, get good at it, and give it away ~ Paul Teodo",
            "The wound is where the light enters you ~ Rumi",
            "If you're suffering, maybe you're too self-focused",
            "Gratitude is wine for the soul. Go on, get drunk",
            "Perfection is boring, passion is inspiring.",
            "Learn the rules like a professional, then break the rules like an artist.",
            "We can never experience our real nature unless we expose ourselves to change",
            "It is no measure of health to be well adjusted to a profoundly sick society",
            "A smile is happiness you'll find right under your nose. ~ Tom Wilson",
            "Whether you think you can, or you think you can't--you're right. ~ Henry Ford",
            "The best way to make your dreams come true is to wake up. ~ Paul Valery",
            "Suffering is the difference between what is and what we want it to be.",
            "A wise man once said nothing",
            "How wonderful it is that nobody needs wait a single moment before beginning to improve the world.",
            "Talking too much about yourself can also be a means to conceal yourself ~ Nietzsche",
            "When you are grateful fear disappears and abundance appears. ~ Tony Robbins",
            "If you do what you’ve always done, you’ll get what you’ve always gotten.",
            "It is in your moments of decision that your destiny is shaped.",
            "The only thing that’s keeping you from getting what you want is the story you keep telling yourself.",
            "You don’t have to have a reason to feel good—you’re alive; you can feel good for no reason at all!",
            "If you talk about it, it’s a dream, if you envision it, it’s possible, but if you schedule it, it’s real.",
            "Stay committed to your decisions, but stay flexible in your approach.",
            "We accept the type of love we think we observe",
            "Treat yourself like you're someone that you love",
            "You only live once, but if you do it right, once is enough.",
            "The more we look for threats, the more we will see them.",
            "Creating rules for happiness is what prevents feeling happiness.",
            "The most important things in life are non-transactional. You can not conspire for happiness.",
            "Don't become a wandering generality. Be a meaningful specific.",
            "Those who dance are considered mad by those who cannot hear the music.",
            "The biggest mistake you can make is to accept the norms of your time.",
            "The way we act determines how we feel way more often than the way we feel determines how we act."
        ]
        
        
        var rng = SystemRandomNumberGenerator()
        let randomIndex = Int.random(in: 0..<quotes.count, using: &rng)
        return quotes[randomIndex]
    }
}


struct SimpleEntry: TimelineEntry {
    let date: Date
    let quote: String
}

struct DailyCheerioEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Daily Quote:")
                .font(.headline)
                .foregroundColor(.white)
            
            Text(entry.quote)
                .font(.custom("Times New Roman", size: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct DailyCheerio: Widget {
    let kind: String = "DailyCheerio"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DailyCheerioEntryView(entry: entry)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
        }
        .configurationDisplayName("Daily Cheerio Widget")
        .description("Display a daily quote to cheer up your day!")
        .supportedFamilies([.systemMedium])
    }
}

struct DailyCheerio_Previews: PreviewProvider {
    static var previews: some View {
        DailyCheerioEntryView(entry: SimpleEntry(date: Date(), quote: "Example Quote"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

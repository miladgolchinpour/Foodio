//
//  FoodioWidgets.swift
//  FoodioWidgets
//
//  Created by Milad Golchinpour on 6/25/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct FoodioWidgetsEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        if widgetFamily == .systemSmall {
            Image(String("Culver's ButterBurger"))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 200, maxHeight: 250)
        } else {
            VStack(alignment: .leading) {
                Text("Newest")
                    .font(.footnote.smallCaps())
                    .foregroundColor(.secondary)
                HStack {
                    Image("Culver's ButterBurger")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(maxWidth: 100)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Culver's ButterBurger")
                        Text("Colories: 123")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
            }
            .padding(.leading)
            .padding()
        }
    }
}

@main
struct FoodioWidgets: Widget {
    let kind: String = "Foodio Widgets"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            FoodioWidgetsEntryView(entry: entry)
        }
        .configurationDisplayName("New Food")
        .description("Show new foods in a widget")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct FoodioWidgets_Previews: PreviewProvider {
    static var previews: some View {
        FoodioWidgetsEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

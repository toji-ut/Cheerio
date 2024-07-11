//
//  AppIntent.swift
//  DailyCheerio
//
//  Created by TOJI on 6/29/24.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("WidgetToCheerUp")

    // An example configurable parameter.
    @Parameter(title: "DailyCheerio", default: "😃")
    var quote: String
}

//
//  Color+Ext.swift
//  WeatherMockScreen
//
//  Created by Artyom Petrichenko on 05.08.2024.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static func backgroundLinearGradient() -> LinearGradient {
        return LinearGradient(
            gradient: Gradient(colors: [Color.blue, Color.purple]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

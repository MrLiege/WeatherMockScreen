//
//  Date+Ext.swift
//  WeatherMockScreen
//
//  Created by Artyom Petrichenko on 05.08.2024.
//

import Foundation
import SwiftUI

extension Date {
    func customeDate() -> String {
        let customeDateStyle = DateFormatter()
        customeDateStyle.dateFormat = "d MMMM"
        
        return customeDateStyle.string(from: self)
    }
}

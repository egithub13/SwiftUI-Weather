//
//  Days.swift
//  SwiftUI-Weather
//
//  Created by eric hayes on 6/11/24.
//

import Foundation

struct Day: Hashable {
  
  var day: Days
  var image: WeatherIcon
  var temperature: Int
  
}

enum Days: String {
  case sunday = "SUN"
  case monday = "MON"
  case tuesday = "TUE"
  case wednesday = "WED"
  case thursday = "THU"
  case friday = "FRI"
  case saturday = "SAT"
}

enum WeatherIcon: String {
  case sunny = "sun.max.fill"
  case partlyCloudy = "cloud.sun.fill"
  case windSnow = "wind.snow"
  case sunset = "sunset.fill"
  case snow = "snow"
}

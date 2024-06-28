//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by eric hayes on 6/11/24.
//

import SwiftUI

struct WeatherButton: View {
  
  var title: String
  var textColor: Color
  var backgroundColor: Color
  
  var body: some View {
    Text(title)
      .frame(width: 360, height: 50)
      .background(backgroundColor)
      .foregroundColor(textColor)
      .font(.system(size: 20, weight: .bold, design: .default ))
      .cornerRadius(10)
  }
}

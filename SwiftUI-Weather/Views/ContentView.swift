//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by eric hayes on 6/5/24.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isNight = false
  @State var location: String
  
  var days = [Day(day: .tuesday, image: .partlyCloudy, temperature: 76),
             Day(day: .wednesday, image: .sunny, temperature: 80),
             Day(day: .thursday, image: .sunset, temperature: 66),
             Day(day: .friday, image: .windSnow, temperature: 28),
             Day(day: .saturday, image: .snow, temperature: 20)]
  
    var body: some View {
      ZStack {
        BackgroundView(isNight: isNight)
        VStack {
          Spacer()
          TextField(text: $location, prompt: Text("Enter a city")) {
            Text("Location")
          }
          .submitLabel(.search)
          .padding()
          .background(Color.white.opacity(0.8).cornerRadius(10))
          .foregroundColor(.black)
          .font(.headline)
          .onSubmit {
            print("Retrieving temperature for \(location)")
          }
          Spacer()
          CityNameView(cityName: "\(location)")
          MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill",
                                temperature: 76)
          HStack(spacing: 24) {
            ForEach(days, id: \.self) { day in
              WeatherDayView(day: day)
            }
          }
          Spacer()
          
          Button {
            isNight.toggle()
          } label: {
            WeatherButton(title: "Change Day Time",
                          textColor: .blue,
                          backgroundColor: .white)
          }
        }
        .ignoresSafeArea(.keyboard)
        .padding()
      }
    }
}

#Preview {
  ContentView(location: "")
}

struct WeatherDayView: View {
  
  var day: Day
  
  var body: some View {
    VStack(alignment: .center) {
      Text(day.day.rawValue)
        .font(.system(size: 16, weight: .medium, design: .default))
        .foregroundColor(.white)
      Image(systemName: day.image.rawValue)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      Text("\(day.temperature)°")
        .font(.system(size: 28, weight: .medium))
        .foregroundColor(.white)
    }
  }
}

struct BackgroundView: View {
  var isNight: Bool
  
  var body: some View {
    LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                               isNight ? .gray : Color("lightBlue")]),
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
  }
}

struct CityNameView: View {
  
  var cityName: String
  
  var body: some View {
    Text(cityName)
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct MainWeatherStatusView: View {
  
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack(spacing: 8) {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180)
      Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium, design: .default))
        .foregroundColor(.white)
    }
    .padding(.bottom, 40)
  }
}



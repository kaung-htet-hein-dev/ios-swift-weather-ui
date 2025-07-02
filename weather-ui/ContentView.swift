//
//  ContentView.swift
//  weather-ui
//
//  Created by Kaung Htet Hein on 01/07/2025.
//

import SwiftUI

struct WeatherData {
    var day: String
    var temperature: Int
    var image: String
}

let data: [WeatherData] = [
    WeatherData(day: "Mon", temperature: 20, image: "sun.max.fill"),
    WeatherData(day: "Tue", temperature: 25, image: "cloud.fill"),
    WeatherData(day: "Wed", temperature: 22, image: "cloud.sun.fill"),
    WeatherData(day: "Thu", temperature: 23, image: "cloud.moon.fill"),
    //    WeatherData(day: "Fri", temperature: 24, image: "cloud.moon.bolt.fill"),
    //    WeatherData(day: "Sat", temperature: 26, image: "cloud.sun.bolt.fill"),
    //    WeatherData(day: "Sun", temperature: 28, image: "sun.max.fill")
]

struct ContentView: View {
    @State private var isDayTime = true
    
    var body: some View {
        ZStack {
            BackgroundView(isDayTime: $isDayTime)
            
            VStack{
                Text("Myeik, Myanmar")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                
                
                VStack {
                    Image(systemName: isDayTime ? "sun.haze.fill" : "moon.fill")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("30°")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                }
                
                Spacer()
                
                HStack (spacing: 10) {
                    ForEach(data, id: \.day) { weather in
                        WeekDay(day: weather.day, temperature: weather.temperature, image: weather.image)
                        
                        
                    }
                }.padding(.horizontal, 10)
                
                
                Spacer()
                
                Button(action: {
                    isDayTime.toggle()
                }, label: {
                    Text("Change Day Time")
                        .font(Font.system(size: 20, design: .none))
                        .frame(minWidth: 180, minHeight: 50)
                        .foregroundStyle(.blue)
                        .background(Color.white.gradient)
                        .cornerRadius(10)
                })
                
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeekDay: View {
    var day: String
    var temperature: Int
    var image: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(day)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold, design: .rounded))
            
            Image(systemName: image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 26, weight: .bold, design: .rounded))
            
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(.white.opacity(0.2))
        .cornerRadius(20)
    }
    
}

struct BackgroundView: View {
    @Binding var isDayTime: Bool
    
    var topColor: Color {
        isDayTime ? Color.blue : Color.black
    }
    
    var bottomColor: Color {
        isDayTime ? Color("skyblue") : .gray
    }
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

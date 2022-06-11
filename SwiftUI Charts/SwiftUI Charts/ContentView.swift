//
//  ContentView.swift
//  SwiftUI Charts
//
//  Created by Devanshu Dev Chaudhary on 10/06/22.
//

import SwiftUI

enum chartType: String, CaseIterable {
    
    case area = "Area"
    case line = "Line"
    case point = "Point"
    case rule = "Rule"
    case bar = "Bar"
        
}

enum colorType: String, CaseIterable {
    
    case green = "Green"
    case blue = "Blue"
    case red = "Red"
    case yellow = "Yellow"
    case indigo = "Indigo"
    case orange = "Orange"
    case pink = "Pink"
    
    var ColorValue: Color {
        get {
            switch self {
            case .green: return Color.green
            case .blue: return Color.blue
            case .red: return Color.red
            case .yellow: return Color.yellow
            case .indigo: return Color.indigo
            case .orange: return Color.orange
            case .pink: return Color.pink
            }
        }
    }
}

struct EditChartView: View {
    @Binding var valueName: String
    @Binding var value: Float
    var body: some View {
            Slider(value: $value, in: 0...10000)
            HStack {
                TextField("\(value)", text: $valueName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text(String(format: "%.2f", value))
            }
        .frame(width: UIScreen.main.bounds.width - 100, height: 100)
    }
}

struct ContentView: View {
    
    @State private var selectedChart: chartType = .area
    @State private var selectedColor: colorType = .green
    @State private var title = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Picker("Choose a color", selection: $selectedColor) {
                    ForEach(colorType.allCases, id: \.self) { color in
                        Text(color.rawValue)
                            .tag(color)
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(.menu)
                Picker("Choose a chart type", selection: $selectedChart) {
                    ForEach(chartType.allCases, id: \.self) { category in
                        Text(category.rawValue)
                            .tag(category)
                    }
                }
                .pickerStyle(.menu)
                TextField("Enter Chart Name", text: $title)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 17))
                    .foregroundColor(.blue)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 50)
                NavigationLink(destination: ChartView(chartType: selectedChart, colorType: selectedColor, chartTitle: $title), label: {
                    Text("Make Chart")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                })
                .background(Color(UIColor.systemGreen))
                .cornerRadius(50)
                Spacer()
            }
        }
        .navigationTitle("Make Your Own Chart")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

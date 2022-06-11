//
//  ChartView.swift
//  SwiftUI Charts
//
//  Created by Devanshu Dev Chaudhary on 10/06/22.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    struct ChartData: Identifiable {
        var id = UUID()
        var category: String
        var value: Float
        
        init(_ category: String,_ value: Float) {
            self.category = category
            self.value = value
        }
    }
    
    var data: [ChartData]
    {[
        ChartData(title1,value1),
        ChartData(title2,value2),
        ChartData(title3,value3),
        ChartData(title4,value4)
    ]}
    
    let chartType: chartType
    let colorType: colorType
    @Binding var chartTitle: String
    
    @State var value1: Float = 0
    @State var value2: Float = 0
    @State var value3: Float = 0
    @State var value4: Float = 0
    @State var title1 = "Value 1"
    @State var title2 = "Value 2"
    @State var title3 = "Value 3"
    @State var title4 = "Value 4"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    Chart(data) {
                        switch(chartType) {
                        case .area:
                            AreaMark(
                                x: .value("Category", $0.category),
                                y: .value("Category", $0.value)
                            )
                            .foregroundStyle(colorType.ColorValue)
                        case .point:
                            PointMark(
                                x: .value("Category", $0.category),
                                y: .value("Value", $0.value)
                            )
                            .foregroundStyle(colorType.ColorValue)
                        case .rule:
                            RectangleMark(
                                x: .value("Category", $0.category),
                                y: .value("Value", $0.value)
                            )
                            .foregroundStyle(colorType.ColorValue)
                        case .line:
                            LineMark(
                                x: .value("Category", $0.category),
                                y: .value("Value", $0.value)
                            )
                            .foregroundStyle(colorType.ColorValue)
                        case .bar:
                            BarMark(
                                x: .value("Category", $0.category),
                                y: .value("Value", $0.value)
                            )
                            .foregroundStyle(colorType.ColorValue)
                        }
                    }
                    .padding()
                    ScrollView {
                        EditChartView(valueName: $title1, value: $value1)
                            .padding()
                        EditChartView(valueName: $title2, value: $value2)
                            .padding()
                        EditChartView(valueName: $title3, value: $value3)
                            .padding()
                        EditChartView(valueName: $title4, value: $value4)
                            .padding()
                    }
                }
            }
        }
        .navigationTitle(chartTitle)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(chartType: .bar, colorType: .green, chartTitle: .constant("Title"))
    }
}

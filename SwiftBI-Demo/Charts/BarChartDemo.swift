//
//  BarChart.swift
//  SwiftBI-Demo
//
//  Created by Marcus Wittenstam on 2021-11-24.
//

import SwiftUI
import SwiftBI

struct BarChartDemo: View {
    
    @State var title: String = "Monthly Sales"
    @State var legend: String =  "Month"
    @State var dataUnit: String = "SEK"
    @State var barColor: Color = .blue
    @State var maxValue: Double = 0
    @State var data  : [BarChartData] = [
         BarChartData(label: "January", value: 340.32),
         BarChartData(label: "February", value: 250.0),
         BarChartData(label: "March", value: 430.22),
         BarChartData(label: "April", value: 350.0),
         BarChartData(label: "May", value: 450.0),
         BarChartData(label: "June", value: 380.0),
         BarChartData(label: "July", value: 365.98),
         BarChartData(label: "August", value: 450.0),
         BarChartData(label: "September", value: 380.0),
         BarChartData(label: "Oktober", value: 365.98),
         BarChartData(label: "November", value: 450.0),
         BarChartData(label: "December", value: 380.0)
     ]
    
    @State var sliderMaxValue: Double = 0
     
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack(alignment: .center) {

                    ZStack(alignment: .center) {
                        Color(UIColor.systemBackground)
                            .cornerRadius(8)
                        VStack (alignment: .center) {
                            BarChart(title: $title, legend: $legend, dataUnit: $dataUnit, barColor: $barColor, maxValue: $maxValue, data: $data)
                                //.frame(height: 500)
                                .shadow(color: Color(uiColor: .clear).opacity(0.3), radius: 5, x: 0, y: 0)
                        }

                    }
                    .frame(width: geometry.size.width * 0.8, height: 400)
                    .shadow(color: Color(uiColor: .label).opacity(0.3), radius: 5, x: 0, y: 0)
                    
                    Button(action: {
                        
                        var barChartDataset = [BarChartData]()
                        for i in 1...Int.random(in: 5..<20) {
                            let barData = BarChartData(label: "random date \(i)", value: Double.random(in: 1..<500))
                            barChartDataset.append(barData)
                        }
                        self.data = barChartDataset

                    }) {
                        Text("Generate data")
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    .padding(.bottom)
                    
                    
                    
                    Slider(
                            value: $sliderMaxValue,
                            in: 0...700,
                            step: 50
                        ) {
                            Text("Max Value")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("700")
                        }
                        onEditingChanged: { editing in
                            maxValue = sliderMaxValue
                        }
                        .padding()
                        Text("\(Int(maxValue))")
                    
                }
                .frame(width: geometry.size.width)
            }
        }
    }

}

struct BarChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        BarChartDemo()
    }
}

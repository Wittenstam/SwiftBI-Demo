//
//  RadarChart.swift
//  SwiftBI-Demo
//
//  Created by Marcus Wittenstam on 2021-11-24.
//

import SwiftUI
import SwiftBI

struct RadarChartDemo: View {
    
    @State var title: String = "Monthly Sales"
    @State var gridColor: Color = .gray
    @State var dataColor: Color = .purple
    @State var dataUnit: String = "SEK"
    @State var legend: String =  "Month"
    @State var data : [RadarChartData] = [
        RadarChartData(label: "January", value: 340.32),
        RadarChartData(label: "February", value: 250.0),
        RadarChartData(label: "March", value: 430.22),
        RadarChartData(label: "April", value: 350.0),
        RadarChartData(label: "May", value: 450.0),
        RadarChartData(label: "June", value: 380.0),
        RadarChartData(label: "July", value: 365.98)
     ]
    @State var maxValue: Double = 0
    @State var divisions: Int = 10
    
    @State var sliderDivisions: Double = 10
    @State var sliderMaxValue: Double = 0
     
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack(alignment: .center) {
                    
                    ZStack(alignment: .center) {
                        Color(UIColor.systemBackground)
                            .cornerRadius(8)
                        VStack (alignment: .center) {
                            RadarChart(title: $title, gridColor: $gridColor, dataColor: $dataColor, dataUnit: $dataUnit, legend: $legend, data: $data, maxValue: $maxValue, divisions: $divisions)
                                //.frame(height: 400)
                                .shadow(color: Color(uiColor: .clear).opacity(0.3), radius: 5, x: 0, y: 0)
                        }

                    }
                    .frame(width: geometry.size.width * 0.8, height: 400)
                    .shadow(color: Color(uiColor: .label).opacity(0.3), radius: 5, x: 0, y: 0)
                    
                    Button(action: {
                        
                        var radarChartDataset = [RadarChartData]()
                        for i in 1...Int.random(in: 3..<7) {
                            let radarData = RadarChartData(label: "random date \(i)", value: Double.random(in: 1..<500))
                            radarChartDataset.append(radarData)
                        }
                        self.data = radarChartDataset

                    }) {
                        Text("Generate data")
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    .padding(.bottom)
                    
                    Slider(
                            value: $sliderDivisions,
                            in: 1...15 ,
                            step: 1
                        ) {
                            Text("Divisions")
                        } minimumValueLabel: {
                            Text("1")
                        } maximumValueLabel: {
                            Text("20")
                        }
                        onEditingChanged: { editing in
                            divisions = Int(sliderDivisions)
                        }
                        Text("\(divisions)")
                    
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
                        Text("\(Int(maxValue))")
                    
                    
                }
                .frame(width: geometry.size.width)
            }
        }
    }

}

struct RadarChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        RadarChartDemo()
    }
}

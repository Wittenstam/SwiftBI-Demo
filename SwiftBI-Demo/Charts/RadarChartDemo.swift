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
    @State var data = [
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
     
    var body: some View {
        RadarChart(title: $title, gridColor: $gridColor, dataColor: $dataColor, dataUnit: $dataUnit, legend: $legend, data: $data, maxValue: $maxValue, divisions: $divisions)
          .frame(height: 400)
    }

}

struct RadarChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        RadarChartDemo()
    }
}

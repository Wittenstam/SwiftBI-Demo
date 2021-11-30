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
    @State var data = [
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
     
    var body: some View {
        BarChart(title: $title, legend: $legend, dataUnit: $dataUnit, barColor: $barColor, maxValue: $maxValue, data: $data)
            .frame(height: 500)
    }

}

struct BarChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        BarChartDemo()
    }
}

//
//  LineChart.swift
//  SwiftBI-Demo
//
//  Created by Marcus Wittenstam on 2021-11-24.
//

import SwiftUI
import SwiftBI

struct LineChartDemo: View {
    
    @State var title: String = "Monthly Sales"
    @State var legend: String = "Month"
    @State var dataUnit: String =  "SEK"
    @State var maxValue: Double = 0
    @State var data = [
         LineChartDataLine(label: "2021", color: Color.pink, isFilled: false, isCurved: true, value:
             [
                 LineChartData(label: "January", value: 340.32),
                 LineChartData(label: "February", value: 250.0),
                 LineChartData(label: "March", value: 430.22),
                 LineChartData(label: "April", value: 350.0),
                 LineChartData(label: "May", value: 450.0),
                 LineChartData(label: "June", value: 380.0),
                 LineChartData(label: "July", value: 365.98)
             ]
         )
     ]
      
     var body: some View {
         LineChart(title: $title, legend: $legend, dataUnit: $dataUnit, maxValue: $maxValue, data: $data)
             .frame(height: 400)
     }

}

struct LineChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        LineChartDemo()
    }
}

//
//  RadarChart.swift
//  SwiftBI-Demo
//
//  Created by Marcus Wittenstam on 2021-11-24.
//

import SwiftUI
import SwiftBI

struct RadarChartDemo: View {
    
    let radarChartDataSet = [
        RadarChartData(label: "January", value: 340.32),
        RadarChartData(label: "February", value: 250.0),
        RadarChartData(label: "March", value: 430.22),
        RadarChartData(label: "April", value: 350.0),
        RadarChartData(label: "May", value: 450.0),
        RadarChartData(label: "June", value: 380.0),
        RadarChartData(label: "July", value: 365.98)
     ]
     
    var body: some View {
        RadarChart(title: "Monthly Sales", gridColor: Color.gray, dataColor: Color.purple, dataUnit: "SEK", legend: "Month", data: radarChartDataSet, maxValue: 0, divisions: 10)
          .frame(height: 400)
    }

}

struct RadarChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        RadarChartDemo()
    }
}

//
//  MultiLineChart.swift
//  SwiftBI-Demo
//
//  Created by Marcus Wittenstam on 2021-11-24.
//

import SwiftUI
import SwiftBI

struct MultiLineChartDemo: View {
    
    let multiLineChartDataSet = [
         LineChartDataLine(label: "2019", color: Color.green, isFilled: true, isCurved: true, value:
             [
                 LineChartData(label: "January", value: 340.32),
                 LineChartData(label: "February", value: 250.0),
                 LineChartData(label: "March", value: 430.22),
                 LineChartData(label: "April", value: 350.0),
                 LineChartData(label: "May", value: 450.0),
                 LineChartData(label: "June", value: 380.0),
                 LineChartData(label: "July", value: 365.98)
             ]
         ),
         LineChartDataLine(label: "2020", color: Color.blue, isFilled: false, isCurved: true, value:
             [
                 LineChartData(label: "January", value: 250.32),
                 LineChartData(label: "February", value: 360.0),
                 LineChartData(label: "March", value: 290.22),
                 LineChartData(label: "April", value: 510.0),
                 LineChartData(label: "May", value: 410.0),
                 LineChartData(label: "June", value: 180.0),
                 LineChartData(label: "July", value: 305.98)
             ]
         ),
         LineChartDataLine(label: "2021", color: Color.red, isFilled: false, isCurved: true, value:
             [
                 LineChartData(label: "January", value: 290.32),
                 LineChartData(label: "February", value: 310.0),
                 LineChartData(label: "March", value: 240.22),
                 LineChartData(label: "April", value: 480.0),
                 LineChartData(label: "May", value: 460.0),
                 LineChartData(label: "June", value: 290.0),
                 LineChartData(label: "July", value: 430.98)
             ]
         )
     ]
      
     var body: some View {
         LineChart(title: "Montly Sales", legend: "Month", dataUnit: "SEK", maxValue: 0, data: multiLineChartDataSet)
             .frame(height: 400)
     }

}

struct MultiLineChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineChartDemo()
    }
}

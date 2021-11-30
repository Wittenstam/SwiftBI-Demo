//
//  PieChart.swift
//  SwiftBI-Demo
//
//  Created by Marcus Wittenstam on 2021-11-24.
//

import SwiftUI
import SwiftBI

struct PieChartDemo: View {
    
    @State var title: String = "Monthly Sales"
    @State var dataUnit: String =  "SEK"
    @State var data = [
        PieChartData(label: "January", value: 150.32),
        PieChartData(label: "February", value: 202.32),
        PieChartData(label: "March", value: 390.22),
        PieChartData(label: "April", value: 350.0),
        PieChartData(label: "May", value: 460.33),
        PieChartData(label: "June", value: 320.02),
        PieChartData(label: "July", value: 50.98)
    ]
     
    var body: some View {
        PieChart(title: $title, dataUnit: $dataUnit, data: $data)
            .frame(height: 500)
    }

}

struct PieChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        PieChartDemo()
    }
}

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
    @State var showLegends: Bool =  true
    @State var dataUnit: String =  "SEK"
    @State var maxValue: Double = 0
    //@State var data = [LineChartDataLine]()
    @State var data : [LineChartDataLine] = [
        LineChartDataLine(label: "2020", color: Color.pink, isFilled: false, isCurved: true, value:
            [
                LineChartData(label: "January", value: 340.32),
                LineChartData(label: "February", value: 250.0),
                LineChartData(label: "March", value: 430.22),
                LineChartData(label: "April", value: 0.0),
                LineChartData(label: "May", value: 450.0),
                LineChartData(label: "June", value: 380.0),
                LineChartData(label: "July", value: 365.98)
            ]
        )
    ]
          
     var body: some View {
         GeometryReader { geometry in
             ScrollView{
                 VStack(alignment: .center) {
                     
                     ZStack(alignment: .center) {
                         Color(UIColor.systemBackground)
                             .cornerRadius(8)
                         VStack (alignment: .center) {
                             LineChart(title: $title, legend: $legend, showLegends: $showLegends, dataUnit: $dataUnit, maxValue: $maxValue,  data: $data)
                                 //.frame(height: 400)
                                 .shadow(color: Color(uiColor: .clear).opacity(0.3), radius: 5, x: 0, y: 0)
                         }

                     }
                     .frame(width: geometry.size.width * 0.8, height: 400)
                     .shadow(color: Color(uiColor: .label).opacity(0.3), radius: 5, x: 0, y: 0)
                 
                     
                     Button(action: {
                         
                         self.data.removeAll()
                         var lineChartDataset = [LineChartData]()
                         
                         for i in 1...Int.random(in: 5..<20) {
                             let lineData = LineChartData(label: "random date \(i)", value: Double.random(in: 1..<100))
                             lineChartDataset.append(lineData)
                         }

                         let LineChartDataLine = LineChartDataLine(label: "Random", color: Color.pink, isFilled: false, isCurved: true, value:lineChartDataset)

                         self.data.append(LineChartDataLine)

                     }) {
                         Text("Generate data")
                     }
                 }
                 .frame(width: geometry.size.width)
             }
         }

     }

}

struct LineChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        LineChartDemo()
    }
}

//
//  MultiLineChart.swift
//  SwiftBI-Demo
//
//  Created by Marcus Wittenstam on 2021-11-24.
//

import SwiftUI
import SwiftBI

struct MultiLineChartDemo: View {
    
    @State var title: String = "Monthly Sales"
    @State var legend: String = "Month"
    @State var showLegends: Bool =  true
    @State var dataUnit: String =  "SEK"
    @State var maxValue: Double = 0
    @State var data : [LineChartDataLine] = [
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
    
    @State var filled: Bool = false
    @State var curved: Bool = true
      
     var body: some View {
         GeometryReader { geometry in
             ScrollView{
                 VStack(alignment: .center) {
                     
                     ZStack(alignment: .center) {
                         Color(UIColor.systemBackground)
                             .cornerRadius(8)
                             .shadow(color: Color(uiColor: .label).opacity(0.3), radius: 5, x: 0, y: 0)
                         VStack (alignment: .center) {
                             LineChart(title: $title, legend: $legend, showLegends: $showLegends, dataUnit: $dataUnit, maxValue: $maxValue, data: $data)
                                 //.frame(height: 400)
                         }

                     }
                     .frame(width: geometry.size.width * 0.8, height: 400)
                     
                     
                     Button(action: {
                         
                         self.data.removeAll()
                         var lineChartDataset1 = [LineChartData]()
                         var lineChartDataset2 = [LineChartData]()
                         var lineChartDataset3 = [LineChartData]()
                         
                         for i in 1...Int.random(in: 5..<20) {
                             let lineData1 = LineChartData(label: "random date \(i)", value: Double.random(in: 1..<50))
                             lineChartDataset1.append(lineData1)
                             
                             let lineData2 = LineChartData(label: "random date \(i)", value: Double.random(in: 1..<50))
                             lineChartDataset2.append(lineData2)
                             
                             let lineData3 = LineChartData(label: "random date \(i)", value: Double.random(in: 1..<50))
                             lineChartDataset3.append(lineData3)
                         }

                         let LineChartDataLine1 = LineChartDataLine(label: "Random 1", color: Color.red, isFilled: filled, isCurved: curved, value:lineChartDataset1)
                         let LineChartDataLine2 = LineChartDataLine(label: "Random 2", color: Color.green, isFilled: filled, isCurved: curved, value:lineChartDataset2)
                         let LineChartDataLine3 = LineChartDataLine(label: "Random 3", color: Color.blue, isFilled: filled, isCurved: curved, value:lineChartDataset3)

                         self.data.append(LineChartDataLine1)
                         self.data.append(LineChartDataLine2)
                         self.data.append(LineChartDataLine3)

                     }) {
                         Text("Generate data")
                     }
                     .buttonStyle(.bordered)
                     .padding()
                     .padding(.bottom)
                     
                     
                     Toggle("Show Legends", isOn: $showLegends)
                         .padding(.leading)
                         .padding(.trailing)
                     
                     Toggle("Filled", isOn: $filled)
                         .padding(.leading)
                         .padding(.trailing)
                     
                     Toggle("Curved", isOn: $curved)
                         .padding(.leading)
                         .padding(.trailing)
                     
                 }
                 .frame(width: geometry.size.width)
             }
         }
     }

}

struct MultiLineChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineChartDemo()
    }
}

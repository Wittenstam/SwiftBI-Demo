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
    @State var showLegends: Bool =  true
    @State var data : [PieChartData] = [
        PieChartData(label: "January", value: 150.32),
        PieChartData(label: "February", value: 202.32),
        PieChartData(label: "March", value: 390.22),
        PieChartData(label: "April", value: 350.0),
        PieChartData(label: "May", value: 460.33),
        PieChartData(label: "June", value: 320.02),
        PieChartData(label: "July", value: 50.98)
    ]
     
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack(alignment: .center) {
                    
                    ZStack(alignment: .center) {
                        Color(UIColor.systemBackground)
                            .cornerRadius(8)
                            .shadow(color: Color(uiColor: .label).opacity(0.3), radius: 5, x: 0, y: 0)
                        VStack (alignment: .center) {
                            PieChart(title: $title, dataUnit: $dataUnit, showLegends: $showLegends, data: $data)
                                //.frame(height: 500)
                        }

                    }
                    .frame(width: geometry.size.width * 0.8, height: 400)
                    
                    
                    Button(action: {
                        
                        var pieChartDataset = [PieChartData]()
                        for i in 1...Int.random(in: 3..<7) {
                            let pieData = PieChartData(label: "random date \(i)", value: Double.random(in: 1..<100))
                            pieChartDataset.append(pieData)
                        }
                        self.data = pieChartDataset

                    }) {
                        Text("Generate data")
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    .padding(.bottom)
                    
                    
                    Toggle("Show Legends", isOn: $showLegends)
                        .padding(.leading)
                        .padding(.trailing)
                    
                }
                .frame(width: geometry.size.width)
            }
            
        }
    }

}

struct PieChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        PieChartDemo()
    }
}

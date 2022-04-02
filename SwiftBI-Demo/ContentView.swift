//
//  ContentView.swift
//  SwiftBI-Demo
//
//  Created by Marcus Wittenstam on 2021-11-24.
//

import SwiftUI

struct ContentView: View {
    
    struct Chart: Identifiable, Hashable {
        let chartType: String
        let id = UUID()
    }
    private var charts = [
        Chart(chartType: "Bar Chart"),
        Chart(chartType: "Line Chart"),
        Chart(chartType: "Multi Line Chart"),
        Chart(chartType: "Pie Chart"),
        Chart(chartType: "Radar Chart"),
        Chart(chartType: "Progress Chart")
    ]
    

    var body: some View {
        NavigationView {
            List(charts, id: \.self) { chart in
                NavigationLink(destination: getViewFromChartType(chart: chart) ) {
                    Text(chart.chartType)
                }
            }
            .padding(.top)
            .navigationTitle("SwiftBI Charts Demo")
        }
    }
    
    
    func getViewFromChartType(chart: Chart) -> AnyView {
        switch chart.chartType {
            case "Bar Chart" : return AnyView( BarChartDemo() )
            case "Line Chart" : return AnyView( LineChartDemo() )
            case "Multi Line Chart" : return AnyView( MultiLineChartDemo() )
            case "Pie Chart" : return AnyView( PieChartDemo() )
            case "Radar Chart" : return AnyView( RadarChartDemo() )
            case "Progress Chart" : return AnyView( ProgressChartDemo() )
        default: return AnyView(EmptyView())
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
            .previewDisplayName("iPhone 13")
            .preferredColorScheme(.dark) //$0
            
    }
}

//
//  ProgressChartDemo.swift
//  SwiftBI-Demo
//
//  Created by Marcus Wittenstam on 2022-03-22.
//

import SwiftUI
import SwiftBI

struct ProgressChartDemo: View {
    
    @State var title: String = "Timer"
    @State var legend: String =  "Minute timer"
    @State var dataUnit: String = "Seconds"
    @State var showProcentage: Bool = true
    @State var showLabel: Bool = true
    @State var progressColor: Color = .purple
    @State var maxValue: Double = 60
    @State var type: ProgressChartType = .circle
    @State var data: Double = 46.7
         
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack(alignment: .center) {

                    ZStack(alignment: .center) {
                        Color(UIColor.systemBackground)
                            .cornerRadius(8)
                            .shadow(color: Color(uiColor: .label).opacity(0.3), radius: 5, x: 0, y: 0)
                        VStack (alignment: .center) {
                            ProgressChart(
                                title: $title,
                                legend: $legend,
                                dataUnit: $dataUnit,
                                showProcentage: $showProcentage,
                                showLabel: $showLabel,
                                progressColor: $progressColor,
                                maxValue: $maxValue,
                                type: $type,
                                data: $data
                            )
                        }
                    }
                    .frame(width: geometry.size.width * 0.8, height: 400)
                    
                    VStack{
                        Text("Progress Chart Type")
                        Picker("", selection: $type) {
                            Text("Line").tag(ProgressChartType.line)
                            Text("Circle").tag(ProgressChartType.circle)
                            Text("Halfcircle").tag(ProgressChartType.halfcircle)
                        }
                    }
                    .padding()
                    .padding(.top)
                    
                    VStack{
                        Text("How to show value")
                        Picker("", selection: $showProcentage) {
                            Text("Procentage").tag(true)
                            Text("Value").tag(false)
                        }
                    }
                    .padding()
                    .padding(.top)
                    
                    Button(action: {
                        let randomValue = Double.random(in: 1..<100)
                        let randomMultiplier = Double.random(in: 1..<2)
                        self.data = randomValue
                        self.maxValue = randomValue * randomMultiplier
                    }) {
                        Text("Generate data")
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    .padding(.bottom)
                    
                }
                .frame(width: geometry.size.width)
            }
        }
    }
}

struct ProgressChartDemo_Previews: PreviewProvider {
    static var previews: some View {
        ProgressChartDemo()
    }
}

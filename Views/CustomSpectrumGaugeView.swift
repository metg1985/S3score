import SwiftUI

struct CustomSpectrumGaugeView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @Binding var selection1: Int
    @Binding var selection2: Int
    @Binding var selection3: Int
    @Binding var selection4: Int
    @Binding var selection5: Int
    @Binding var selection6: Int
    @Binding var selection7: Int
    @Binding var selection8: Int
    
    @Binding var initialSpectrumScore: Double
    @Binding var finalSpectrumScore: Double

    private let minValue = 0.0
    private let maxValue = 1.0
    
    let gradient = Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple])
    
    var body: some View {
        
        VStack {
            HStack{
                Text("Initial antimicrobial drugs:")
                    .font(.headline.lowercaseSmallCaps())
            }
            VStack {
                Text("\(ModelData().antimicrobials[selection1].drug)")
                if(selection2 != 0){
                    Text("\(ModelData().antimicrobials[selection2].drug)")
                    if(selection3 != 0){
                        Text("\(ModelData().antimicrobials[selection3].drug)")
                        if(selection4 != 0){
                            Text("\(ModelData().antimicrobials[selection4].drug)")
                        }
                    }
                }
            }
            
            VStack {
                Gauge(value: initialSpectrumScore, in: minValue...maxValue) {
                    Label("Initial S\u{00B3}score", systemImage: "gauge.high")
                } currentValueLabel: {
                    Text(String(format: "%.2f", initialSpectrumScore))
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("1")
                }
                .gaugeStyle(.accessoryCircular)
                .tint(gradient)
            }
        }
        .padding()
        
        HStack{
            Text("Final antimicrobial drugs:")
                .font(.headline.lowercaseSmallCaps())
        }
        VStack {
            Text("\(ModelData().antimicrobials[selection5].drug)")
            if(selection6 != 0){
                Text("\(ModelData().antimicrobials[selection6].drug)")
                if(selection7 != 0){
                    Text("\(ModelData().antimicrobials[selection7].drug)")
                    if(selection8 != 0){
                        Text("\(ModelData().antimicrobials[selection8].drug)")
                    }
                }
            }
        }
        
        VStack {
            Gauge(value: finalSpectrumScore, in: minValue...maxValue) {
                Label("Final S\u{00B3} score", systemImage: "gauge.medium")
            } currentValueLabel: {
                Text(String(format: "%.2f", finalSpectrumScore))
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("1")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(gradient)
        }
        .padding()
    }
    
    
}

struct CustomSpectrumGaugeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSpectrumGaugeView(selection1: .constant(1), selection2: .constant(2), selection3: .constant(3), selection4: .constant(4), selection5: .constant(5), selection6: .constant(6), selection7: .constant(7), selection8: .constant(8),initialSpectrumScore: .constant(0.15), finalSpectrumScore: .constant(0.85))
    }
}



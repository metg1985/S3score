import SwiftUI
import Accelerate

struct FilteredAntimicrobial: View {
    @EnvironmentObject var modelData: ModelData
    
    @Binding var selection1: Int
    @Binding var selection2: Int
    @Binding var selection3: Int
    @Binding var selection4: Int
    @Binding var selection5: Int
    @Binding var selection6: Int
    @Binding var selection7: Int
    @Binding var selection8: Int
    @Binding var selection9: Int
    @Binding var selection10: Int
    
    @Binding var initialSpectrumScore: Double
    @Binding var finalSpectrumScore: Double
    @Binding var deltaSpectrumScore: Double
    
    private let minValue = 0.0
    private let maxValue = 100.0
    
    let gradient = Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple])
    
    var calc: () -> Void
    
    var body: some View {
        
        List{
            
            VStack {
                HStack{
                    Text("Initial antimicrobial drug(s):")
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
                                if(selection5 != 0){
                                    Text("\(ModelData().antimicrobials[selection5].drug)")
                                }
                            }
                        }
                    }
                }
                
                Gauge(value: initialSpectrumScore, in: minValue...maxValue) {
                    Label("S\u{00B3} score", systemImage: "gauge.high")
                } currentValueLabel: {
                    Text(String(format: "%.2f", initialSpectrumScore))
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                }
                .gaugeStyle(.accessoryCircular)
                .tint(gradient)
                
                HStack{
                    Text("Final antimicrobial drug(s):")
                        .font(.headline.lowercaseSmallCaps())
                }
                VStack {
                    Text("\(ModelData().antimicrobials[selection6].drug)")
                    if(selection7 != 0){
                        Text("\(ModelData().antimicrobials[selection7].drug)")
                        if(selection8 != 0){
                            Text("\(ModelData().antimicrobials[selection8].drug)")
                            if(selection9 != 0){
                                Text("\(ModelData().antimicrobials[selection9].drug)")
                                if(selection10 != 0){
                                    Text("\(ModelData().antimicrobials[selection10].drug)")
                                }
                            }
                        }
                    }
                }
                
                Gauge(value: finalSpectrumScore, in: minValue...maxValue) {
                    Label("S\u{00B3} score", systemImage: "gauge.high")
                } currentValueLabel: {
                    Text(String(format: "%.2f", finalSpectrumScore))
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                }
                .gaugeStyle(.accessoryCircular)
                .tint(gradient)
            }.onAppear(perform: self.calc)
            
            
            HStack{
                Text("Delta S\u{00B3} score:")
                    .font(.headline.lowercaseSmallCaps())
                Text(String(format: "%.2f", deltaSpectrumScore))
            }
            
            if(deltaSpectrumScore < 0){
                VStack{
                    Text("Outcome")
                        .font(.headline.lowercaseSmallCaps())
                    Text("De-escalation was successful !")
                }
            } else {
                VStack{
                    Text("Outcome")
                        .font(.headline.lowercaseSmallCaps())
                    Text("No de-escalation was performed.")
                }
            }
        }.padding()
    }
}

struct FilteredAntimicrobial_Previews: PreviewProvider {
    static var previews: some View {
        AntimicrobialList()
    }
}

extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(.zero, +) }
}


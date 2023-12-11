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
    
    @Binding var initialSpectrumScore: Double
    @Binding var finalSpectrumScore: Double
    
    var calc: () -> Void
    
    var body: some View {
        
        VStack {
            Text("initial S3score: \(initialSpectrumScore)")
            Text("final S3score: \(finalSpectrumScore)")
        }.onAppear(perform: self.calc)
        
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


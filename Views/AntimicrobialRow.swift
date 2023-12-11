import SwiftUI

struct AntimicrobialRow: View {
    var antimicrobial: Antimicrobial
    
    var body: some View {
            HStack {
                Text(antimicrobial.drug)

                Spacer()

            }
        }
    
}

struct AntimicrobialRow_Previews: PreviewProvider {
    static var antimicrobials = ModelData().antimicrobials
    
    static var previews: some View {
        Group {
            AntimicrobialRow(antimicrobial: antimicrobials[0])
            AntimicrobialRow(antimicrobial: antimicrobials[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

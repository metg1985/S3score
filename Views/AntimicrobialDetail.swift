import SwiftUI

struct AntimicrobialDetail: View {
    var antimicrobial: Antimicrobial
    
    var body: some View {
        
        ScrollView {

                    VStack(alignment: .leading) {
                        Text(antimicrobial.drug)
                            .font(.title)

                        HStack {
                            Text("\(antimicrobial.id)")
                            Spacer()
                            Text(antimicrobial.drug)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                        Divider()

                        Text("About \(antimicrobial.drug)")
                            .font(.title2)
                        Text("\(antimicrobial.escherichiaColi)")
                    }
                    .padding()
                }
        .navigationTitle(antimicrobial.drug)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct AntimicrobialDetail_Previews: PreviewProvider {
    static var previews: some View {
        AntimicrobialDetail(antimicrobial: ModelData().antimicrobials[0])
    }
}

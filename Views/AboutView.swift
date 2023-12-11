import SwiftUI

struct AboutView: View {
    var body: some View {
        
        VStack {
            VStack(alignment: .leading){
                Text("About")
                    .font(.title)
                    .fontWeight(Font.Weight.bold)
                VStack {
                    Text("Developper: ")
                        .font(.subheadline)
                        .fontWeight(Font.Weight.semibold)
                }
                VStack {
                    Text("Mikaël de Lorenzi-Tognon, MD-PhD")
                    Link("mikael.delorenzi@icloud.com", destination: URL(string: "mailto:mikael.delorenzi@icloud.com")!)
                }
                .font(.subheadline)
                .multilineTextAlignment(.center)
                
                Divider()
                
                Text("References")
                    .font(.title)
                    .fontWeight(Font.Weight.bold)
                VStack {
                    Text("- EUCAST breakpoints table v13.0")
                    Text("- EUCAST: Expected Resistant Phenotypes Version 1.1 March 2022")
                }
                .font(.subheadline)
                .multilineTextAlignment(.center)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
            .environmentObject(ModelData())
    }
}

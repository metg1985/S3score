import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Image("S3icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100.0, height: 100.0)
            }
            Section(header: Text("Simplified Spectrum Score – S\u{00B3} score")){
                List{
                    HStack{
                        NavigationLink("S\u{00B3} score calculator", destination: AntimicrobialList())
                    }
                    HStack{
                        NavigationLink("Methodology", destination: MethodView())
                    }
                    HStack{
                        NavigationLink("Drug Score List", destination: DrugScoreList())
                    }
                    HStack{
                        NavigationLink("About", destination: AboutView())
                    }
                }
            }
        }.navigationTitle("Simplified Spectrum Score")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


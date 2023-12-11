import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        NavigationStack{
            Section(header: Text("Main")){
                List{
                    HStack{
                        NavigationLink("S3score calculator", destination: AntimicrobialList())
                    }
                    HStack{
                        NavigationLink("About", destination: AboutView())
                    }
                }
            }
        }.navigationTitle("Main menu")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

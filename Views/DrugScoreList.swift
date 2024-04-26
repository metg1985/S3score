import SwiftUI
import Accelerate

struct DrugScoreList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State var index: Int = 0
    @State var spectrumScore = 0.0
    
    private let minValue = 0.0
    private let maxValue = 100.0
    
    let gradient = Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple])
    
    func calc() {
        
        var ArrayScores: [Double]
        
        ArrayScores = [
            ModelData().antimicrobials[index].citrobacterBraakii,
            ModelData().antimicrobials[index].citrobacterFreundii,
            ModelData().antimicrobials[index].achromobacterXylosoxidans,
            ModelData().antimicrobials[index].acinetobacterSp,
            ModelData().antimicrobials[index].aeromonasDhakensis,
            ModelData().antimicrobials[index].aeromonasSp,
            ModelData().antimicrobials[index].anaplasmaPhagocytophilum,
            ModelData().antimicrobials[index].bacillusSp,
            ModelData().antimicrobials[index].bacteroidesSp,
            ModelData().antimicrobials[index].bordetellaPertussis,
            ModelData().antimicrobials[index].borreliaBurgorferi,
            ModelData().antimicrobials[index].burkholderiaPseudomallei,
            ModelData().antimicrobials[index].chlamydiaPneumoniae,
            ModelData().antimicrobials[index].chlamydiaPsittaci,
            ModelData().antimicrobials[index].chlamydiaTrachomatis,
            ModelData().antimicrobials[index].citrobacterSp,
            ModelData().antimicrobials[index].clostridioidesDifficile,
            ModelData().antimicrobials[index].clostridiumPerfringens,
            ModelData().antimicrobials[index].corynebacteriumSp,
            ModelData().antimicrobials[index].coxiellaBurnetii,
            ModelData().antimicrobials[index].cutibacteriumAcnes,
            ModelData().antimicrobials[index].ehrlichiaChaffeensis,
            ModelData().antimicrobials[index].eikenellaSp,
            ModelData().antimicrobials[index].enterobacterSp,
            ModelData().antimicrobials[index].enterococcusCasseliflavus,
            ModelData().antimicrobials[index].enterococcusFaecalis,
            ModelData().antimicrobials[index].enterococcusFaecium,
            ModelData().antimicrobials[index].enterococcusGallinarum,
            ModelData().antimicrobials[index].enterococcusSp,
            ModelData().antimicrobials[index].escherichiaHermanii,
            ModelData().antimicrobials[index].francisellaTularensis,
            ModelData().antimicrobials[index].fusobacteriumNecrophorum,
            ModelData().antimicrobials[index].haemophilusDucreyi,
            ModelData().antimicrobials[index].haemophilusInfluenzae,
            ModelData().antimicrobials[index].helicobacterPylori,
            ModelData().antimicrobials[index].kingellaKingae,
            ModelData().antimicrobials[index].klebsiellaAerogenes,
            ModelData().antimicrobials[index].legionellaPneumophila,
            ModelData().antimicrobials[index].leptospiraInterrogans,
            ModelData().antimicrobials[index].listeriaMonocytogenes,
            ModelData().antimicrobials[index].moraxellaCatarrhalis,
            ModelData().antimicrobials[index].morganellaSp,
            ModelData().antimicrobials[index].mycoplasmaGenitalium,
            ModelData().antimicrobials[index].mycoplasmaHominis,
            ModelData().antimicrobials[index].mycoplasmaPneumoniae,
            ModelData().antimicrobials[index].neisseriaGonorrhoeae,
            ModelData().antimicrobials[index].neisseriaMeningitidis,
            ModelData().antimicrobials[index].nocardiaAbscessus,
            ModelData().antimicrobials[index].nocardiaAsteroides,
            ModelData().antimicrobials[index].nocardiaCyriacigeorgica,
            ModelData().antimicrobials[index].nocardiaFarcinica,
            ModelData().antimicrobials[index].nocardiaNova,
            ModelData().antimicrobials[index].nocardiaTransvalensis,
            ModelData().antimicrobials[index].prevotellaSp,
            ModelData().antimicrobials[index].proteusMirabilis,
            ModelData().antimicrobials[index].proteusPenneri,
            ModelData().antimicrobials[index].proteusVulgaris,
            ModelData().antimicrobials[index].providenciaSp,
            ModelData().antimicrobials[index].pseudomonasAeruginosa,
            ModelData().antimicrobials[index].rickettsiaRickettsi,
            ModelData().antimicrobials[index].salmonellaSp,
            ModelData().antimicrobials[index].serratiaMarcescens,
            ModelData().antimicrobials[index].shigellaSp,
            ModelData().antimicrobials[index].staphylococcusSaprophyticus,
            ModelData().antimicrobials[index].stenotrophomonasMaltophilia,
            ModelData().antimicrobials[index].streptococcusPneumoniae,
            ModelData().antimicrobials[index].treponemaPallidum,
            ModelData().antimicrobials[index].ureaplasmaParvum,
            ModelData().antimicrobials[index].ureaplasmaUrealyticum,
            ModelData().antimicrobials[index].vibrioSp,
            ModelData().antimicrobials[index].yersiniaEnterocolitica,
            ModelData().antimicrobials[index].yersiniaPseudotuberculosis,
            ModelData().antimicrobials[index].escherichiaColi,
            ModelData().antimicrobials[index].klebsiellaSp,
            ModelData().antimicrobials[index].aerococcusSp,
            ModelData().antimicrobials[index].bacillusAnthracis,
            ModelData().antimicrobials[index].bartonellaHenselae,
            ModelData().antimicrobials[index].brucellaMelitensis,
            ModelData().antimicrobials[index].burkholderiacepaciaComplex,
            ModelData().antimicrobials[index].campylobacterSp,
            ModelData().antimicrobials[index].citrobacterSpEsbl,
            ModelData().antimicrobials[index].citrobacterSpKpc,
            ModelData().antimicrobials[index].citrobacterSpMbl,
            ModelData().antimicrobials[index].citrobacterSpOxa,
            ModelData().antimicrobials[index].corynebacteriumDiphtheriae,
            ModelData().antimicrobials[index].corynebacteriumUlcerans,
            ModelData().antimicrobials[index].enterobacterSpKpc,
            ModelData().antimicrobials[index].enterobacterSpMbl,
            ModelData().antimicrobials[index].enterobacterSpOxa,
            ModelData().antimicrobials[index].enterococcusSpVRE,
            ModelData().antimicrobials[index].escherichiaColiEsbl,
            ModelData().antimicrobials[index].escherichiaColiKpc,
            ModelData().antimicrobials[index].escherichiaColiMbl,
            ModelData().antimicrobials[index].escherichiaColiOxa,
            ModelData().antimicrobials[index].hafniaSp,
            ModelData().antimicrobials[index].klebsiellaSpEsbl,
            ModelData().antimicrobials[index].klebsiellaSpKpc,
            ModelData().antimicrobials[index].klebsiellaSpMbl,
            ModelData().antimicrobials[index].klebsiellaSpOxa,
            ModelData().antimicrobials[index].mrCons,
            ModelData().antimicrobials[index].mrSa,
            ModelData().antimicrobials[index].mrStaphylococcusCapitis,
            ModelData().antimicrobials[index].mrStaphylococcusSaprophyticus,
            ModelData().antimicrobials[index].msCons,
            ModelData().antimicrobials[index].msSa,
            ModelData().antimicrobials[index].pasteurellaSp,
            ModelData().antimicrobials[index].proteusMirabilisEsbl,
            ModelData().antimicrobials[index].staphylococcusCapitis,
            ModelData().antimicrobials[index].streptococcusAnginosusgroup,
            ModelData().antimicrobials[index].streptococcusGroupabcg,
            ModelData().antimicrobials[index].viridansStreptococci
        ]
        
        let score = vDSP.sum(ArrayScores)
        
        spectrumScore = (score / 837) * 100
        
    }
    
    var body: some View {
        // display a table with each drug - S3score (alone)
        
        NavigationStack{
            Text("Choose antimicrobial drug")
            HStack {
                Picker("", selection: $index){
                    ForEach(ModelData().antimicrobials, id:\.id){ item in
                        Text("\(item.drug)")
                    }
                }
                .pickerStyle(.menu)
                
                VStack {
                    Gauge(value: spectrumScore, in: minValue...maxValue) {
                        Label("S\u{00B3} score", systemImage: "gauge.high")
                    } currentValueLabel: {
                        Text(String(format: "%.2f", spectrumScore))
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("100")
                    }
                    .gaugeStyle(.accessoryCircular)
                    .tint(gradient)
                }
            }
            
            Spacer()
            Button("Calculate"){
                self.calc()
            }.buttonStyle(.bordered)
                .foregroundColor(.red)
                .buttonBorderShape(.capsule)
        }
    }
}

struct DrugScoreList_Previews: PreviewProvider {
    static var previews: some View {
        DrugScoreList()
    }
}


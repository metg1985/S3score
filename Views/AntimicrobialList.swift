import SwiftUI
import Accelerate

struct AntimicrobialList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var selection1 = 0
    @State var selection2 = 0
    @State var selection3 = 0
    @State var selection4 = 0
    @State var selection5 = 0
    @State var selection6 = 0
    @State var selection7 = 0
    @State var selection8 = 0
    
    @State var initialSpectrumScore: Double = 0.0
    @State var finalSpectrumScore: Double = 0.0
    
    func calc() {
        
        var initialArrayScores: [Double]
        var finalArrayScores: [Double]
        
        if(selection2 != 0){
            
            initialArrayScores = [
                [ModelData().antimicrobials[selection1].klebsiellaSpMBL, ModelData().antimicrobials[selection2].klebsiellaSpMBL, ModelData().antimicrobials[selection3].klebsiellaSpMBL, ModelData().antimicrobials[selection4].klebsiellaSpMBL].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaSpKPC, ModelData().antimicrobials[selection2].klebsiellaSpKPC, ModelData().antimicrobials[selection3].klebsiellaSpKPC, ModelData().antimicrobials[selection4].klebsiellaSpKPC].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaOxytoca, ModelData().antimicrobials[selection2].klebsiellaOxytoca, ModelData().antimicrobials[selection3].klebsiellaOxytoca, ModelData().antimicrobials[selection4].klebsiellaOxytoca].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaOxytocaESBL, ModelData().antimicrobials[selection2].klebsiellaOxytocaESBL, ModelData().antimicrobials[selection3].klebsiellaOxytocaESBL, ModelData().antimicrobials[selection4].klebsiellaOxytocaESBL].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaPneumoniae, ModelData().antimicrobials[selection2].klebsiellaPneumoniae, ModelData().antimicrobials[selection3].klebsiellaPneumoniae, ModelData().antimicrobials[selection4].klebsiellaPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].raoultellaSp, ModelData().antimicrobials[selection2].raoultellaSp, ModelData().antimicrobials[selection3].raoultellaSp, ModelData().antimicrobials[selection4].raoultellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].serratiaMarcescens, ModelData().antimicrobials[selection2].serratiaMarcescens, ModelData().antimicrobials[selection3].serratiaMarcescens, ModelData().antimicrobials[selection4].serratiaMarcescens].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection2].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection3].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection4].yersiniaPseudotuberculosis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].yersiniaEnterocolitica, ModelData().antimicrobials[selection2].yersiniaEnterocolitica, ModelData().antimicrobials[selection3].yersiniaEnterocolitica, ModelData().antimicrobials[selection4].yersiniaEnterocolitica].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].salmonellaSp, ModelData().antimicrobials[selection2].salmonellaSp, ModelData().antimicrobials[selection3].salmonellaSp, ModelData().antimicrobials[selection4].salmonellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].escherichiaHermanii, ModelData().antimicrobials[selection2].escherichiaHermanii, ModelData().antimicrobials[selection3].escherichiaHermanii, ModelData().antimicrobials[selection4].escherichiaHermanii].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].hafniaAlvei, ModelData().antimicrobials[selection2].hafniaAlvei, ModelData().antimicrobials[selection3].hafniaAlvei, ModelData().antimicrobials[selection4].hafniaAlvei].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].shigellaSp, ModelData().antimicrobials[selection2].shigellaSp, ModelData().antimicrobials[selection3].shigellaSp, ModelData().antimicrobials[selection4].shigellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].citrobacterSp, ModelData().antimicrobials[selection2].citrobacterSp, ModelData().antimicrobials[selection3].citrobacterSp, ModelData().antimicrobials[selection4].citrobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].citrobacterFreundii, ModelData().antimicrobials[selection2].citrobacterFreundii, ModelData().antimicrobials[selection3].citrobacterFreundii, ModelData().antimicrobials[selection4].citrobacterFreundii].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].citrobacterBraakii, ModelData().antimicrobials[selection2].citrobacterBraakii, ModelData().antimicrobials[selection3].citrobacterBraakii, ModelData().antimicrobials[selection4].citrobacterBraakii].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterobacterSp, ModelData().antimicrobials[selection2].enterobacterSp, ModelData().antimicrobials[selection3].enterobacterSp, ModelData().antimicrobials[selection4].enterobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterobacterSpOXA, ModelData().antimicrobials[selection2].enterobacterSpOXA, ModelData().antimicrobials[selection3].enterobacterSpOXA, ModelData().antimicrobials[selection4].enterobacterSpOXA].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterobacterSpMBL, ModelData().antimicrobials[selection2].enterobacterSpMBL, ModelData().antimicrobials[selection3].enterobacterSpMBL, ModelData().antimicrobials[selection4].enterobacterSpMBL].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterobacterSpKPC, ModelData().antimicrobials[selection2].enterobacterSpKPC, ModelData().antimicrobials[selection3].enterobacterSpKPC, ModelData().antimicrobials[selection4].enterobacterSpKPC].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaAerogenes, ModelData().antimicrobials[selection2].klebsiellaAerogenes, ModelData().antimicrobials[selection3].klebsiellaAerogenes, ModelData().antimicrobials[selection4].klebsiellaAerogenes].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].providenciaSp, ModelData().antimicrobials[selection2].providenciaSp, ModelData().antimicrobials[selection3].providenciaSp, ModelData().antimicrobials[selection4].providenciaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].morganellaSp, ModelData().antimicrobials[selection2].morganellaSp, ModelData().antimicrobials[selection3].morganellaSp, ModelData().antimicrobials[selection4].morganellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].proteusMirabilis, ModelData().antimicrobials[selection2].proteusMirabilis, ModelData().antimicrobials[selection3].proteusMirabilis, ModelData().antimicrobials[selection4].proteusMirabilis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].proteusMirabilisESBL, ModelData().antimicrobials[selection2].proteusMirabilisESBL, ModelData().antimicrobials[selection3].proteusMirabilisESBL, ModelData().antimicrobials[selection4].proteusMirabilisESBL].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].proteusPenneri, ModelData().antimicrobials[selection2].proteusPenneri, ModelData().antimicrobials[selection3].proteusPenneri, ModelData().antimicrobials[selection4].proteusPenneri].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].proteusVulgaris, ModelData().antimicrobials[selection2].proteusVulgaris, ModelData().antimicrobials[selection3].proteusVulgaris, ModelData().antimicrobials[selection4].proteusVulgaris].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].pseudomonasAeruginosa, ModelData().antimicrobials[selection2].pseudomonasAeruginosa, ModelData().antimicrobials[selection3].pseudomonasAeruginosa, ModelData().antimicrobials[selection4].pseudomonasAeruginosa].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection2].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection3].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection4].stenotrophomonasMaltophilia].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].acinetobacterSp, ModelData().antimicrobials[selection2].acinetobacterSp, ModelData().antimicrobials[selection3].acinetobacterSp, ModelData().antimicrobials[selection4].acinetobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].msConStaphylococci, ModelData().antimicrobials[selection2].msConStaphylococci, ModelData().antimicrobials[selection3].msConStaphylococci, ModelData().antimicrobials[selection4].msConStaphylococci].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mrConStaphylococci, ModelData().antimicrobials[selection2].mrConStaphylococci, ModelData().antimicrobials[selection3].mrConStaphylococci, ModelData().antimicrobials[selection4].mrConStaphylococci].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].staphylococcusLugdunensis, ModelData().antimicrobials[selection2].staphylococcusLugdunensis, ModelData().antimicrobials[selection3].staphylococcusLugdunensis, ModelData().antimicrobials[selection4].staphylococcusLugdunensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].staphylococcusSaprophyticus, ModelData().antimicrobials[selection2].staphylococcusSaprophyticus, ModelData().antimicrobials[selection3].staphylococcusSaprophyticus, ModelData().antimicrobials[selection4].staphylococcusSaprophyticus].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mssa, ModelData().antimicrobials[selection2].mssa, ModelData().antimicrobials[selection3].mssa, ModelData().antimicrobials[selection4].mssa].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mrsa, ModelData().antimicrobials[selection2].mrsa, ModelData().antimicrobials[selection3].mrsa, ModelData().antimicrobials[selection4].mrsa].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusSp, ModelData().antimicrobials[selection2].enterococcusSp, ModelData().antimicrobials[selection3].enterococcusSp, ModelData().antimicrobials[selection4].enterococcusSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusFaecalis, ModelData().antimicrobials[selection2].enterococcusFaecalis, ModelData().antimicrobials[selection3].enterococcusFaecalis, ModelData().antimicrobials[selection4].enterococcusFaecalis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusFaecium, ModelData().antimicrobials[selection2].enterococcusFaecium, ModelData().antimicrobials[selection3].enterococcusFaecium, ModelData().antimicrobials[selection4].enterococcusFaecium].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusGallinarum, ModelData().antimicrobials[selection2].enterococcusGallinarum, ModelData().antimicrobials[selection3].enterococcusGallinarum, ModelData().antimicrobials[selection4].enterococcusGallinarum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusCasseliflavus, ModelData().antimicrobials[selection2].enterococcusCasseliflavus, ModelData().antimicrobials[selection3].enterococcusCasseliflavus, ModelData().antimicrobials[selection4].enterococcusCasseliflavus].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].streptococciABCG, ModelData().antimicrobials[selection2].streptococciABCG, ModelData().antimicrobials[selection3].streptococciABCG, ModelData().antimicrobials[selection4].streptococciABCG].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].streptococcusPneumoniae, ModelData().antimicrobials[selection2].streptococcusPneumoniae, ModelData().antimicrobials[selection3].streptococcusPneumoniae, ModelData().antimicrobials[selection4].streptococcusPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].streptococcusViridans, ModelData().antimicrobials[selection2].streptococcusViridans, ModelData().antimicrobials[selection3].streptococcusViridans, ModelData().antimicrobials[selection4].streptococcusViridans].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].streptococcusAnginosus, ModelData().antimicrobials[selection2].streptococcusAnginosus, ModelData().antimicrobials[selection3].streptococcusAnginosus, ModelData().antimicrobials[selection4].streptococcusAnginosus].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].haemophilusInfluenzae, ModelData().antimicrobials[selection2].haemophilusInfluenzae, ModelData().antimicrobials[selection3].haemophilusInfluenzae, ModelData().antimicrobials[selection4].haemophilusInfluenzae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].moraxellaCatarrhalis, ModelData().antimicrobials[selection2].moraxellaCatarrhalis, ModelData().antimicrobials[selection3].moraxellaCatarrhalis, ModelData().antimicrobials[selection4].moraxellaCatarrhalis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].neisseriaGonorrhoeae, ModelData().antimicrobials[selection2].neisseriaGonorrhoeae, ModelData().antimicrobials[selection3].neisseriaGonorrhoeae, ModelData().antimicrobials[selection4].neisseriaGonorrhoeae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].neisseriaMeningitidis, ModelData().antimicrobials[selection2].neisseriaMeningitidis, ModelData().antimicrobials[selection3].neisseriaMeningitidis, ModelData().antimicrobials[selection4].neisseriaMeningitidis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].helicobacterPylori, ModelData().antimicrobials[selection2].helicobacterPylori, ModelData().antimicrobials[selection3].helicobacterPylori, ModelData().antimicrobials[selection4].helicobacterPylori].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].listeriaMonocytogenes, ModelData().antimicrobials[selection2].listeriaMonocytogenes, ModelData().antimicrobials[selection3].listeriaMonocytogenes, ModelData().antimicrobials[selection4].listeriaMonocytogenes].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].pasteurellaMultocida, ModelData().antimicrobials[selection2].pasteurellaMultocida, ModelData().antimicrobials[selection3].pasteurellaMultocida, ModelData().antimicrobials[selection4].pasteurellaMultocida].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].campylobacterJejuni, ModelData().antimicrobials[selection2].campylobacterJejuni, ModelData().antimicrobials[selection3].campylobacterJejuni, ModelData().antimicrobials[selection4].campylobacterJejuni].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].campylobacterColi, ModelData().antimicrobials[selection2].campylobacterColi, ModelData().antimicrobials[selection3].campylobacterColi, ModelData().antimicrobials[selection4].campylobacterColi].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].corynebacteriumSp, ModelData().antimicrobials[selection2].corynebacteriumSp, ModelData().antimicrobials[selection3].corynebacteriumSp, ModelData().antimicrobials[selection4].corynebacteriumSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].aerococcusUrinae, ModelData().antimicrobials[selection2].aerococcusUrinae, ModelData().antimicrobials[selection3].aerococcusUrinae, ModelData().antimicrobials[selection4].aerococcusUrinae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].aerococcusSanguinicola, ModelData().antimicrobials[selection2].aerococcusSanguinicola, ModelData().antimicrobials[selection3].aerococcusSanguinicola, ModelData().antimicrobials[selection4].aerococcusSanguinicola].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].kingellaKingae, ModelData().antimicrobials[selection2].kingellaKingae, ModelData().antimicrobials[selection3].kingellaKingae, ModelData().antimicrobials[selection4].kingellaKingae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].aeromonasSp, ModelData().antimicrobials[selection2].aeromonasSp, ModelData().antimicrobials[selection3].aeromonasSp, ModelData().antimicrobials[selection4].aeromonasSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].aeromonasVeronii, ModelData().antimicrobials[selection2].aeromonasVeronii, ModelData().antimicrobials[selection3].aeromonasVeronii, ModelData().antimicrobials[selection4].aeromonasVeronii].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].aeromonasJandaei, ModelData().antimicrobials[selection2].aeromonasJandaei, ModelData().antimicrobials[selection3].aeromonasJandaei, ModelData().antimicrobials[selection4].aeromonasJandaei].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].aeromonasDhakensis, ModelData().antimicrobials[selection2].aeromonasDhakensis, ModelData().antimicrobials[selection3].aeromonasDhakensis, ModelData().antimicrobials[selection4].aeromonasDhakensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].achromobacterXylosoxidans, ModelData().antimicrobials[selection2].achromobacterXylosoxidans, ModelData().antimicrobials[selection3].achromobacterXylosoxidans, ModelData().antimicrobials[selection4].achromobacterXylosoxidans].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].vibrioSp, ModelData().antimicrobials[selection2].vibrioSp, ModelData().antimicrobials[selection3].vibrioSp, ModelData().antimicrobials[selection4].vibrioSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].bacillusSp, ModelData().antimicrobials[selection2].bacillusSp, ModelData().antimicrobials[selection3].bacillusSp, ModelData().antimicrobials[selection4].bacillusSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].burkholderiaPseudomallei, ModelData().antimicrobials[selection2].burkholderiaPseudomallei, ModelData().antimicrobials[selection3].burkholderiaPseudomallei, ModelData().antimicrobials[selection4].burkholderiaPseudomallei].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].burkholderiaCepacia, ModelData().antimicrobials[selection2].burkholderiaCepacia, ModelData().antimicrobials[selection3].burkholderiaCepacia, ModelData().antimicrobials[selection4].burkholderiaCepacia].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].bacteroidesSp, ModelData().antimicrobials[selection2].bacteroidesSp, ModelData().antimicrobials[selection3].bacteroidesSp, ModelData().antimicrobials[selection4].bacteroidesSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].prevotellaSp, ModelData().antimicrobials[selection2].prevotellaSp, ModelData().antimicrobials[selection3].prevotellaSp, ModelData().antimicrobials[selection4].prevotellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].fusobacteriumNecrophorum, ModelData().antimicrobials[selection2].fusobacteriumNecrophorum, ModelData().antimicrobials[selection3].fusobacteriumNecrophorum, ModelData().antimicrobials[selection4].fusobacteriumNecrophorum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].clostridiumPerfringens, ModelData().antimicrobials[selection2].clostridiumPerfringens, ModelData().antimicrobials[selection3].clostridiumPerfringens, ModelData().antimicrobials[selection4].clostridiumPerfringens].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].cutibacteriumAcnes, ModelData().antimicrobials[selection2].cutibacteriumAcnes, ModelData().antimicrobials[selection3].cutibacteriumAcnes, ModelData().antimicrobials[selection4].cutibacteriumAcnes].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].clostridioidesDifficile, ModelData().antimicrobials[selection2].clostridioidesDifficile, ModelData().antimicrobials[selection3].clostridioidesDifficile, ModelData().antimicrobials[selection4].clostridioidesDifficile].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].treponemaPallidum, ModelData().antimicrobials[selection2].treponemaPallidum, ModelData().antimicrobials[selection3].treponemaPallidum, ModelData().antimicrobials[selection4].treponemaPallidum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].borreliaBurgorferi, ModelData().antimicrobials[selection2].borreliaBurgorferi, ModelData().antimicrobials[selection3].borreliaBurgorferi, ModelData().antimicrobials[selection4].borreliaBurgorferi].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].leptospiraInterrogans, ModelData().antimicrobials[selection2].leptospiraInterrogans, ModelData().antimicrobials[selection3].leptospiraInterrogans, ModelData().antimicrobials[selection4].leptospiraInterrogans].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mycoplasmaHominis, ModelData().antimicrobials[selection2].mycoplasmaHominis, ModelData().antimicrobials[selection3].mycoplasmaHominis, ModelData().antimicrobials[selection4].mycoplasmaHominis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mycoplasmaGenitalium, ModelData().antimicrobials[selection2].mycoplasmaGenitalium, ModelData().antimicrobials[selection3].mycoplasmaGenitalium, ModelData().antimicrobials[selection4].mycoplasmaGenitalium].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].ureaplasmaUrealyticum, ModelData().antimicrobials[selection2].ureaplasmaUrealyticum, ModelData().antimicrobials[selection3].ureaplasmaUrealyticum, ModelData().antimicrobials[selection4].ureaplasmaUrealyticum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].ureaplasmaParvum, ModelData().antimicrobials[selection2].ureaplasmaParvum, ModelData().antimicrobials[selection3].ureaplasmaParvum, ModelData().antimicrobials[selection4].ureaplasmaParvum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mycoplasmaPneumoniae, ModelData().antimicrobials[selection2].mycoplasmaPneumoniae, ModelData().antimicrobials[selection3].mycoplasmaPneumoniae, ModelData().antimicrobials[selection4].mycoplasmaPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].legionellaPneumophila, ModelData().antimicrobials[selection2].legionellaPneumophila, ModelData().antimicrobials[selection3].legionellaPneumophila, ModelData().antimicrobials[selection4].legionellaPneumophila].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].francisellaTularensis, ModelData().antimicrobials[selection2].francisellaTularensis, ModelData().antimicrobials[selection3].francisellaTularensis, ModelData().antimicrobials[selection4].francisellaTularensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].brucellaSp, ModelData().antimicrobials[selection2].brucellaSp, ModelData().antimicrobials[selection3].brucellaSp, ModelData().antimicrobials[selection4].brucellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaAbscessus, ModelData().antimicrobials[selection2].nocardiaAbscessus, ModelData().antimicrobials[selection3].nocardiaAbscessus, ModelData().antimicrobials[selection4].nocardiaAbscessus].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaAsteroides, ModelData().antimicrobials[selection2].nocardiaAsteroides, ModelData().antimicrobials[selection3].nocardiaAsteroides, ModelData().antimicrobials[selection4].nocardiaAsteroides].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaBrevicatena, ModelData().antimicrobials[selection2].nocardiaBrevicatena, ModelData().antimicrobials[selection3].nocardiaBrevicatena, ModelData().antimicrobials[selection4].nocardiaBrevicatena].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaPaucivorans, ModelData().antimicrobials[selection2].nocardiaPaucivorans, ModelData().antimicrobials[selection3].nocardiaPaucivorans, ModelData().antimicrobials[selection4].nocardiaPaucivorans].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection2].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection3].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection4].nocardiaCyriacigeorgica].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaFarcinica, ModelData().antimicrobials[selection2].nocardiaFarcinica, ModelData().antimicrobials[selection3].nocardiaFarcinica, ModelData().antimicrobials[selection4].nocardiaFarcinica].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaNova, ModelData().antimicrobials[selection2].nocardiaNova, ModelData().antimicrobials[selection3].nocardiaNova, ModelData().antimicrobials[selection4].nocardiaNova].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaTransvalensis, ModelData().antimicrobials[selection2].nocardiaTransvalensis, ModelData().antimicrobials[selection3].nocardiaTransvalensis, ModelData().antimicrobials[selection4].nocardiaTransvalensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaBrasiliensis, ModelData().antimicrobials[selection2].nocardiaBrasiliensis, ModelData().antimicrobials[selection3].nocardiaBrasiliensis, ModelData().antimicrobials[selection4].nocardiaBrasiliensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaOtitidiscaviarum, ModelData().antimicrobials[selection2].nocardiaOtitidiscaviarum, ModelData().antimicrobials[selection3].nocardiaOtitidiscaviarum, ModelData().antimicrobials[selection4].nocardiaOtitidiscaviarum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaPseudobrasiliensis, ModelData().antimicrobials[selection2].nocardiaPseudobrasiliensis, ModelData().antimicrobials[selection3].nocardiaPseudobrasiliensis, ModelData().antimicrobials[selection4].nocardiaPseudobrasiliensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].chlamydiaPsittaci, ModelData().antimicrobials[selection2].chlamydiaPsittaci, ModelData().antimicrobials[selection3].chlamydiaPsittaci, ModelData().antimicrobials[selection4].chlamydiaPsittaci].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].chlamydiaPneumoniae, ModelData().antimicrobials[selection2].chlamydiaPneumoniae, ModelData().antimicrobials[selection3].chlamydiaPneumoniae, ModelData().antimicrobials[selection4].chlamydiaPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].chlamydiaTrachomatis, ModelData().antimicrobials[selection2].chlamydiaTrachomatis, ModelData().antimicrobials[selection3].chlamydiaTrachomatis, ModelData().antimicrobials[selection4].chlamydiaTrachomatis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].bartonellaSp, ModelData().antimicrobials[selection2].bartonellaSp, ModelData().antimicrobials[selection3].bartonellaSp, ModelData().antimicrobials[selection4].bartonellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].bordetellaPertussis, ModelData().antimicrobials[selection2].bordetellaPertussis, ModelData().antimicrobials[selection3].bordetellaPertussis, ModelData().antimicrobials[selection4].bordetellaPertussis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].coxiellaBurnetii, ModelData().antimicrobials[selection2].coxiellaBurnetii, ModelData().antimicrobials[selection3].coxiellaBurnetii, ModelData().antimicrobials[selection4].coxiellaBurnetii].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].capnocytophagaSp, ModelData().antimicrobials[selection2].capnocytophagaSp, ModelData().antimicrobials[selection3].capnocytophagaSp, ModelData().antimicrobials[selection4].capnocytophagaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].eikenellaSp, ModelData().antimicrobials[selection2].eikenellaSp, ModelData().antimicrobials[selection3].eikenellaSp, ModelData().antimicrobials[selection4].eikenellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].haemophilusDucreyi, ModelData().antimicrobials[selection2].haemophilusDucreyi, ModelData().antimicrobials[selection3].haemophilusDucreyi, ModelData().antimicrobials[selection4].haemophilusDucreyi].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].ehrlichiaChaffeensis, ModelData().antimicrobials[selection2].ehrlichiaChaffeensis, ModelData().antimicrobials[selection3].ehrlichiaChaffeensis, ModelData().antimicrobials[selection4].ehrlichiaChaffeensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection2].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection3].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection4].anaplasmaPhagocytophilum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].rickettsiaRickettsi, ModelData().antimicrobials[selection2].rickettsiaRickettsi, ModelData().antimicrobials[selection3].rickettsiaRickettsi, ModelData().antimicrobials[selection4].rickettsiaRickettsi].max() ?? 0.0
            ]
            
        } else {
            initialArrayScores = [
                ModelData().antimicrobials[selection1].escherichiaColi,
                ModelData().antimicrobials[selection1].escherichiaColiESBL,
                ModelData().antimicrobials[selection1].escherichiaColiOXA,
                ModelData().antimicrobials[selection1].escherichiaColiMBL,
                ModelData().antimicrobials[selection1].escherichiaColiKPC,
                ModelData().antimicrobials[selection1].klebsiellaSp,
                ModelData().antimicrobials[selection1].klebsiellaSpESBL,
                ModelData().antimicrobials[selection1].klebsiellaSpOXA,
                ModelData().antimicrobials[selection1].klebsiellaSpMBL,
                ModelData().antimicrobials[selection1].klebsiellaSpKPC,
                ModelData().antimicrobials[selection1].klebsiellaOxytoca,
                ModelData().antimicrobials[selection1].klebsiellaOxytocaESBL,
                ModelData().antimicrobials[selection1].klebsiellaPneumoniae,
                ModelData().antimicrobials[selection1].raoultellaSp,
                ModelData().antimicrobials[selection1].serratiaMarcescens,
                ModelData().antimicrobials[selection1].yersiniaPseudotuberculosis,
                ModelData().antimicrobials[selection1].yersiniaEnterocolitica,
                ModelData().antimicrobials[selection1].salmonellaSp,
                ModelData().antimicrobials[selection1].escherichiaHermanii,
                ModelData().antimicrobials[selection1].hafniaAlvei,
                ModelData().antimicrobials[selection1].shigellaSp,
                ModelData().antimicrobials[selection1].citrobacterSp,
                ModelData().antimicrobials[selection1].citrobacterFreundii,
                ModelData().antimicrobials[selection1].citrobacterBraakii,
                ModelData().antimicrobials[selection1].enterobacterSp,
                ModelData().antimicrobials[selection1].enterobacterSpOXA,
                ModelData().antimicrobials[selection1].enterobacterSpMBL,
                ModelData().antimicrobials[selection1].enterobacterSpKPC,
                ModelData().antimicrobials[selection1].klebsiellaAerogenes,
                ModelData().antimicrobials[selection1].providenciaSp,
                ModelData().antimicrobials[selection1].morganellaSp,
                ModelData().antimicrobials[selection1].proteusMirabilis,
                ModelData().antimicrobials[selection1].proteusMirabilisESBL,
                ModelData().antimicrobials[selection1].proteusPenneri,
                ModelData().antimicrobials[selection1].proteusVulgaris,
                ModelData().antimicrobials[selection1].pseudomonasAeruginosa,
                ModelData().antimicrobials[selection1].stenotrophomonasMaltophilia,
                ModelData().antimicrobials[selection1].acinetobacterSp,
                ModelData().antimicrobials[selection1].msConStaphylococci,
                ModelData().antimicrobials[selection1].mrConStaphylococci,
                ModelData().antimicrobials[selection1].staphylococcusLugdunensis,
                ModelData().antimicrobials[selection1].staphylococcusSaprophyticus,
                ModelData().antimicrobials[selection1].mssa,
                ModelData().antimicrobials[selection1].mrsa,
                ModelData().antimicrobials[selection1].enterococcusSp,
                ModelData().antimicrobials[selection1].enterococcusFaecalis,
                ModelData().antimicrobials[selection1].enterococcusFaecium,
                ModelData().antimicrobials[selection1].enterococcusGallinarum,
                ModelData().antimicrobials[selection1].enterococcusCasseliflavus,
                ModelData().antimicrobials[selection1].streptococciABCG,
                ModelData().antimicrobials[selection1].streptococcusPneumoniae,
                ModelData().antimicrobials[selection1].streptococcusViridans,
                ModelData().antimicrobials[selection1].streptococcusAnginosus,
                ModelData().antimicrobials[selection1].haemophilusInfluenzae,
                ModelData().antimicrobials[selection1].moraxellaCatarrhalis,
                ModelData().antimicrobials[selection1].neisseriaGonorrhoeae,
                ModelData().antimicrobials[selection1].neisseriaMeningitidis,
                ModelData().antimicrobials[selection1].helicobacterPylori,
                ModelData().antimicrobials[selection1].listeriaMonocytogenes,
                ModelData().antimicrobials[selection1].pasteurellaMultocida,
                ModelData().antimicrobials[selection1].campylobacterJejuni,
                ModelData().antimicrobials[selection1].campylobacterColi,
                ModelData().antimicrobials[selection1].corynebacteriumSp,
                ModelData().antimicrobials[selection1].aerococcusUrinae,
                ModelData().antimicrobials[selection1].aerococcusSanguinicola,
                ModelData().antimicrobials[selection1].kingellaKingae,
                ModelData().antimicrobials[selection1].aeromonasSp,
                ModelData().antimicrobials[selection1].aeromonasVeronii,
                ModelData().antimicrobials[selection1].aeromonasJandaei,
                ModelData().antimicrobials[selection1].aeromonasDhakensis,
                ModelData().antimicrobials[selection1].achromobacterXylosoxidans,
                ModelData().antimicrobials[selection1].vibrioSp,
                ModelData().antimicrobials[selection1].bacillusSp,
                ModelData().antimicrobials[selection1].burkholderiaPseudomallei,
                ModelData().antimicrobials[selection1].burkholderiaCepacia,
                ModelData().antimicrobials[selection1].bacteroidesSp,
                ModelData().antimicrobials[selection1].prevotellaSp,
                ModelData().antimicrobials[selection1].fusobacteriumNecrophorum,
                ModelData().antimicrobials[selection1].clostridiumPerfringens,
                ModelData().antimicrobials[selection1].cutibacteriumAcnes,
                ModelData().antimicrobials[selection1].clostridioidesDifficile,
                ModelData().antimicrobials[selection1].treponemaPallidum,
                ModelData().antimicrobials[selection1].borreliaBurgorferi,
                ModelData().antimicrobials[selection1].leptospiraInterrogans,
                ModelData().antimicrobials[selection1].mycoplasmaHominis,
                ModelData().antimicrobials[selection1].mycoplasmaGenitalium,
                ModelData().antimicrobials[selection1].ureaplasmaUrealyticum,
                ModelData().antimicrobials[selection1].ureaplasmaParvum,
                ModelData().antimicrobials[selection1].mycoplasmaPneumoniae,
                ModelData().antimicrobials[selection1].legionellaPneumophila,
                ModelData().antimicrobials[selection1].francisellaTularensis,
                ModelData().antimicrobials[selection1].brucellaSp,
                ModelData().antimicrobials[selection1].nocardiaAbscessus,
                ModelData().antimicrobials[selection1].nocardiaAsteroides,
                ModelData().antimicrobials[selection1].nocardiaBrevicatena,
                ModelData().antimicrobials[selection1].nocardiaPaucivorans,
                ModelData().antimicrobials[selection1].nocardiaCyriacigeorgica,
                ModelData().antimicrobials[selection1].nocardiaFarcinica,
                ModelData().antimicrobials[selection1].nocardiaNova,
                ModelData().antimicrobials[selection1].nocardiaTransvalensis,
                ModelData().antimicrobials[selection1].nocardiaBrasiliensis,
                ModelData().antimicrobials[selection1].nocardiaOtitidiscaviarum,
                ModelData().antimicrobials[selection1].nocardiaPseudobrasiliensis,
                ModelData().antimicrobials[selection1].chlamydiaPsittaci,
                ModelData().antimicrobials[selection1].chlamydiaPneumoniae,
                ModelData().antimicrobials[selection1].chlamydiaTrachomatis,
                ModelData().antimicrobials[selection1].bartonellaSp,
                ModelData().antimicrobials[selection1].bordetellaPertussis,
                ModelData().antimicrobials[selection1].coxiellaBurnetii,
                ModelData().antimicrobials[selection1].capnocytophagaSp,
                ModelData().antimicrobials[selection1].eikenellaSp,
                ModelData().antimicrobials[selection1].haemophilusDucreyi,
                ModelData().antimicrobials[selection1].ehrlichiaChaffeensis,
                ModelData().antimicrobials[selection1].anaplasmaPhagocytophilum,
                ModelData().antimicrobials[selection1].rickettsiaRickettsi
            ]
        }
        
        
        if(selection6 != 0){
            
            finalArrayScores = [
                [ModelData().antimicrobials[selection5].klebsiellaSpMBL, ModelData().antimicrobials[selection6].klebsiellaSpMBL, ModelData().antimicrobials[selection7].klebsiellaSpMBL, ModelData().antimicrobials[selection8].klebsiellaSpMBL].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].klebsiellaSpKPC, ModelData().antimicrobials[selection6].klebsiellaSpKPC, ModelData().antimicrobials[selection7].klebsiellaSpKPC, ModelData().antimicrobials[selection8].klebsiellaSpKPC].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].klebsiellaOxytoca, ModelData().antimicrobials[selection6].klebsiellaOxytoca, ModelData().antimicrobials[selection7].klebsiellaOxytoca, ModelData().antimicrobials[selection8].klebsiellaOxytoca].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].klebsiellaOxytocaESBL, ModelData().antimicrobials[selection6].klebsiellaOxytocaESBL, ModelData().antimicrobials[selection7].klebsiellaOxytocaESBL, ModelData().antimicrobials[selection8].klebsiellaOxytocaESBL].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].klebsiellaPneumoniae, ModelData().antimicrobials[selection6].klebsiellaPneumoniae, ModelData().antimicrobials[selection7].klebsiellaPneumoniae, ModelData().antimicrobials[selection8].klebsiellaPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].raoultellaSp, ModelData().antimicrobials[selection6].raoultellaSp, ModelData().antimicrobials[selection7].raoultellaSp, ModelData().antimicrobials[selection8].raoultellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].serratiaMarcescens, ModelData().antimicrobials[selection6].serratiaMarcescens, ModelData().antimicrobials[selection7].serratiaMarcescens, ModelData().antimicrobials[selection8].serratiaMarcescens].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection6].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection7].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection8].yersiniaPseudotuberculosis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].yersiniaEnterocolitica, ModelData().antimicrobials[selection6].yersiniaEnterocolitica, ModelData().antimicrobials[selection7].yersiniaEnterocolitica, ModelData().antimicrobials[selection8].yersiniaEnterocolitica].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].salmonellaSp, ModelData().antimicrobials[selection6].salmonellaSp, ModelData().antimicrobials[selection7].salmonellaSp, ModelData().antimicrobials[selection8].salmonellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].escherichiaHermanii, ModelData().antimicrobials[selection6].escherichiaHermanii, ModelData().antimicrobials[selection7].escherichiaHermanii, ModelData().antimicrobials[selection8].escherichiaHermanii].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].hafniaAlvei, ModelData().antimicrobials[selection6].hafniaAlvei, ModelData().antimicrobials[selection7].hafniaAlvei, ModelData().antimicrobials[selection8].hafniaAlvei].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].shigellaSp, ModelData().antimicrobials[selection6].shigellaSp, ModelData().antimicrobials[selection7].shigellaSp, ModelData().antimicrobials[selection8].shigellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].citrobacterSp, ModelData().antimicrobials[selection6].citrobacterSp, ModelData().antimicrobials[selection7].citrobacterSp, ModelData().antimicrobials[selection8].citrobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].citrobacterFreundii, ModelData().antimicrobials[selection6].citrobacterFreundii, ModelData().antimicrobials[selection7].citrobacterFreundii, ModelData().antimicrobials[selection8].citrobacterFreundii].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].citrobacterBraakii, ModelData().antimicrobials[selection6].citrobacterBraakii, ModelData().antimicrobials[selection7].citrobacterBraakii, ModelData().antimicrobials[selection8].citrobacterBraakii].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].enterobacterSp, ModelData().antimicrobials[selection6].enterobacterSp, ModelData().antimicrobials[selection7].enterobacterSp, ModelData().antimicrobials[selection8].enterobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].enterobacterSpOXA, ModelData().antimicrobials[selection6].enterobacterSpOXA, ModelData().antimicrobials[selection7].enterobacterSpOXA, ModelData().antimicrobials[selection8].enterobacterSpOXA].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].enterobacterSpMBL, ModelData().antimicrobials[selection6].enterobacterSpMBL, ModelData().antimicrobials[selection7].enterobacterSpMBL, ModelData().antimicrobials[selection8].enterobacterSpMBL].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].enterobacterSpKPC, ModelData().antimicrobials[selection6].enterobacterSpKPC, ModelData().antimicrobials[selection7].enterobacterSpKPC, ModelData().antimicrobials[selection8].enterobacterSpKPC].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].klebsiellaAerogenes, ModelData().antimicrobials[selection6].klebsiellaAerogenes, ModelData().antimicrobials[selection7].klebsiellaAerogenes, ModelData().antimicrobials[selection8].klebsiellaAerogenes].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].providenciaSp, ModelData().antimicrobials[selection6].providenciaSp, ModelData().antimicrobials[selection7].providenciaSp, ModelData().antimicrobials[selection8].providenciaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].morganellaSp, ModelData().antimicrobials[selection6].morganellaSp, ModelData().antimicrobials[selection7].morganellaSp, ModelData().antimicrobials[selection8].morganellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].proteusMirabilis, ModelData().antimicrobials[selection6].proteusMirabilis, ModelData().antimicrobials[selection7].proteusMirabilis, ModelData().antimicrobials[selection8].proteusMirabilis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].proteusMirabilisESBL, ModelData().antimicrobials[selection6].proteusMirabilisESBL, ModelData().antimicrobials[selection7].proteusMirabilisESBL, ModelData().antimicrobials[selection8].proteusMirabilisESBL].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].proteusPenneri, ModelData().antimicrobials[selection6].proteusPenneri, ModelData().antimicrobials[selection7].proteusPenneri, ModelData().antimicrobials[selection8].proteusPenneri].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].proteusVulgaris, ModelData().antimicrobials[selection6].proteusVulgaris, ModelData().antimicrobials[selection7].proteusVulgaris, ModelData().antimicrobials[selection8].proteusVulgaris].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].pseudomonasAeruginosa, ModelData().antimicrobials[selection6].pseudomonasAeruginosa, ModelData().antimicrobials[selection7].pseudomonasAeruginosa, ModelData().antimicrobials[selection8].pseudomonasAeruginosa].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection6].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection7].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection8].stenotrophomonasMaltophilia].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].acinetobacterSp, ModelData().antimicrobials[selection6].acinetobacterSp, ModelData().antimicrobials[selection7].acinetobacterSp, ModelData().antimicrobials[selection8].acinetobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].msConStaphylococci, ModelData().antimicrobials[selection6].msConStaphylococci, ModelData().antimicrobials[selection7].msConStaphylococci, ModelData().antimicrobials[selection8].msConStaphylococci].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].mrConStaphylococci, ModelData().antimicrobials[selection6].mrConStaphylococci, ModelData().antimicrobials[selection7].mrConStaphylococci, ModelData().antimicrobials[selection8].mrConStaphylococci].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].staphylococcusLugdunensis, ModelData().antimicrobials[selection6].staphylococcusLugdunensis, ModelData().antimicrobials[selection7].staphylococcusLugdunensis, ModelData().antimicrobials[selection8].staphylococcusLugdunensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].staphylococcusSaprophyticus, ModelData().antimicrobials[selection6].staphylococcusSaprophyticus, ModelData().antimicrobials[selection7].staphylococcusSaprophyticus, ModelData().antimicrobials[selection8].staphylococcusSaprophyticus].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].mssa, ModelData().antimicrobials[selection6].mssa, ModelData().antimicrobials[selection7].mssa, ModelData().antimicrobials[selection8].mssa].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].mrsa, ModelData().antimicrobials[selection6].mrsa, ModelData().antimicrobials[selection7].mrsa, ModelData().antimicrobials[selection8].mrsa].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].enterococcusSp, ModelData().antimicrobials[selection6].enterococcusSp, ModelData().antimicrobials[selection7].enterococcusSp, ModelData().antimicrobials[selection8].enterococcusSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].enterococcusFaecalis, ModelData().antimicrobials[selection6].enterococcusFaecalis, ModelData().antimicrobials[selection7].enterococcusFaecalis, ModelData().antimicrobials[selection8].enterococcusFaecalis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].enterococcusFaecium, ModelData().antimicrobials[selection6].enterococcusFaecium, ModelData().antimicrobials[selection7].enterococcusFaecium, ModelData().antimicrobials[selection8].enterococcusFaecium].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].enterococcusGallinarum, ModelData().antimicrobials[selection6].enterococcusGallinarum, ModelData().antimicrobials[selection7].enterococcusGallinarum, ModelData().antimicrobials[selection8].enterococcusGallinarum].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].enterococcusCasseliflavus, ModelData().antimicrobials[selection6].enterococcusCasseliflavus, ModelData().antimicrobials[selection7].enterococcusCasseliflavus, ModelData().antimicrobials[selection8].enterococcusCasseliflavus].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].streptococciABCG, ModelData().antimicrobials[selection6].streptococciABCG, ModelData().antimicrobials[selection7].streptococciABCG, ModelData().antimicrobials[selection8].streptococciABCG].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].streptococcusPneumoniae, ModelData().antimicrobials[selection6].streptococcusPneumoniae, ModelData().antimicrobials[selection7].streptococcusPneumoniae, ModelData().antimicrobials[selection8].streptococcusPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].streptococcusViridans, ModelData().antimicrobials[selection6].streptococcusViridans, ModelData().antimicrobials[selection7].streptococcusViridans, ModelData().antimicrobials[selection8].streptococcusViridans].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].streptococcusAnginosus, ModelData().antimicrobials[selection6].streptococcusAnginosus, ModelData().antimicrobials[selection7].streptococcusAnginosus, ModelData().antimicrobials[selection8].streptococcusAnginosus].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].haemophilusInfluenzae, ModelData().antimicrobials[selection6].haemophilusInfluenzae, ModelData().antimicrobials[selection7].haemophilusInfluenzae, ModelData().antimicrobials[selection8].haemophilusInfluenzae].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].moraxellaCatarrhalis, ModelData().antimicrobials[selection6].moraxellaCatarrhalis, ModelData().antimicrobials[selection7].moraxellaCatarrhalis, ModelData().antimicrobials[selection8].moraxellaCatarrhalis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].neisseriaGonorrhoeae, ModelData().antimicrobials[selection6].neisseriaGonorrhoeae, ModelData().antimicrobials[selection7].neisseriaGonorrhoeae, ModelData().antimicrobials[selection8].neisseriaGonorrhoeae].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].neisseriaMeningitidis, ModelData().antimicrobials[selection6].neisseriaMeningitidis, ModelData().antimicrobials[selection7].neisseriaMeningitidis, ModelData().antimicrobials[selection8].neisseriaMeningitidis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].helicobacterPylori, ModelData().antimicrobials[selection6].helicobacterPylori, ModelData().antimicrobials[selection7].helicobacterPylori, ModelData().antimicrobials[selection8].helicobacterPylori].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].listeriaMonocytogenes, ModelData().antimicrobials[selection6].listeriaMonocytogenes, ModelData().antimicrobials[selection7].listeriaMonocytogenes, ModelData().antimicrobials[selection8].listeriaMonocytogenes].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].pasteurellaMultocida, ModelData().antimicrobials[selection6].pasteurellaMultocida, ModelData().antimicrobials[selection7].pasteurellaMultocida, ModelData().antimicrobials[selection8].pasteurellaMultocida].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].campylobacterJejuni, ModelData().antimicrobials[selection6].campylobacterJejuni, ModelData().antimicrobials[selection7].campylobacterJejuni, ModelData().antimicrobials[selection8].campylobacterJejuni].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].campylobacterColi, ModelData().antimicrobials[selection6].campylobacterColi, ModelData().antimicrobials[selection7].campylobacterColi, ModelData().antimicrobials[selection8].campylobacterColi].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].corynebacteriumSp, ModelData().antimicrobials[selection6].corynebacteriumSp, ModelData().antimicrobials[selection7].corynebacteriumSp, ModelData().antimicrobials[selection8].corynebacteriumSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].aerococcusUrinae, ModelData().antimicrobials[selection6].aerococcusUrinae, ModelData().antimicrobials[selection7].aerococcusUrinae, ModelData().antimicrobials[selection8].aerococcusUrinae].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].aerococcusSanguinicola, ModelData().antimicrobials[selection6].aerococcusSanguinicola, ModelData().antimicrobials[selection7].aerococcusSanguinicola, ModelData().antimicrobials[selection8].aerococcusSanguinicola].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].kingellaKingae, ModelData().antimicrobials[selection6].kingellaKingae, ModelData().antimicrobials[selection7].kingellaKingae, ModelData().antimicrobials[selection8].kingellaKingae].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].aeromonasSp, ModelData().antimicrobials[selection6].aeromonasSp, ModelData().antimicrobials[selection7].aeromonasSp, ModelData().antimicrobials[selection8].aeromonasSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].aeromonasVeronii, ModelData().antimicrobials[selection6].aeromonasVeronii, ModelData().antimicrobials[selection7].aeromonasVeronii, ModelData().antimicrobials[selection8].aeromonasVeronii].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].aeromonasJandaei, ModelData().antimicrobials[selection6].aeromonasJandaei, ModelData().antimicrobials[selection7].aeromonasJandaei, ModelData().antimicrobials[selection8].aeromonasJandaei].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].aeromonasDhakensis, ModelData().antimicrobials[selection6].aeromonasDhakensis, ModelData().antimicrobials[selection7].aeromonasDhakensis, ModelData().antimicrobials[selection8].aeromonasDhakensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].achromobacterXylosoxidans, ModelData().antimicrobials[selection6].achromobacterXylosoxidans, ModelData().antimicrobials[selection7].achromobacterXylosoxidans, ModelData().antimicrobials[selection8].achromobacterXylosoxidans].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].vibrioSp, ModelData().antimicrobials[selection6].vibrioSp, ModelData().antimicrobials[selection7].vibrioSp, ModelData().antimicrobials[selection8].vibrioSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].bacillusSp, ModelData().antimicrobials[selection6].bacillusSp, ModelData().antimicrobials[selection7].bacillusSp, ModelData().antimicrobials[selection8].bacillusSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].burkholderiaPseudomallei, ModelData().antimicrobials[selection6].burkholderiaPseudomallei, ModelData().antimicrobials[selection7].burkholderiaPseudomallei, ModelData().antimicrobials[selection8].burkholderiaPseudomallei].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].burkholderiaCepacia, ModelData().antimicrobials[selection6].burkholderiaCepacia, ModelData().antimicrobials[selection7].burkholderiaCepacia, ModelData().antimicrobials[selection8].burkholderiaCepacia].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].bacteroidesSp, ModelData().antimicrobials[selection6].bacteroidesSp, ModelData().antimicrobials[selection7].bacteroidesSp, ModelData().antimicrobials[selection8].bacteroidesSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].prevotellaSp, ModelData().antimicrobials[selection6].prevotellaSp, ModelData().antimicrobials[selection7].prevotellaSp, ModelData().antimicrobials[selection8].prevotellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].fusobacteriumNecrophorum, ModelData().antimicrobials[selection6].fusobacteriumNecrophorum, ModelData().antimicrobials[selection7].fusobacteriumNecrophorum, ModelData().antimicrobials[selection8].fusobacteriumNecrophorum].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].clostridiumPerfringens, ModelData().antimicrobials[selection6].clostridiumPerfringens, ModelData().antimicrobials[selection7].clostridiumPerfringens, ModelData().antimicrobials[selection8].clostridiumPerfringens].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].cutibacteriumAcnes, ModelData().antimicrobials[selection6].cutibacteriumAcnes, ModelData().antimicrobials[selection7].cutibacteriumAcnes, ModelData().antimicrobials[selection8].cutibacteriumAcnes].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].clostridioidesDifficile, ModelData().antimicrobials[selection6].clostridioidesDifficile, ModelData().antimicrobials[selection7].clostridioidesDifficile, ModelData().antimicrobials[selection8].clostridioidesDifficile].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].treponemaPallidum, ModelData().antimicrobials[selection6].treponemaPallidum, ModelData().antimicrobials[selection7].treponemaPallidum, ModelData().antimicrobials[selection8].treponemaPallidum].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].borreliaBurgorferi, ModelData().antimicrobials[selection6].borreliaBurgorferi, ModelData().antimicrobials[selection7].borreliaBurgorferi, ModelData().antimicrobials[selection8].borreliaBurgorferi].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].leptospiraInterrogans, ModelData().antimicrobials[selection6].leptospiraInterrogans, ModelData().antimicrobials[selection7].leptospiraInterrogans, ModelData().antimicrobials[selection8].leptospiraInterrogans].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].mycoplasmaHominis, ModelData().antimicrobials[selection6].mycoplasmaHominis, ModelData().antimicrobials[selection7].mycoplasmaHominis, ModelData().antimicrobials[selection8].mycoplasmaHominis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].mycoplasmaGenitalium, ModelData().antimicrobials[selection6].mycoplasmaGenitalium, ModelData().antimicrobials[selection7].mycoplasmaGenitalium, ModelData().antimicrobials[selection8].mycoplasmaGenitalium].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].ureaplasmaUrealyticum, ModelData().antimicrobials[selection6].ureaplasmaUrealyticum, ModelData().antimicrobials[selection7].ureaplasmaUrealyticum, ModelData().antimicrobials[selection8].ureaplasmaUrealyticum].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].ureaplasmaParvum, ModelData().antimicrobials[selection6].ureaplasmaParvum, ModelData().antimicrobials[selection7].ureaplasmaParvum, ModelData().antimicrobials[selection8].ureaplasmaParvum].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].mycoplasmaPneumoniae, ModelData().antimicrobials[selection6].mycoplasmaPneumoniae, ModelData().antimicrobials[selection7].mycoplasmaPneumoniae, ModelData().antimicrobials[selection8].mycoplasmaPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].legionellaPneumophila, ModelData().antimicrobials[selection6].legionellaPneumophila, ModelData().antimicrobials[selection7].legionellaPneumophila, ModelData().antimicrobials[selection8].legionellaPneumophila].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].francisellaTularensis, ModelData().antimicrobials[selection6].francisellaTularensis, ModelData().antimicrobials[selection7].francisellaTularensis, ModelData().antimicrobials[selection8].francisellaTularensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].brucellaSp, ModelData().antimicrobials[selection6].brucellaSp, ModelData().antimicrobials[selection7].brucellaSp, ModelData().antimicrobials[selection8].brucellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaAbscessus, ModelData().antimicrobials[selection6].nocardiaAbscessus, ModelData().antimicrobials[selection7].nocardiaAbscessus, ModelData().antimicrobials[selection8].nocardiaAbscessus].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaAsteroides, ModelData().antimicrobials[selection6].nocardiaAsteroides, ModelData().antimicrobials[selection7].nocardiaAsteroides, ModelData().antimicrobials[selection8].nocardiaAsteroides].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaBrevicatena, ModelData().antimicrobials[selection6].nocardiaBrevicatena, ModelData().antimicrobials[selection7].nocardiaBrevicatena, ModelData().antimicrobials[selection8].nocardiaBrevicatena].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaPaucivorans, ModelData().antimicrobials[selection6].nocardiaPaucivorans, ModelData().antimicrobials[selection7].nocardiaPaucivorans, ModelData().antimicrobials[selection8].nocardiaPaucivorans].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection6].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection7].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection8].nocardiaCyriacigeorgica].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaFarcinica, ModelData().antimicrobials[selection6].nocardiaFarcinica, ModelData().antimicrobials[selection7].nocardiaFarcinica, ModelData().antimicrobials[selection8].nocardiaFarcinica].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaNova, ModelData().antimicrobials[selection6].nocardiaNova, ModelData().antimicrobials[selection7].nocardiaNova, ModelData().antimicrobials[selection8].nocardiaNova].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaTransvalensis, ModelData().antimicrobials[selection6].nocardiaTransvalensis, ModelData().antimicrobials[selection7].nocardiaTransvalensis, ModelData().antimicrobials[selection8].nocardiaTransvalensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaBrasiliensis, ModelData().antimicrobials[selection6].nocardiaBrasiliensis, ModelData().antimicrobials[selection7].nocardiaBrasiliensis, ModelData().antimicrobials[selection8].nocardiaBrasiliensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaOtitidiscaviarum, ModelData().antimicrobials[selection6].nocardiaOtitidiscaviarum, ModelData().antimicrobials[selection7].nocardiaOtitidiscaviarum, ModelData().antimicrobials[selection8].nocardiaOtitidiscaviarum].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].nocardiaPseudobrasiliensis, ModelData().antimicrobials[selection6].nocardiaPseudobrasiliensis, ModelData().antimicrobials[selection7].nocardiaPseudobrasiliensis, ModelData().antimicrobials[selection8].nocardiaPseudobrasiliensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].chlamydiaPsittaci, ModelData().antimicrobials[selection6].chlamydiaPsittaci, ModelData().antimicrobials[selection7].chlamydiaPsittaci, ModelData().antimicrobials[selection8].chlamydiaPsittaci].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].chlamydiaPneumoniae, ModelData().antimicrobials[selection6].chlamydiaPneumoniae, ModelData().antimicrobials[selection7].chlamydiaPneumoniae, ModelData().antimicrobials[selection8].chlamydiaPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].chlamydiaTrachomatis, ModelData().antimicrobials[selection6].chlamydiaTrachomatis, ModelData().antimicrobials[selection7].chlamydiaTrachomatis, ModelData().antimicrobials[selection8].chlamydiaTrachomatis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].bartonellaSp, ModelData().antimicrobials[selection6].bartonellaSp, ModelData().antimicrobials[selection7].bartonellaSp, ModelData().antimicrobials[selection8].bartonellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].bordetellaPertussis, ModelData().antimicrobials[selection6].bordetellaPertussis, ModelData().antimicrobials[selection7].bordetellaPertussis, ModelData().antimicrobials[selection8].bordetellaPertussis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].coxiellaBurnetii, ModelData().antimicrobials[selection6].coxiellaBurnetii, ModelData().antimicrobials[selection7].coxiellaBurnetii, ModelData().antimicrobials[selection8].coxiellaBurnetii].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].capnocytophagaSp, ModelData().antimicrobials[selection6].capnocytophagaSp, ModelData().antimicrobials[selection7].capnocytophagaSp, ModelData().antimicrobials[selection8].capnocytophagaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].eikenellaSp, ModelData().antimicrobials[selection6].eikenellaSp, ModelData().antimicrobials[selection7].eikenellaSp, ModelData().antimicrobials[selection8].eikenellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].haemophilusDucreyi, ModelData().antimicrobials[selection6].haemophilusDucreyi, ModelData().antimicrobials[selection7].haemophilusDucreyi, ModelData().antimicrobials[selection8].haemophilusDucreyi].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].ehrlichiaChaffeensis, ModelData().antimicrobials[selection6].ehrlichiaChaffeensis, ModelData().antimicrobials[selection7].ehrlichiaChaffeensis, ModelData().antimicrobials[selection8].ehrlichiaChaffeensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection6].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection7].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection8].anaplasmaPhagocytophilum].max() ?? 0.0,
                [ModelData().antimicrobials[selection5].rickettsiaRickettsi, ModelData().antimicrobials[selection6].rickettsiaRickettsi, ModelData().antimicrobials[selection7].rickettsiaRickettsi, ModelData().antimicrobials[selection8].rickettsiaRickettsi].max() ?? 0.0
            ]
            
        } else {
            finalArrayScores = [
                ModelData().antimicrobials[selection5].escherichiaColi,
                ModelData().antimicrobials[selection5].escherichiaColiESBL,
                ModelData().antimicrobials[selection5].escherichiaColiOXA,
                ModelData().antimicrobials[selection5].escherichiaColiMBL,
                ModelData().antimicrobials[selection5].escherichiaColiKPC,
                ModelData().antimicrobials[selection5].klebsiellaSp,
                ModelData().antimicrobials[selection5].klebsiellaSpESBL,
                ModelData().antimicrobials[selection5].klebsiellaSpOXA,
                ModelData().antimicrobials[selection5].klebsiellaSpMBL,
                ModelData().antimicrobials[selection5].klebsiellaSpKPC,
                ModelData().antimicrobials[selection5].klebsiellaOxytoca,
                ModelData().antimicrobials[selection5].klebsiellaOxytocaESBL,
                ModelData().antimicrobials[selection5].klebsiellaPneumoniae,
                ModelData().antimicrobials[selection5].raoultellaSp,
                ModelData().antimicrobials[selection5].serratiaMarcescens,
                ModelData().antimicrobials[selection5].yersiniaPseudotuberculosis,
                ModelData().antimicrobials[selection5].yersiniaEnterocolitica,
                ModelData().antimicrobials[selection5].salmonellaSp,
                ModelData().antimicrobials[selection5].escherichiaHermanii,
                ModelData().antimicrobials[selection5].hafniaAlvei,
                ModelData().antimicrobials[selection5].shigellaSp,
                ModelData().antimicrobials[selection5].citrobacterSp,
                ModelData().antimicrobials[selection5].citrobacterFreundii,
                ModelData().antimicrobials[selection5].citrobacterBraakii,
                ModelData().antimicrobials[selection5].enterobacterSp,
                ModelData().antimicrobials[selection5].enterobacterSpOXA,
                ModelData().antimicrobials[selection5].enterobacterSpMBL,
                ModelData().antimicrobials[selection5].enterobacterSpKPC,
                ModelData().antimicrobials[selection5].klebsiellaAerogenes,
                ModelData().antimicrobials[selection5].providenciaSp,
                ModelData().antimicrobials[selection5].morganellaSp,
                ModelData().antimicrobials[selection5].proteusMirabilis,
                ModelData().antimicrobials[selection5].proteusMirabilisESBL,
                ModelData().antimicrobials[selection5].proteusPenneri,
                ModelData().antimicrobials[selection5].proteusVulgaris,
                ModelData().antimicrobials[selection5].pseudomonasAeruginosa,
                ModelData().antimicrobials[selection5].stenotrophomonasMaltophilia,
                ModelData().antimicrobials[selection5].acinetobacterSp,
                ModelData().antimicrobials[selection5].msConStaphylococci,
                ModelData().antimicrobials[selection5].mrConStaphylococci,
                ModelData().antimicrobials[selection5].staphylococcusLugdunensis,
                ModelData().antimicrobials[selection5].staphylococcusSaprophyticus,
                ModelData().antimicrobials[selection5].mssa,
                ModelData().antimicrobials[selection5].mrsa,
                ModelData().antimicrobials[selection5].enterococcusSp,
                ModelData().antimicrobials[selection5].enterococcusFaecalis,
                ModelData().antimicrobials[selection5].enterococcusFaecium,
                ModelData().antimicrobials[selection5].enterococcusGallinarum,
                ModelData().antimicrobials[selection5].enterococcusCasseliflavus,
                ModelData().antimicrobials[selection5].streptococciABCG,
                ModelData().antimicrobials[selection5].streptococcusPneumoniae,
                ModelData().antimicrobials[selection5].streptococcusViridans,
                ModelData().antimicrobials[selection5].streptococcusAnginosus,
                ModelData().antimicrobials[selection5].haemophilusInfluenzae,
                ModelData().antimicrobials[selection5].moraxellaCatarrhalis,
                ModelData().antimicrobials[selection5].neisseriaGonorrhoeae,
                ModelData().antimicrobials[selection5].neisseriaMeningitidis,
                ModelData().antimicrobials[selection5].helicobacterPylori,
                ModelData().antimicrobials[selection5].listeriaMonocytogenes,
                ModelData().antimicrobials[selection5].pasteurellaMultocida,
                ModelData().antimicrobials[selection5].campylobacterJejuni,
                ModelData().antimicrobials[selection5].campylobacterColi,
                ModelData().antimicrobials[selection5].corynebacteriumSp,
                ModelData().antimicrobials[selection5].aerococcusUrinae,
                ModelData().antimicrobials[selection5].aerococcusSanguinicola,
                ModelData().antimicrobials[selection5].kingellaKingae,
                ModelData().antimicrobials[selection5].aeromonasSp,
                ModelData().antimicrobials[selection5].aeromonasVeronii,
                ModelData().antimicrobials[selection5].aeromonasJandaei,
                ModelData().antimicrobials[selection5].aeromonasDhakensis,
                ModelData().antimicrobials[selection5].achromobacterXylosoxidans,
                ModelData().antimicrobials[selection5].vibrioSp,
                ModelData().antimicrobials[selection5].bacillusSp,
                ModelData().antimicrobials[selection5].burkholderiaPseudomallei,
                ModelData().antimicrobials[selection5].burkholderiaCepacia,
                ModelData().antimicrobials[selection5].bacteroidesSp,
                ModelData().antimicrobials[selection5].prevotellaSp,
                ModelData().antimicrobials[selection5].fusobacteriumNecrophorum,
                ModelData().antimicrobials[selection5].clostridiumPerfringens,
                ModelData().antimicrobials[selection5].cutibacteriumAcnes,
                ModelData().antimicrobials[selection5].clostridioidesDifficile,
                ModelData().antimicrobials[selection5].treponemaPallidum,
                ModelData().antimicrobials[selection5].borreliaBurgorferi,
                ModelData().antimicrobials[selection5].leptospiraInterrogans,
                ModelData().antimicrobials[selection5].mycoplasmaHominis,
                ModelData().antimicrobials[selection5].mycoplasmaGenitalium,
                ModelData().antimicrobials[selection5].ureaplasmaUrealyticum,
                ModelData().antimicrobials[selection5].ureaplasmaParvum,
                ModelData().antimicrobials[selection5].mycoplasmaPneumoniae,
                ModelData().antimicrobials[selection5].legionellaPneumophila,
                ModelData().antimicrobials[selection5].francisellaTularensis,
                ModelData().antimicrobials[selection5].brucellaSp,
                ModelData().antimicrobials[selection5].nocardiaAbscessus,
                ModelData().antimicrobials[selection5].nocardiaAsteroides,
                ModelData().antimicrobials[selection5].nocardiaBrevicatena,
                ModelData().antimicrobials[selection5].nocardiaPaucivorans,
                ModelData().antimicrobials[selection5].nocardiaCyriacigeorgica,
                ModelData().antimicrobials[selection5].nocardiaFarcinica,
                ModelData().antimicrobials[selection5].nocardiaNova,
                ModelData().antimicrobials[selection5].nocardiaTransvalensis,
                ModelData().antimicrobials[selection5].nocardiaBrasiliensis,
                ModelData().antimicrobials[selection5].nocardiaOtitidiscaviarum,
                ModelData().antimicrobials[selection5].nocardiaPseudobrasiliensis,
                ModelData().antimicrobials[selection5].chlamydiaPsittaci,
                ModelData().antimicrobials[selection5].chlamydiaPneumoniae,
                ModelData().antimicrobials[selection5].chlamydiaTrachomatis,
                ModelData().antimicrobials[selection5].bartonellaSp,
                ModelData().antimicrobials[selection5].bordetellaPertussis,
                ModelData().antimicrobials[selection5].coxiellaBurnetii,
                ModelData().antimicrobials[selection5].capnocytophagaSp,
                ModelData().antimicrobials[selection5].eikenellaSp,
                ModelData().antimicrobials[selection5].haemophilusDucreyi,
                ModelData().antimicrobials[selection5].ehrlichiaChaffeensis,
                ModelData().antimicrobials[selection5].anaplasmaPhagocytophilum,
                ModelData().antimicrobials[selection5].rickettsiaRickettsi
            ]
        }
        
        let score1 = vDSP.sum(initialArrayScores)
        let score2 = vDSP.sum(finalArrayScores)
        
        initialSpectrumScore = (score1 / 2407)
        finalSpectrumScore = (score2 / 2407)
        
    }
    
    var body: some View {
        
        NavigationStack {
            
            List {
                Text("Choose inital antimicrobial therapy")
                    .font(.subheadline)
                HStack {
                    Text("Antimicrobial n°1")
                        .font(.subheadline)
                    Picker("", selection: $selection1){
                        ForEach(ModelData().antimicrobials, id:\.id){ item in
                            Text("\(item.drug)")
                        }
                    }.pickerStyle(.menu)
                }
                
                if(selection1 != 0) {
                    HStack{
                        Text("Antimicrobial n°2")
                            .font(.subheadline)
                        Picker("", selection: $selection2){
                            ForEach(ModelData().antimicrobials, id:\.id){ item in
                                Text("\(item.drug)")
                            }
                        }.pickerStyle(.menu)
                    }
                    
                    if(selection2 != 0){
                        HStack {
                            Text("Antimicrobial n°3")
                                .font(.subheadline)
                            Picker("", selection: $selection3){
                                ForEach(ModelData().antimicrobials, id:\.id){ item in
                                    Text("\(item.drug)")
                                }
                            }.pickerStyle(.menu)
                        }
                        
                        if(selection3 != 0){
                            HStack {
                                Text("Antimicrobial n°4")
                                    .font(.subheadline)
                                Picker("", selection: $selection4){
                                    ForEach(ModelData().antimicrobials, id:\.id){ item in
                                        Text("\(item.drug)")
                                    }
                                }.pickerStyle(.menu)
                            }
                        }
                    }
                }
            }
            
            Divider()
            
            List {
                Text("Choose final antimicrobial therapy")
                HStack {
                    Text("Antimicrobial n°5")
                        .font(.subheadline)
                    Picker("", selection: $selection5){
                        ForEach(ModelData().antimicrobials, id:\.id){ item in
                            Text("\(item.drug)")
                        }
                    }.pickerStyle(.menu)
                }
                
                if(selection5 != 0) {
                    HStack{
                        Text("Antimicrobial n°6")
                            .font(.subheadline)
                        Picker("", selection: $selection6){
                            ForEach(ModelData().antimicrobials, id:\.id){ item in
                                Text("\(item.drug)")
                            }
                        }.pickerStyle(.menu)
                    }
                    
                    if(selection6 != 0){
                        HStack {
                            Text("Antimicrobial n°7")
                                .font(.subheadline)
                            Picker("", selection: $selection7){
                                ForEach(ModelData().antimicrobials, id:\.id){ item in
                                    Text("\(item.drug)")
                                }
                            }.pickerStyle(.menu)
                        }
                        
                        if(selection7 != 0){
                            HStack {
                                Text("Antimicrobial n°8")
                                    .font(.subheadline)
                                Picker("", selection: $selection8){
                                    ForEach(ModelData().antimicrobials, id:\.id){ item in
                                        Text("\(item.drug)")
                                    }
                                }.pickerStyle(.menu)
                            }
                        }
                    }
                }
            }
            
            NavigationLink("S3score", destination: FilteredAntimicrobial(selection1: $selection1, selection2: $selection2, selection3: $selection3, selection4: $selection4, selection5: $selection5, selection6: $selection6, selection7: $selection7, selection8: $selection8, initialSpectrumScore: $initialSpectrumScore, finalSpectrumScore: $finalSpectrumScore, calc: self.calc))
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                .navigationTitle("Simplified Spectrum Score (S3score)")
                .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    
}

struct AntimicrobialList_Previews: PreviewProvider {
    static var previews: some View {
        AntimicrobialList()
            .environmentObject(ModelData())
    }
}

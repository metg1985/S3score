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
    @State var selection9 = 0
    @State var selection10 = 0
    
    @State var initialSpectrumScore: Double = 0.0
    @State var finalSpectrumScore: Double = 0.0
    @State var deltaSpectrumScore: Double = 0.0
    
    func calc() {
        
        var initialArrayScores: [Double]
        var finalArrayScores: [Double]
        
        if(selection2 != 0){
            
            initialArrayScores = [
                
                [ModelData().antimicrobials[selection1].citrobacterBraakii, ModelData().antimicrobials[selection2].citrobacterBraakii,
                 ModelData().antimicrobials[selection3].citrobacterBraakii, ModelData().antimicrobials[selection4].citrobacterBraakii, ModelData().antimicrobials[selection5].citrobacterBraakii].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].citrobacterFreundii, ModelData().antimicrobials[selection2].citrobacterFreundii,
                 ModelData().antimicrobials[selection3].citrobacterFreundii, ModelData().antimicrobials[selection4].citrobacterFreundii, ModelData().antimicrobials[selection5].citrobacterFreundii].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].achromobacterXylosoxidans, ModelData().antimicrobials[selection2].achromobacterXylosoxidans,
                 ModelData().antimicrobials[selection3].achromobacterXylosoxidans, ModelData().antimicrobials[selection4].achromobacterXylosoxidans, ModelData().antimicrobials[selection5].achromobacterXylosoxidans].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].acinetobacterSp, ModelData().antimicrobials[selection2].acinetobacterSp,
                 ModelData().antimicrobials[selection3].acinetobacterSp, ModelData().antimicrobials[selection4].acinetobacterSp, ModelData().antimicrobials[selection5].acinetobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].aeromonasDhakensis, ModelData().antimicrobials[selection2].aeromonasDhakensis,
                 ModelData().antimicrobials[selection3].aeromonasDhakensis, ModelData().antimicrobials[selection4].aeromonasDhakensis, ModelData().antimicrobials[selection5].aeromonasDhakensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].aeromonasSp, ModelData().antimicrobials[selection2].aeromonasSp,
                 ModelData().antimicrobials[selection3].aeromonasSp, ModelData().antimicrobials[selection4].aeromonasSp, ModelData().antimicrobials[selection5].aeromonasSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection2].anaplasmaPhagocytophilum,
                 ModelData().antimicrobials[selection3].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection4].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection5].anaplasmaPhagocytophilum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].bacillusSp, ModelData().antimicrobials[selection2].bacillusSp,
                 ModelData().antimicrobials[selection3].bacillusSp, ModelData().antimicrobials[selection4].bacillusSp, ModelData().antimicrobials[selection5].bacillusSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].bacteroidesSp, ModelData().antimicrobials[selection2].bacteroidesSp,
                 ModelData().antimicrobials[selection3].bacteroidesSp, ModelData().antimicrobials[selection4].bacteroidesSp, ModelData().antimicrobials[selection5].bacteroidesSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].bordetellaPertussis, ModelData().antimicrobials[selection2].bordetellaPertussis,
                 ModelData().antimicrobials[selection3].bordetellaPertussis, ModelData().antimicrobials[selection4].bordetellaPertussis, ModelData().antimicrobials[selection5].bordetellaPertussis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].borreliaBurgorferi, ModelData().antimicrobials[selection2].borreliaBurgorferi,
                 ModelData().antimicrobials[selection3].borreliaBurgorferi, ModelData().antimicrobials[selection4].borreliaBurgorferi, ModelData().antimicrobials[selection5].borreliaBurgorferi].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].burkholderiaPseudomallei, ModelData().antimicrobials[selection2].burkholderiaPseudomallei,
                 ModelData().antimicrobials[selection3].burkholderiaPseudomallei, ModelData().antimicrobials[selection4].burkholderiaPseudomallei, ModelData().antimicrobials[selection5].burkholderiaPseudomallei].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].chlamydiaPneumoniae, ModelData().antimicrobials[selection2].chlamydiaPneumoniae,
                 ModelData().antimicrobials[selection3].chlamydiaPneumoniae, ModelData().antimicrobials[selection4].chlamydiaPneumoniae, ModelData().antimicrobials[selection5].chlamydiaPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].chlamydiaPsittaci, ModelData().antimicrobials[selection2].chlamydiaPsittaci,
                 ModelData().antimicrobials[selection3].chlamydiaPsittaci, ModelData().antimicrobials[selection4].chlamydiaPsittaci, ModelData().antimicrobials[selection5].chlamydiaPsittaci].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].chlamydiaTrachomatis, ModelData().antimicrobials[selection2].chlamydiaTrachomatis,
                 ModelData().antimicrobials[selection3].chlamydiaTrachomatis, ModelData().antimicrobials[selection4].chlamydiaTrachomatis, ModelData().antimicrobials[selection5].chlamydiaTrachomatis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].citrobacterSp, ModelData().antimicrobials[selection2].citrobacterSp,
                 ModelData().antimicrobials[selection3].citrobacterSp, ModelData().antimicrobials[selection4].citrobacterSp, ModelData().antimicrobials[selection5].citrobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].clostridioidesDifficile, ModelData().antimicrobials[selection2].clostridioidesDifficile,
                 ModelData().antimicrobials[selection3].clostridioidesDifficile, ModelData().antimicrobials[selection4].clostridioidesDifficile, ModelData().antimicrobials[selection5].clostridioidesDifficile].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].clostridiumPerfringens, ModelData().antimicrobials[selection2].clostridiumPerfringens,
                 ModelData().antimicrobials[selection3].clostridiumPerfringens, ModelData().antimicrobials[selection4].clostridiumPerfringens, ModelData().antimicrobials[selection5].clostridiumPerfringens].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].corynebacteriumSp, ModelData().antimicrobials[selection2].corynebacteriumSp,
                 ModelData().antimicrobials[selection3].corynebacteriumSp, ModelData().antimicrobials[selection4].corynebacteriumSp, ModelData().antimicrobials[selection5].corynebacteriumSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].coxiellaBurnetii, ModelData().antimicrobials[selection2].coxiellaBurnetii,
                 ModelData().antimicrobials[selection3].coxiellaBurnetii, ModelData().antimicrobials[selection4].coxiellaBurnetii, ModelData().antimicrobials[selection5].coxiellaBurnetii].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].cutibacteriumAcnes, ModelData().antimicrobials[selection2].cutibacteriumAcnes,
                 ModelData().antimicrobials[selection3].cutibacteriumAcnes, ModelData().antimicrobials[selection4].cutibacteriumAcnes, ModelData().antimicrobials[selection5].cutibacteriumAcnes].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].ehrlichiaChaffeensis, ModelData().antimicrobials[selection2].ehrlichiaChaffeensis,
                 ModelData().antimicrobials[selection3].ehrlichiaChaffeensis, ModelData().antimicrobials[selection4].ehrlichiaChaffeensis, ModelData().antimicrobials[selection5].ehrlichiaChaffeensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].eikenellaSp, ModelData().antimicrobials[selection2].eikenellaSp,
                 ModelData().antimicrobials[selection3].eikenellaSp, ModelData().antimicrobials[selection4].eikenellaSp, ModelData().antimicrobials[selection5].eikenellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterobacterSp, ModelData().antimicrobials[selection2].enterobacterSp,
                 ModelData().antimicrobials[selection3].enterobacterSp, ModelData().antimicrobials[selection4].enterobacterSp, ModelData().antimicrobials[selection5].enterobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusCasseliflavus, ModelData().antimicrobials[selection2].enterococcusCasseliflavus,
                 ModelData().antimicrobials[selection3].enterococcusCasseliflavus, ModelData().antimicrobials[selection4].enterococcusCasseliflavus, ModelData().antimicrobials[selection5].enterococcusCasseliflavus].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusFaecalis, ModelData().antimicrobials[selection2].enterococcusFaecalis,
                 ModelData().antimicrobials[selection3].enterococcusFaecalis, ModelData().antimicrobials[selection4].enterococcusFaecalis, ModelData().antimicrobials[selection5].enterococcusFaecalis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusFaecium, ModelData().antimicrobials[selection2].enterococcusFaecium,
                 ModelData().antimicrobials[selection3].enterococcusFaecium, ModelData().antimicrobials[selection4].enterococcusFaecium, ModelData().antimicrobials[selection5].enterococcusFaecium].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusGallinarum, ModelData().antimicrobials[selection2].enterococcusGallinarum,
                 ModelData().antimicrobials[selection3].enterococcusGallinarum, ModelData().antimicrobials[selection4].enterococcusGallinarum, ModelData().antimicrobials[selection5].enterococcusGallinarum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusSp, ModelData().antimicrobials[selection2].enterococcusSp,
                 ModelData().antimicrobials[selection3].enterococcusSp, ModelData().antimicrobials[selection4].enterococcusSp, ModelData().antimicrobials[selection5].enterococcusSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].escherichiaHermanii, ModelData().antimicrobials[selection2].escherichiaHermanii,
                 ModelData().antimicrobials[selection3].escherichiaHermanii, ModelData().antimicrobials[selection4].escherichiaHermanii, ModelData().antimicrobials[selection5].escherichiaHermanii].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].francisellaTularensis, ModelData().antimicrobials[selection2].francisellaTularensis,
                 ModelData().antimicrobials[selection3].francisellaTularensis, ModelData().antimicrobials[selection4].francisellaTularensis, ModelData().antimicrobials[selection5].francisellaTularensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].fusobacteriumNecrophorum, ModelData().antimicrobials[selection2].fusobacteriumNecrophorum,
                 ModelData().antimicrobials[selection3].fusobacteriumNecrophorum, ModelData().antimicrobials[selection4].fusobacteriumNecrophorum, ModelData().antimicrobials[selection5].fusobacteriumNecrophorum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].haemophilusDucreyi, ModelData().antimicrobials[selection2].haemophilusDucreyi,
                 ModelData().antimicrobials[selection3].haemophilusDucreyi, ModelData().antimicrobials[selection4].haemophilusDucreyi, ModelData().antimicrobials[selection5].haemophilusDucreyi].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].haemophilusInfluenzae, ModelData().antimicrobials[selection2].haemophilusInfluenzae,
                 ModelData().antimicrobials[selection3].haemophilusInfluenzae, ModelData().antimicrobials[selection4].haemophilusInfluenzae, ModelData().antimicrobials[selection5].haemophilusInfluenzae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].helicobacterPylori, ModelData().antimicrobials[selection2].helicobacterPylori,
                 ModelData().antimicrobials[selection3].helicobacterPylori, ModelData().antimicrobials[selection4].helicobacterPylori, ModelData().antimicrobials[selection5].helicobacterPylori].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].kingellaKingae, ModelData().antimicrobials[selection2].kingellaKingae,
                 ModelData().antimicrobials[selection3].kingellaKingae, ModelData().antimicrobials[selection4].kingellaKingae, ModelData().antimicrobials[selection5].kingellaKingae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaAerogenes, ModelData().antimicrobials[selection2].klebsiellaAerogenes,
                 ModelData().antimicrobials[selection3].klebsiellaAerogenes, ModelData().antimicrobials[selection4].klebsiellaAerogenes, ModelData().antimicrobials[selection5].klebsiellaAerogenes].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].legionellaPneumophila, ModelData().antimicrobials[selection2].legionellaPneumophila,
                 ModelData().antimicrobials[selection3].legionellaPneumophila, ModelData().antimicrobials[selection4].legionellaPneumophila, ModelData().antimicrobials[selection5].legionellaPneumophila].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].leptospiraInterrogans, ModelData().antimicrobials[selection2].leptospiraInterrogans,
                 ModelData().antimicrobials[selection3].leptospiraInterrogans, ModelData().antimicrobials[selection4].leptospiraInterrogans, ModelData().antimicrobials[selection5].leptospiraInterrogans].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].listeriaMonocytogenes, ModelData().antimicrobials[selection2].listeriaMonocytogenes,
                 ModelData().antimicrobials[selection3].listeriaMonocytogenes, ModelData().antimicrobials[selection4].listeriaMonocytogenes, ModelData().antimicrobials[selection5].listeriaMonocytogenes].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].moraxellaCatarrhalis, ModelData().antimicrobials[selection2].moraxellaCatarrhalis,
                 ModelData().antimicrobials[selection3].moraxellaCatarrhalis, ModelData().antimicrobials[selection4].moraxellaCatarrhalis, ModelData().antimicrobials[selection5].moraxellaCatarrhalis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].morganellaSp, ModelData().antimicrobials[selection2].morganellaSp,
                 ModelData().antimicrobials[selection3].morganellaSp, ModelData().antimicrobials[selection4].morganellaSp, ModelData().antimicrobials[selection5].morganellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mycoplasmaGenitalium, ModelData().antimicrobials[selection2].mycoplasmaGenitalium,
                 ModelData().antimicrobials[selection3].mycoplasmaGenitalium, ModelData().antimicrobials[selection4].mycoplasmaGenitalium, ModelData().antimicrobials[selection5].mycoplasmaGenitalium].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mycoplasmaHominis, ModelData().antimicrobials[selection2].mycoplasmaHominis,
                 ModelData().antimicrobials[selection3].mycoplasmaHominis, ModelData().antimicrobials[selection4].mycoplasmaHominis, ModelData().antimicrobials[selection5].mycoplasmaHominis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mycoplasmaPneumoniae, ModelData().antimicrobials[selection2].mycoplasmaPneumoniae,
                 ModelData().antimicrobials[selection3].mycoplasmaPneumoniae, ModelData().antimicrobials[selection4].mycoplasmaPneumoniae, ModelData().antimicrobials[selection5].mycoplasmaPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].neisseriaGonorrhoeae, ModelData().antimicrobials[selection2].neisseriaGonorrhoeae,
                 ModelData().antimicrobials[selection3].neisseriaGonorrhoeae, ModelData().antimicrobials[selection4].neisseriaGonorrhoeae, ModelData().antimicrobials[selection5].neisseriaGonorrhoeae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].neisseriaMeningitidis, ModelData().antimicrobials[selection2].neisseriaMeningitidis,
                 ModelData().antimicrobials[selection3].neisseriaMeningitidis, ModelData().antimicrobials[selection4].neisseriaMeningitidis, ModelData().antimicrobials[selection5].neisseriaMeningitidis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaAbscessus, ModelData().antimicrobials[selection2].nocardiaAbscessus,
                 ModelData().antimicrobials[selection3].nocardiaAbscessus, ModelData().antimicrobials[selection4].nocardiaAbscessus, ModelData().antimicrobials[selection5].nocardiaAbscessus].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaAsteroides, ModelData().antimicrobials[selection2].nocardiaAsteroides,
                 ModelData().antimicrobials[selection3].nocardiaAsteroides, ModelData().antimicrobials[selection4].nocardiaAsteroides, ModelData().antimicrobials[selection5].nocardiaAsteroides].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection2].nocardiaCyriacigeorgica,
                 ModelData().antimicrobials[selection3].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection4].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection5].nocardiaCyriacigeorgica].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaFarcinica, ModelData().antimicrobials[selection2].nocardiaFarcinica,
                 ModelData().antimicrobials[selection3].nocardiaFarcinica, ModelData().antimicrobials[selection4].nocardiaFarcinica, ModelData().antimicrobials[selection5].nocardiaFarcinica].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaNova, ModelData().antimicrobials[selection2].nocardiaNova,
                 ModelData().antimicrobials[selection3].nocardiaNova, ModelData().antimicrobials[selection4].nocardiaNova, ModelData().antimicrobials[selection5].nocardiaNova].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].nocardiaTransvalensis, ModelData().antimicrobials[selection2].nocardiaTransvalensis,
                 ModelData().antimicrobials[selection3].nocardiaTransvalensis, ModelData().antimicrobials[selection4].nocardiaTransvalensis, ModelData().antimicrobials[selection5].nocardiaTransvalensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].prevotellaSp, ModelData().antimicrobials[selection2].prevotellaSp,
                 ModelData().antimicrobials[selection3].prevotellaSp, ModelData().antimicrobials[selection4].prevotellaSp, ModelData().antimicrobials[selection5].prevotellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].proteusMirabilis, ModelData().antimicrobials[selection2].proteusMirabilis,
                 ModelData().antimicrobials[selection3].proteusMirabilis, ModelData().antimicrobials[selection4].proteusMirabilis, ModelData().antimicrobials[selection5].proteusMirabilis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].proteusPenneri, ModelData().antimicrobials[selection2].proteusPenneri,
                 ModelData().antimicrobials[selection3].proteusPenneri, ModelData().antimicrobials[selection4].proteusPenneri, ModelData().antimicrobials[selection5].proteusPenneri].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].proteusVulgaris, ModelData().antimicrobials[selection2].proteusVulgaris,
                 ModelData().antimicrobials[selection3].proteusVulgaris, ModelData().antimicrobials[selection4].proteusVulgaris, ModelData().antimicrobials[selection5].proteusVulgaris].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].providenciaSp, ModelData().antimicrobials[selection2].providenciaSp,
                 ModelData().antimicrobials[selection3].providenciaSp, ModelData().antimicrobials[selection4].providenciaSp, ModelData().antimicrobials[selection5].providenciaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].pseudomonasAeruginosa, ModelData().antimicrobials[selection2].pseudomonasAeruginosa,
                 ModelData().antimicrobials[selection3].pseudomonasAeruginosa, ModelData().antimicrobials[selection4].pseudomonasAeruginosa, ModelData().antimicrobials[selection5].pseudomonasAeruginosa].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].rickettsiaRickettsi, ModelData().antimicrobials[selection2].rickettsiaRickettsi,
                 ModelData().antimicrobials[selection3].rickettsiaRickettsi, ModelData().antimicrobials[selection4].rickettsiaRickettsi, ModelData().antimicrobials[selection5].rickettsiaRickettsi].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].salmonellaSp, ModelData().antimicrobials[selection2].salmonellaSp,
                 ModelData().antimicrobials[selection3].salmonellaSp, ModelData().antimicrobials[selection4].salmonellaSp, ModelData().antimicrobials[selection5].salmonellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].serratiaMarcescens, ModelData().antimicrobials[selection2].serratiaMarcescens,
                 ModelData().antimicrobials[selection3].serratiaMarcescens, ModelData().antimicrobials[selection4].serratiaMarcescens, ModelData().antimicrobials[selection5].serratiaMarcescens].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].shigellaSp, ModelData().antimicrobials[selection2].shigellaSp,
                 ModelData().antimicrobials[selection3].shigellaSp, ModelData().antimicrobials[selection4].shigellaSp, ModelData().antimicrobials[selection5].shigellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].staphylococcusSaprophyticus, ModelData().antimicrobials[selection2].staphylococcusSaprophyticus,
                 ModelData().antimicrobials[selection3].staphylococcusSaprophyticus, ModelData().antimicrobials[selection4].staphylococcusSaprophyticus, ModelData().antimicrobials[selection5].staphylococcusSaprophyticus].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection2].stenotrophomonasMaltophilia,
                 ModelData().antimicrobials[selection3].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection4].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection5].stenotrophomonasMaltophilia].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].streptococcusPneumoniae, ModelData().antimicrobials[selection2].streptococcusPneumoniae,
                 ModelData().antimicrobials[selection3].streptococcusPneumoniae, ModelData().antimicrobials[selection4].streptococcusPneumoniae, ModelData().antimicrobials[selection5].streptococcusPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].treponemaPallidum, ModelData().antimicrobials[selection2].treponemaPallidum,
                 ModelData().antimicrobials[selection3].treponemaPallidum, ModelData().antimicrobials[selection4].treponemaPallidum, ModelData().antimicrobials[selection5].treponemaPallidum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].ureaplasmaParvum, ModelData().antimicrobials[selection2].ureaplasmaParvum,
                 ModelData().antimicrobials[selection3].ureaplasmaParvum, ModelData().antimicrobials[selection4].ureaplasmaParvum, ModelData().antimicrobials[selection5].ureaplasmaParvum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].ureaplasmaUrealyticum, ModelData().antimicrobials[selection2].ureaplasmaUrealyticum,
                 ModelData().antimicrobials[selection3].ureaplasmaUrealyticum, ModelData().antimicrobials[selection4].ureaplasmaUrealyticum, ModelData().antimicrobials[selection5].ureaplasmaUrealyticum].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].vibrioSp, ModelData().antimicrobials[selection2].vibrioSp,
                 ModelData().antimicrobials[selection3].vibrioSp, ModelData().antimicrobials[selection4].vibrioSp, ModelData().antimicrobials[selection5].vibrioSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].yersiniaEnterocolitica, ModelData().antimicrobials[selection2].yersiniaEnterocolitica,
                 ModelData().antimicrobials[selection3].yersiniaEnterocolitica, ModelData().antimicrobials[selection4].yersiniaEnterocolitica, ModelData().antimicrobials[selection5].yersiniaEnterocolitica].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection2].yersiniaPseudotuberculosis,
                 ModelData().antimicrobials[selection3].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection4].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection5].yersiniaPseudotuberculosis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].escherichiaColi, ModelData().antimicrobials[selection2].escherichiaColi,
                 ModelData().antimicrobials[selection3].escherichiaColi, ModelData().antimicrobials[selection4].escherichiaColi, ModelData().antimicrobials[selection5].escherichiaColi].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaSp, ModelData().antimicrobials[selection2].klebsiellaSp,
                 ModelData().antimicrobials[selection3].klebsiellaSp, ModelData().antimicrobials[selection4].klebsiellaSp, ModelData().antimicrobials[selection5].klebsiellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].aerococcusSp, ModelData().antimicrobials[selection2].aerococcusSp,
                 ModelData().antimicrobials[selection3].aerococcusSp, ModelData().antimicrobials[selection4].aerococcusSp, ModelData().antimicrobials[selection5].aerococcusSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].bacillusAnthracis, ModelData().antimicrobials[selection2].bacillusAnthracis,
                 ModelData().antimicrobials[selection3].bacillusAnthracis, ModelData().antimicrobials[selection4].bacillusAnthracis, ModelData().antimicrobials[selection5].bacillusAnthracis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].bartonellaHenselae, ModelData().antimicrobials[selection2].bartonellaHenselae,
                 ModelData().antimicrobials[selection3].bartonellaHenselae, ModelData().antimicrobials[selection4].bartonellaHenselae, ModelData().antimicrobials[selection5].bartonellaHenselae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].brucellaMelitensis, ModelData().antimicrobials[selection2].brucellaMelitensis,
                 ModelData().antimicrobials[selection3].brucellaMelitensis, ModelData().antimicrobials[selection4].brucellaMelitensis, ModelData().antimicrobials[selection5].brucellaMelitensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].burkholderiacepaciaComplex, ModelData().antimicrobials[selection2].burkholderiacepaciaComplex,
                 ModelData().antimicrobials[selection3].burkholderiacepaciaComplex, ModelData().antimicrobials[selection4].burkholderiacepaciaComplex, ModelData().antimicrobials[selection5].burkholderiacepaciaComplex].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].campylobacterSp, ModelData().antimicrobials[selection2].campylobacterSp,
                 ModelData().antimicrobials[selection3].campylobacterSp, ModelData().antimicrobials[selection4].campylobacterSp, ModelData().antimicrobials[selection5].campylobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].citrobacterSpEsbl, ModelData().antimicrobials[selection2].citrobacterSpEsbl,
                 ModelData().antimicrobials[selection3].citrobacterSpEsbl, ModelData().antimicrobials[selection4].citrobacterSpEsbl, ModelData().antimicrobials[selection5].citrobacterSpEsbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].citrobacterSpKpc, ModelData().antimicrobials[selection2].citrobacterSpKpc,
                 ModelData().antimicrobials[selection3].citrobacterSpKpc, ModelData().antimicrobials[selection4].citrobacterSpKpc, ModelData().antimicrobials[selection5].citrobacterSpKpc].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].citrobacterSpMbl, ModelData().antimicrobials[selection2].citrobacterSpMbl,
                 ModelData().antimicrobials[selection3].citrobacterSpMbl, ModelData().antimicrobials[selection4].citrobacterSpMbl, ModelData().antimicrobials[selection5].citrobacterSpMbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].citrobacterSpOxa, ModelData().antimicrobials[selection2].citrobacterSpOxa,
                 ModelData().antimicrobials[selection3].citrobacterSpOxa, ModelData().antimicrobials[selection4].citrobacterSpOxa, ModelData().antimicrobials[selection5].citrobacterSpOxa].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].corynebacteriumDiphtheriae, ModelData().antimicrobials[selection2].corynebacteriumDiphtheriae,
                 ModelData().antimicrobials[selection3].corynebacteriumDiphtheriae, ModelData().antimicrobials[selection4].corynebacteriumDiphtheriae, ModelData().antimicrobials[selection5].corynebacteriumDiphtheriae].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].corynebacteriumUlcerans, ModelData().antimicrobials[selection2].corynebacteriumUlcerans,
                 ModelData().antimicrobials[selection3].corynebacteriumUlcerans, ModelData().antimicrobials[selection4].corynebacteriumUlcerans, ModelData().antimicrobials[selection5].corynebacteriumUlcerans].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterobacterSpKpc, ModelData().antimicrobials[selection2].enterobacterSpKpc,
                 ModelData().antimicrobials[selection3].enterobacterSpKpc, ModelData().antimicrobials[selection4].enterobacterSpKpc, ModelData().antimicrobials[selection5].enterobacterSpKpc].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterobacterSpMbl, ModelData().antimicrobials[selection2].enterobacterSpMbl,
                 ModelData().antimicrobials[selection3].enterobacterSpMbl, ModelData().antimicrobials[selection4].enterobacterSpMbl, ModelData().antimicrobials[selection5].enterobacterSpMbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterobacterSpOxa, ModelData().antimicrobials[selection2].enterobacterSpOxa,
                 ModelData().antimicrobials[selection3].enterobacterSpOxa, ModelData().antimicrobials[selection4].enterobacterSpOxa, ModelData().antimicrobials[selection5].enterobacterSpOxa].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].enterococcusSpVRE, ModelData().antimicrobials[selection2].enterococcusSpVRE,
                 ModelData().antimicrobials[selection3].enterococcusSpVRE, ModelData().antimicrobials[selection4].enterococcusSpVRE, ModelData().antimicrobials[selection5].enterococcusSpVRE].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].escherichiaColiEsbl, ModelData().antimicrobials[selection2].escherichiaColiEsbl,
                 ModelData().antimicrobials[selection3].escherichiaColiEsbl, ModelData().antimicrobials[selection4].escherichiaColiEsbl, ModelData().antimicrobials[selection5].escherichiaColiEsbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].escherichiaColiKpc, ModelData().antimicrobials[selection2].escherichiaColiKpc,
                 ModelData().antimicrobials[selection3].escherichiaColiKpc, ModelData().antimicrobials[selection4].escherichiaColiKpc, ModelData().antimicrobials[selection5].escherichiaColiKpc].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].escherichiaColiMbl, ModelData().antimicrobials[selection2].escherichiaColiMbl,
                 ModelData().antimicrobials[selection3].escherichiaColiMbl, ModelData().antimicrobials[selection4].escherichiaColiMbl, ModelData().antimicrobials[selection5].escherichiaColiMbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].escherichiaColiOxa, ModelData().antimicrobials[selection2].escherichiaColiOxa,
                 ModelData().antimicrobials[selection3].escherichiaColiOxa, ModelData().antimicrobials[selection4].escherichiaColiOxa, ModelData().antimicrobials[selection5].escherichiaColiOxa].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].hafniaSp, ModelData().antimicrobials[selection2].hafniaSp,
                 ModelData().antimicrobials[selection3].hafniaSp, ModelData().antimicrobials[selection4].hafniaSp, ModelData().antimicrobials[selection5].hafniaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaSpEsbl, ModelData().antimicrobials[selection2].klebsiellaSpEsbl,
                 ModelData().antimicrobials[selection3].klebsiellaSpEsbl, ModelData().antimicrobials[selection4].klebsiellaSpEsbl, ModelData().antimicrobials[selection5].klebsiellaSpEsbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaSpKpc, ModelData().antimicrobials[selection2].klebsiellaSpKpc,
                 ModelData().antimicrobials[selection3].klebsiellaSpKpc, ModelData().antimicrobials[selection4].klebsiellaSpKpc, ModelData().antimicrobials[selection5].klebsiellaSpKpc].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaSpMbl, ModelData().antimicrobials[selection2].klebsiellaSpMbl,
                 ModelData().antimicrobials[selection3].klebsiellaSpMbl, ModelData().antimicrobials[selection4].klebsiellaSpMbl, ModelData().antimicrobials[selection5].klebsiellaSpMbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].klebsiellaSpOxa, ModelData().antimicrobials[selection2].klebsiellaSpOxa,
                 ModelData().antimicrobials[selection3].klebsiellaSpOxa, ModelData().antimicrobials[selection4].klebsiellaSpOxa, ModelData().antimicrobials[selection5].klebsiellaSpOxa].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mrCons, ModelData().antimicrobials[selection2].mrCons,
                 ModelData().antimicrobials[selection3].mrCons, ModelData().antimicrobials[selection4].mrCons, ModelData().antimicrobials[selection5].mrCons].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mrSa, ModelData().antimicrobials[selection2].mrSa,
                 ModelData().antimicrobials[selection3].mrSa, ModelData().antimicrobials[selection4].mrSa, ModelData().antimicrobials[selection5].mrSa].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mrStaphylococcusCapitis, ModelData().antimicrobials[selection2].mrStaphylococcusCapitis,
                 ModelData().antimicrobials[selection3].mrStaphylococcusCapitis, ModelData().antimicrobials[selection4].mrStaphylococcusCapitis, ModelData().antimicrobials[selection5].mrStaphylococcusCapitis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].mrStaphylococcusSaprophyticus, ModelData().antimicrobials[selection2].mrStaphylococcusSaprophyticus,
                 ModelData().antimicrobials[selection3].mrStaphylococcusSaprophyticus, ModelData().antimicrobials[selection4].mrStaphylococcusSaprophyticus, ModelData().antimicrobials[selection5].mrStaphylococcusSaprophyticus].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].msCons, ModelData().antimicrobials[selection2].msCons,
                 ModelData().antimicrobials[selection3].msCons, ModelData().antimicrobials[selection4].msCons, ModelData().antimicrobials[selection5].msCons].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].msSa, ModelData().antimicrobials[selection2].msSa,
                 ModelData().antimicrobials[selection3].msSa, ModelData().antimicrobials[selection4].msSa, ModelData().antimicrobials[selection5].msSa].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].pasteurellaSp, ModelData().antimicrobials[selection2].pasteurellaSp,
                 ModelData().antimicrobials[selection3].pasteurellaSp, ModelData().antimicrobials[selection4].pasteurellaSp, ModelData().antimicrobials[selection5].pasteurellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].proteusMirabilisEsbl, ModelData().antimicrobials[selection2].proteusMirabilisEsbl,
                 ModelData().antimicrobials[selection3].proteusMirabilisEsbl, ModelData().antimicrobials[selection4].proteusMirabilisEsbl, ModelData().antimicrobials[selection5].proteusMirabilisEsbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].staphylococcusCapitis, ModelData().antimicrobials[selection2].staphylococcusCapitis,
                 ModelData().antimicrobials[selection3].staphylococcusCapitis, ModelData().antimicrobials[selection4].staphylococcusCapitis, ModelData().antimicrobials[selection5].staphylococcusCapitis].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].streptococcusAnginosusgroup, ModelData().antimicrobials[selection2].streptococcusAnginosusgroup,
                 ModelData().antimicrobials[selection3].streptococcusAnginosusgroup, ModelData().antimicrobials[selection4].streptococcusAnginosusgroup, ModelData().antimicrobials[selection5].streptococcusAnginosusgroup].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].streptococcusGroupabcg, ModelData().antimicrobials[selection2].streptococcusGroupabcg,
                 ModelData().antimicrobials[selection3].streptococcusGroupabcg, ModelData().antimicrobials[selection4].streptococcusGroupabcg, ModelData().antimicrobials[selection5].streptococcusGroupabcg].max() ?? 0.0,
                [ModelData().antimicrobials[selection1].viridansStreptococci, ModelData().antimicrobials[selection2].viridansStreptococci,
                 ModelData().antimicrobials[selection3].viridansStreptococci, ModelData().antimicrobials[selection4].viridansStreptococci, ModelData().antimicrobials[selection5].viridansStreptococci].max() ?? 0.0
            ]
            
        } else {
            initialArrayScores = [
                ModelData().antimicrobials[selection1].citrobacterBraakii,
                ModelData().antimicrobials[selection1].citrobacterFreundii,
                ModelData().antimicrobials[selection1].achromobacterXylosoxidans,
                ModelData().antimicrobials[selection1].acinetobacterSp,
                ModelData().antimicrobials[selection1].aeromonasDhakensis,
                ModelData().antimicrobials[selection1].aeromonasSp,
                ModelData().antimicrobials[selection1].anaplasmaPhagocytophilum,
                ModelData().antimicrobials[selection1].bacillusSp,
                ModelData().antimicrobials[selection1].bacteroidesSp,
                ModelData().antimicrobials[selection1].bordetellaPertussis,
                ModelData().antimicrobials[selection1].borreliaBurgorferi,
                ModelData().antimicrobials[selection1].burkholderiaPseudomallei,
                ModelData().antimicrobials[selection1].chlamydiaPneumoniae,
                ModelData().antimicrobials[selection1].chlamydiaPsittaci,
                ModelData().antimicrobials[selection1].chlamydiaTrachomatis,
                ModelData().antimicrobials[selection1].citrobacterSp,
                ModelData().antimicrobials[selection1].clostridioidesDifficile,
                ModelData().antimicrobials[selection1].clostridiumPerfringens,
                ModelData().antimicrobials[selection1].corynebacteriumSp,
                ModelData().antimicrobials[selection1].coxiellaBurnetii,
                ModelData().antimicrobials[selection1].cutibacteriumAcnes,
                ModelData().antimicrobials[selection1].ehrlichiaChaffeensis,
                ModelData().antimicrobials[selection1].eikenellaSp,
                ModelData().antimicrobials[selection1].enterobacterSp,
                ModelData().antimicrobials[selection1].enterococcusCasseliflavus,
                ModelData().antimicrobials[selection1].enterococcusFaecalis,
                ModelData().antimicrobials[selection1].enterococcusFaecium,
                ModelData().antimicrobials[selection1].enterococcusGallinarum,
                ModelData().antimicrobials[selection1].enterococcusSp,
                ModelData().antimicrobials[selection1].escherichiaHermanii,
                ModelData().antimicrobials[selection1].francisellaTularensis,
                ModelData().antimicrobials[selection1].fusobacteriumNecrophorum,
                ModelData().antimicrobials[selection1].haemophilusDucreyi,
                ModelData().antimicrobials[selection1].haemophilusInfluenzae,
                ModelData().antimicrobials[selection1].helicobacterPylori,
                ModelData().antimicrobials[selection1].kingellaKingae,
                ModelData().antimicrobials[selection1].klebsiellaAerogenes,
                ModelData().antimicrobials[selection1].legionellaPneumophila,
                ModelData().antimicrobials[selection1].leptospiraInterrogans,
                ModelData().antimicrobials[selection1].listeriaMonocytogenes,
                ModelData().antimicrobials[selection1].moraxellaCatarrhalis,
                ModelData().antimicrobials[selection1].morganellaSp,
                ModelData().antimicrobials[selection1].mycoplasmaGenitalium,
                ModelData().antimicrobials[selection1].mycoplasmaHominis,
                ModelData().antimicrobials[selection1].mycoplasmaPneumoniae,
                ModelData().antimicrobials[selection1].neisseriaGonorrhoeae,
                ModelData().antimicrobials[selection1].neisseriaMeningitidis,
                ModelData().antimicrobials[selection1].nocardiaAbscessus,
                ModelData().antimicrobials[selection1].nocardiaAsteroides,
                ModelData().antimicrobials[selection1].nocardiaCyriacigeorgica,
                ModelData().antimicrobials[selection1].nocardiaFarcinica,
                ModelData().antimicrobials[selection1].nocardiaNova,
                ModelData().antimicrobials[selection1].nocardiaTransvalensis,
                ModelData().antimicrobials[selection1].prevotellaSp,
                ModelData().antimicrobials[selection1].proteusMirabilis,
                ModelData().antimicrobials[selection1].proteusPenneri,
                ModelData().antimicrobials[selection1].proteusVulgaris,
                ModelData().antimicrobials[selection1].providenciaSp,
                ModelData().antimicrobials[selection1].pseudomonasAeruginosa,
                ModelData().antimicrobials[selection1].rickettsiaRickettsi,
                ModelData().antimicrobials[selection1].salmonellaSp,
                ModelData().antimicrobials[selection1].serratiaMarcescens,
                ModelData().antimicrobials[selection1].shigellaSp,
                ModelData().antimicrobials[selection1].staphylococcusSaprophyticus,
                ModelData().antimicrobials[selection1].stenotrophomonasMaltophilia,
                ModelData().antimicrobials[selection1].streptococcusPneumoniae,
                ModelData().antimicrobials[selection1].treponemaPallidum,
                ModelData().antimicrobials[selection1].ureaplasmaParvum,
                ModelData().antimicrobials[selection1].ureaplasmaUrealyticum,
                ModelData().antimicrobials[selection1].vibrioSp,
                ModelData().antimicrobials[selection1].yersiniaEnterocolitica,
                ModelData().antimicrobials[selection1].yersiniaPseudotuberculosis,
                ModelData().antimicrobials[selection1].escherichiaColi,
                ModelData().antimicrobials[selection1].klebsiellaSp,
                ModelData().antimicrobials[selection1].aerococcusSp,
                ModelData().antimicrobials[selection1].bacillusAnthracis,
                ModelData().antimicrobials[selection1].bartonellaHenselae,
                ModelData().antimicrobials[selection1].brucellaMelitensis,
                ModelData().antimicrobials[selection1].burkholderiacepaciaComplex,
                ModelData().antimicrobials[selection1].campylobacterSp,
                ModelData().antimicrobials[selection1].citrobacterSpEsbl,
                ModelData().antimicrobials[selection1].citrobacterSpKpc,
                ModelData().antimicrobials[selection1].citrobacterSpMbl,
                ModelData().antimicrobials[selection1].citrobacterSpOxa,
                ModelData().antimicrobials[selection1].corynebacteriumDiphtheriae,
                ModelData().antimicrobials[selection1].corynebacteriumUlcerans,
                ModelData().antimicrobials[selection1].enterobacterSpKpc,
                ModelData().antimicrobials[selection1].enterobacterSpMbl,
                ModelData().antimicrobials[selection1].enterobacterSpOxa,
                ModelData().antimicrobials[selection1].enterococcusSpVRE,
                ModelData().antimicrobials[selection1].escherichiaColiEsbl,
                ModelData().antimicrobials[selection1].escherichiaColiKpc,
                ModelData().antimicrobials[selection1].escherichiaColiMbl,
                ModelData().antimicrobials[selection1].escherichiaColiOxa,
                ModelData().antimicrobials[selection1].hafniaSp,
                ModelData().antimicrobials[selection1].klebsiellaSpEsbl,
                ModelData().antimicrobials[selection1].klebsiellaSpKpc,
                ModelData().antimicrobials[selection1].klebsiellaSpMbl,
                ModelData().antimicrobials[selection1].klebsiellaSpOxa,
                ModelData().antimicrobials[selection1].mrCons,
                ModelData().antimicrobials[selection1].mrSa,
                ModelData().antimicrobials[selection1].mrStaphylococcusCapitis,
                ModelData().antimicrobials[selection1].mrStaphylococcusSaprophyticus,
                ModelData().antimicrobials[selection1].msCons,
                ModelData().antimicrobials[selection1].msSa,
                ModelData().antimicrobials[selection1].pasteurellaSp,
                ModelData().antimicrobials[selection1].proteusMirabilisEsbl,
                ModelData().antimicrobials[selection1].staphylococcusCapitis,
                ModelData().antimicrobials[selection1].streptococcusAnginosusgroup,
                ModelData().antimicrobials[selection1].streptococcusGroupabcg,
                ModelData().antimicrobials[selection1].viridansStreptococci
            ]
        }
        
        
        if(selection7 != 0){
            
            finalArrayScores = [
                
                [ModelData().antimicrobials[selection6].citrobacterBraakii, ModelData().antimicrobials[selection7].citrobacterBraakii,
                 ModelData().antimicrobials[selection8].citrobacterBraakii, ModelData().antimicrobials[selection9].citrobacterBraakii, ModelData().antimicrobials[selection10].citrobacterBraakii].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].citrobacterFreundii, ModelData().antimicrobials[selection7].citrobacterFreundii,
                 ModelData().antimicrobials[selection8].citrobacterFreundii, ModelData().antimicrobials[selection9].citrobacterFreundii, ModelData().antimicrobials[selection10].citrobacterFreundii].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].achromobacterXylosoxidans, ModelData().antimicrobials[selection7].achromobacterXylosoxidans,
                 ModelData().antimicrobials[selection8].achromobacterXylosoxidans, ModelData().antimicrobials[selection9].achromobacterXylosoxidans, ModelData().antimicrobials[selection10].achromobacterXylosoxidans].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].acinetobacterSp, ModelData().antimicrobials[selection7].acinetobacterSp,
                 ModelData().antimicrobials[selection8].acinetobacterSp, ModelData().antimicrobials[selection9].acinetobacterSp, ModelData().antimicrobials[selection10].acinetobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].aeromonasDhakensis, ModelData().antimicrobials[selection7].aeromonasDhakensis,
                 ModelData().antimicrobials[selection8].aeromonasDhakensis, ModelData().antimicrobials[selection9].aeromonasDhakensis, ModelData().antimicrobials[selection10].aeromonasDhakensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].aeromonasSp, ModelData().antimicrobials[selection7].aeromonasSp,
                 ModelData().antimicrobials[selection8].aeromonasSp, ModelData().antimicrobials[selection9].aeromonasSp, ModelData().antimicrobials[selection10].aeromonasSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection7].anaplasmaPhagocytophilum,
                 ModelData().antimicrobials[selection8].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection9].anaplasmaPhagocytophilum, ModelData().antimicrobials[selection10].anaplasmaPhagocytophilum].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].bacillusSp, ModelData().antimicrobials[selection7].bacillusSp,
                 ModelData().antimicrobials[selection8].bacillusSp, ModelData().antimicrobials[selection9].bacillusSp, ModelData().antimicrobials[selection10].bacillusSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].bacteroidesSp, ModelData().antimicrobials[selection7].bacteroidesSp,
                 ModelData().antimicrobials[selection8].bacteroidesSp, ModelData().antimicrobials[selection9].bacteroidesSp, ModelData().antimicrobials[selection10].bacteroidesSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].bordetellaPertussis, ModelData().antimicrobials[selection7].bordetellaPertussis,
                 ModelData().antimicrobials[selection8].bordetellaPertussis, ModelData().antimicrobials[selection9].bordetellaPertussis, ModelData().antimicrobials[selection10].bordetellaPertussis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].borreliaBurgorferi, ModelData().antimicrobials[selection7].borreliaBurgorferi,
                 ModelData().antimicrobials[selection8].borreliaBurgorferi, ModelData().antimicrobials[selection9].borreliaBurgorferi, ModelData().antimicrobials[selection10].borreliaBurgorferi].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].burkholderiaPseudomallei, ModelData().antimicrobials[selection7].burkholderiaPseudomallei,
                 ModelData().antimicrobials[selection8].burkholderiaPseudomallei, ModelData().antimicrobials[selection9].burkholderiaPseudomallei, ModelData().antimicrobials[selection10].burkholderiaPseudomallei].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].chlamydiaPneumoniae, ModelData().antimicrobials[selection7].chlamydiaPneumoniae,
                 ModelData().antimicrobials[selection8].chlamydiaPneumoniae, ModelData().antimicrobials[selection9].chlamydiaPneumoniae, ModelData().antimicrobials[selection10].chlamydiaPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].chlamydiaPsittaci, ModelData().antimicrobials[selection7].chlamydiaPsittaci,
                 ModelData().antimicrobials[selection8].chlamydiaPsittaci, ModelData().antimicrobials[selection9].chlamydiaPsittaci, ModelData().antimicrobials[selection10].chlamydiaPsittaci].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].chlamydiaTrachomatis, ModelData().antimicrobials[selection7].chlamydiaTrachomatis,
                 ModelData().antimicrobials[selection8].chlamydiaTrachomatis, ModelData().antimicrobials[selection9].chlamydiaTrachomatis, ModelData().antimicrobials[selection10].chlamydiaTrachomatis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].citrobacterSp, ModelData().antimicrobials[selection7].citrobacterSp,
                 ModelData().antimicrobials[selection8].citrobacterSp, ModelData().antimicrobials[selection9].citrobacterSp, ModelData().antimicrobials[selection10].citrobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].clostridioidesDifficile, ModelData().antimicrobials[selection7].clostridioidesDifficile,
                 ModelData().antimicrobials[selection8].clostridioidesDifficile, ModelData().antimicrobials[selection9].clostridioidesDifficile, ModelData().antimicrobials[selection10].clostridioidesDifficile].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].clostridiumPerfringens, ModelData().antimicrobials[selection7].clostridiumPerfringens,
                 ModelData().antimicrobials[selection8].clostridiumPerfringens, ModelData().antimicrobials[selection9].clostridiumPerfringens, ModelData().antimicrobials[selection10].clostridiumPerfringens].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].corynebacteriumSp, ModelData().antimicrobials[selection7].corynebacteriumSp,
                 ModelData().antimicrobials[selection8].corynebacteriumSp, ModelData().antimicrobials[selection9].corynebacteriumSp, ModelData().antimicrobials[selection10].corynebacteriumSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].coxiellaBurnetii, ModelData().antimicrobials[selection7].coxiellaBurnetii,
                 ModelData().antimicrobials[selection8].coxiellaBurnetii, ModelData().antimicrobials[selection9].coxiellaBurnetii, ModelData().antimicrobials[selection10].coxiellaBurnetii].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].cutibacteriumAcnes, ModelData().antimicrobials[selection7].cutibacteriumAcnes,
                 ModelData().antimicrobials[selection8].cutibacteriumAcnes, ModelData().antimicrobials[selection9].cutibacteriumAcnes, ModelData().antimicrobials[selection10].cutibacteriumAcnes].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].ehrlichiaChaffeensis, ModelData().antimicrobials[selection7].ehrlichiaChaffeensis,
                 ModelData().antimicrobials[selection8].ehrlichiaChaffeensis, ModelData().antimicrobials[selection9].ehrlichiaChaffeensis, ModelData().antimicrobials[selection10].ehrlichiaChaffeensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].eikenellaSp, ModelData().antimicrobials[selection7].eikenellaSp,
                 ModelData().antimicrobials[selection8].eikenellaSp, ModelData().antimicrobials[selection9].eikenellaSp, ModelData().antimicrobials[selection10].eikenellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].enterobacterSp, ModelData().antimicrobials[selection7].enterobacterSp,
                 ModelData().antimicrobials[selection8].enterobacterSp, ModelData().antimicrobials[selection9].enterobacterSp, ModelData().antimicrobials[selection10].enterobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].enterococcusCasseliflavus, ModelData().antimicrobials[selection7].enterococcusCasseliflavus,
                 ModelData().antimicrobials[selection8].enterococcusCasseliflavus, ModelData().antimicrobials[selection9].enterococcusCasseliflavus, ModelData().antimicrobials[selection10].enterococcusCasseliflavus].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].enterococcusFaecalis, ModelData().antimicrobials[selection7].enterococcusFaecalis,
                 ModelData().antimicrobials[selection8].enterococcusFaecalis, ModelData().antimicrobials[selection9].enterococcusFaecalis, ModelData().antimicrobials[selection10].enterococcusFaecalis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].enterococcusFaecium, ModelData().antimicrobials[selection7].enterococcusFaecium,
                 ModelData().antimicrobials[selection8].enterococcusFaecium, ModelData().antimicrobials[selection9].enterococcusFaecium, ModelData().antimicrobials[selection10].enterococcusFaecium].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].enterococcusGallinarum, ModelData().antimicrobials[selection7].enterococcusGallinarum,
                 ModelData().antimicrobials[selection8].enterococcusGallinarum, ModelData().antimicrobials[selection9].enterococcusGallinarum, ModelData().antimicrobials[selection10].enterococcusGallinarum].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].enterococcusSp, ModelData().antimicrobials[selection7].enterococcusSp,
                 ModelData().antimicrobials[selection8].enterococcusSp, ModelData().antimicrobials[selection9].enterococcusSp, ModelData().antimicrobials[selection10].enterococcusSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].escherichiaHermanii, ModelData().antimicrobials[selection7].escherichiaHermanii,
                 ModelData().antimicrobials[selection8].escherichiaHermanii, ModelData().antimicrobials[selection9].escherichiaHermanii, ModelData().antimicrobials[selection10].escherichiaHermanii].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].francisellaTularensis, ModelData().antimicrobials[selection7].francisellaTularensis,
                 ModelData().antimicrobials[selection8].francisellaTularensis, ModelData().antimicrobials[selection9].francisellaTularensis, ModelData().antimicrobials[selection10].francisellaTularensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].fusobacteriumNecrophorum, ModelData().antimicrobials[selection7].fusobacteriumNecrophorum,
                 ModelData().antimicrobials[selection8].fusobacteriumNecrophorum, ModelData().antimicrobials[selection9].fusobacteriumNecrophorum, ModelData().antimicrobials[selection10].fusobacteriumNecrophorum].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].haemophilusDucreyi, ModelData().antimicrobials[selection7].haemophilusDucreyi,
                 ModelData().antimicrobials[selection8].haemophilusDucreyi, ModelData().antimicrobials[selection9].haemophilusDucreyi, ModelData().antimicrobials[selection10].haemophilusDucreyi].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].haemophilusInfluenzae, ModelData().antimicrobials[selection7].haemophilusInfluenzae,
                 ModelData().antimicrobials[selection8].haemophilusInfluenzae, ModelData().antimicrobials[selection9].haemophilusInfluenzae, ModelData().antimicrobials[selection10].haemophilusInfluenzae].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].helicobacterPylori, ModelData().antimicrobials[selection7].helicobacterPylori,
                 ModelData().antimicrobials[selection8].helicobacterPylori, ModelData().antimicrobials[selection9].helicobacterPylori, ModelData().antimicrobials[selection10].helicobacterPylori].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].kingellaKingae, ModelData().antimicrobials[selection7].kingellaKingae,
                 ModelData().antimicrobials[selection8].kingellaKingae, ModelData().antimicrobials[selection9].kingellaKingae, ModelData().antimicrobials[selection10].kingellaKingae].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].klebsiellaAerogenes, ModelData().antimicrobials[selection7].klebsiellaAerogenes,
                 ModelData().antimicrobials[selection8].klebsiellaAerogenes, ModelData().antimicrobials[selection9].klebsiellaAerogenes, ModelData().antimicrobials[selection10].klebsiellaAerogenes].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].legionellaPneumophila, ModelData().antimicrobials[selection7].legionellaPneumophila,
                 ModelData().antimicrobials[selection8].legionellaPneumophila, ModelData().antimicrobials[selection9].legionellaPneumophila, ModelData().antimicrobials[selection10].legionellaPneumophila].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].leptospiraInterrogans, ModelData().antimicrobials[selection7].leptospiraInterrogans,
                 ModelData().antimicrobials[selection8].leptospiraInterrogans, ModelData().antimicrobials[selection9].leptospiraInterrogans, ModelData().antimicrobials[selection10].leptospiraInterrogans].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].listeriaMonocytogenes, ModelData().antimicrobials[selection7].listeriaMonocytogenes,
                 ModelData().antimicrobials[selection8].listeriaMonocytogenes, ModelData().antimicrobials[selection9].listeriaMonocytogenes, ModelData().antimicrobials[selection10].listeriaMonocytogenes].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].moraxellaCatarrhalis, ModelData().antimicrobials[selection7].moraxellaCatarrhalis,
                 ModelData().antimicrobials[selection8].moraxellaCatarrhalis, ModelData().antimicrobials[selection9].moraxellaCatarrhalis, ModelData().antimicrobials[selection10].moraxellaCatarrhalis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].morganellaSp, ModelData().antimicrobials[selection7].morganellaSp,
                 ModelData().antimicrobials[selection8].morganellaSp, ModelData().antimicrobials[selection9].morganellaSp, ModelData().antimicrobials[selection10].morganellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].mycoplasmaGenitalium, ModelData().antimicrobials[selection7].mycoplasmaGenitalium,
                 ModelData().antimicrobials[selection8].mycoplasmaGenitalium, ModelData().antimicrobials[selection9].mycoplasmaGenitalium, ModelData().antimicrobials[selection10].mycoplasmaGenitalium].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].mycoplasmaHominis, ModelData().antimicrobials[selection7].mycoplasmaHominis,
                 ModelData().antimicrobials[selection8].mycoplasmaHominis, ModelData().antimicrobials[selection9].mycoplasmaHominis, ModelData().antimicrobials[selection10].mycoplasmaHominis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].mycoplasmaPneumoniae, ModelData().antimicrobials[selection7].mycoplasmaPneumoniae,
                 ModelData().antimicrobials[selection8].mycoplasmaPneumoniae, ModelData().antimicrobials[selection9].mycoplasmaPneumoniae, ModelData().antimicrobials[selection10].mycoplasmaPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].neisseriaGonorrhoeae, ModelData().antimicrobials[selection7].neisseriaGonorrhoeae,
                 ModelData().antimicrobials[selection8].neisseriaGonorrhoeae, ModelData().antimicrobials[selection9].neisseriaGonorrhoeae, ModelData().antimicrobials[selection10].neisseriaGonorrhoeae].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].neisseriaMeningitidis, ModelData().antimicrobials[selection7].neisseriaMeningitidis,
                 ModelData().antimicrobials[selection8].neisseriaMeningitidis, ModelData().antimicrobials[selection9].neisseriaMeningitidis, ModelData().antimicrobials[selection10].neisseriaMeningitidis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].nocardiaAbscessus, ModelData().antimicrobials[selection7].nocardiaAbscessus,
                 ModelData().antimicrobials[selection8].nocardiaAbscessus, ModelData().antimicrobials[selection9].nocardiaAbscessus, ModelData().antimicrobials[selection10].nocardiaAbscessus].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].nocardiaAsteroides, ModelData().antimicrobials[selection7].nocardiaAsteroides,
                 ModelData().antimicrobials[selection8].nocardiaAsteroides, ModelData().antimicrobials[selection9].nocardiaAsteroides, ModelData().antimicrobials[selection10].nocardiaAsteroides].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection7].nocardiaCyriacigeorgica,
                 ModelData().antimicrobials[selection8].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection9].nocardiaCyriacigeorgica, ModelData().antimicrobials[selection10].nocardiaCyriacigeorgica].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].nocardiaFarcinica, ModelData().antimicrobials[selection7].nocardiaFarcinica,
                 ModelData().antimicrobials[selection8].nocardiaFarcinica, ModelData().antimicrobials[selection9].nocardiaFarcinica, ModelData().antimicrobials[selection10].nocardiaFarcinica].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].nocardiaNova, ModelData().antimicrobials[selection7].nocardiaNova,
                 ModelData().antimicrobials[selection8].nocardiaNova, ModelData().antimicrobials[selection9].nocardiaNova, ModelData().antimicrobials[selection10].nocardiaNova].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].nocardiaTransvalensis, ModelData().antimicrobials[selection7].nocardiaTransvalensis,
                 ModelData().antimicrobials[selection8].nocardiaTransvalensis, ModelData().antimicrobials[selection9].nocardiaTransvalensis, ModelData().antimicrobials[selection10].nocardiaTransvalensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].prevotellaSp, ModelData().antimicrobials[selection7].prevotellaSp,
                 ModelData().antimicrobials[selection8].prevotellaSp, ModelData().antimicrobials[selection9].prevotellaSp, ModelData().antimicrobials[selection10].prevotellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].proteusMirabilis, ModelData().antimicrobials[selection7].proteusMirabilis,
                 ModelData().antimicrobials[selection8].proteusMirabilis, ModelData().antimicrobials[selection9].proteusMirabilis, ModelData().antimicrobials[selection10].proteusMirabilis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].proteusPenneri, ModelData().antimicrobials[selection7].proteusPenneri,
                 ModelData().antimicrobials[selection8].proteusPenneri, ModelData().antimicrobials[selection9].proteusPenneri, ModelData().antimicrobials[selection10].proteusPenneri].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].proteusVulgaris, ModelData().antimicrobials[selection7].proteusVulgaris,
                 ModelData().antimicrobials[selection8].proteusVulgaris, ModelData().antimicrobials[selection9].proteusVulgaris, ModelData().antimicrobials[selection10].proteusVulgaris].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].providenciaSp, ModelData().antimicrobials[selection7].providenciaSp,
                 ModelData().antimicrobials[selection8].providenciaSp, ModelData().antimicrobials[selection9].providenciaSp, ModelData().antimicrobials[selection10].providenciaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].pseudomonasAeruginosa, ModelData().antimicrobials[selection7].pseudomonasAeruginosa,
                 ModelData().antimicrobials[selection8].pseudomonasAeruginosa, ModelData().antimicrobials[selection9].pseudomonasAeruginosa, ModelData().antimicrobials[selection10].pseudomonasAeruginosa].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].rickettsiaRickettsi, ModelData().antimicrobials[selection7].rickettsiaRickettsi,
                 ModelData().antimicrobials[selection8].rickettsiaRickettsi, ModelData().antimicrobials[selection9].rickettsiaRickettsi, ModelData().antimicrobials[selection10].rickettsiaRickettsi].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].salmonellaSp, ModelData().antimicrobials[selection7].salmonellaSp,
                 ModelData().antimicrobials[selection8].salmonellaSp, ModelData().antimicrobials[selection9].salmonellaSp, ModelData().antimicrobials[selection10].salmonellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].serratiaMarcescens, ModelData().antimicrobials[selection7].serratiaMarcescens,
                 ModelData().antimicrobials[selection8].serratiaMarcescens, ModelData().antimicrobials[selection9].serratiaMarcescens, ModelData().antimicrobials[selection10].serratiaMarcescens].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].shigellaSp, ModelData().antimicrobials[selection7].shigellaSp,
                 ModelData().antimicrobials[selection8].shigellaSp, ModelData().antimicrobials[selection9].shigellaSp, ModelData().antimicrobials[selection10].shigellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].staphylococcusSaprophyticus, ModelData().antimicrobials[selection7].staphylococcusSaprophyticus,
                 ModelData().antimicrobials[selection8].staphylococcusSaprophyticus, ModelData().antimicrobials[selection9].staphylococcusSaprophyticus, ModelData().antimicrobials[selection10].staphylococcusSaprophyticus].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection7].stenotrophomonasMaltophilia,
                 ModelData().antimicrobials[selection8].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection9].stenotrophomonasMaltophilia, ModelData().antimicrobials[selection10].stenotrophomonasMaltophilia].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].streptococcusPneumoniae, ModelData().antimicrobials[selection7].streptococcusPneumoniae,
                 ModelData().antimicrobials[selection8].streptococcusPneumoniae, ModelData().antimicrobials[selection9].streptococcusPneumoniae, ModelData().antimicrobials[selection10].streptococcusPneumoniae].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].treponemaPallidum, ModelData().antimicrobials[selection7].treponemaPallidum,
                 ModelData().antimicrobials[selection8].treponemaPallidum, ModelData().antimicrobials[selection9].treponemaPallidum, ModelData().antimicrobials[selection10].treponemaPallidum].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].ureaplasmaParvum, ModelData().antimicrobials[selection7].ureaplasmaParvum,
                 ModelData().antimicrobials[selection8].ureaplasmaParvum, ModelData().antimicrobials[selection9].ureaplasmaParvum, ModelData().antimicrobials[selection10].ureaplasmaParvum].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].ureaplasmaUrealyticum, ModelData().antimicrobials[selection7].ureaplasmaUrealyticum,
                 ModelData().antimicrobials[selection8].ureaplasmaUrealyticum, ModelData().antimicrobials[selection9].ureaplasmaUrealyticum, ModelData().antimicrobials[selection10].ureaplasmaUrealyticum].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].vibrioSp, ModelData().antimicrobials[selection7].vibrioSp,
                 ModelData().antimicrobials[selection8].vibrioSp, ModelData().antimicrobials[selection9].vibrioSp, ModelData().antimicrobials[selection10].vibrioSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].yersiniaEnterocolitica, ModelData().antimicrobials[selection7].yersiniaEnterocolitica,
                 ModelData().antimicrobials[selection8].yersiniaEnterocolitica, ModelData().antimicrobials[selection9].yersiniaEnterocolitica, ModelData().antimicrobials[selection10].yersiniaEnterocolitica].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection7].yersiniaPseudotuberculosis,
                 ModelData().antimicrobials[selection8].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection9].yersiniaPseudotuberculosis, ModelData().antimicrobials[selection10].yersiniaPseudotuberculosis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].escherichiaColi, ModelData().antimicrobials[selection7].escherichiaColi,
                 ModelData().antimicrobials[selection8].escherichiaColi, ModelData().antimicrobials[selection9].escherichiaColi, ModelData().antimicrobials[selection10].escherichiaColi].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].klebsiellaSp, ModelData().antimicrobials[selection7].klebsiellaSp,
                 ModelData().antimicrobials[selection8].klebsiellaSp, ModelData().antimicrobials[selection9].klebsiellaSp, ModelData().antimicrobials[selection10].klebsiellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].aerococcusSp, ModelData().antimicrobials[selection7].aerococcusSp,
                 ModelData().antimicrobials[selection8].aerococcusSp, ModelData().antimicrobials[selection9].aerococcusSp, ModelData().antimicrobials[selection10].aerococcusSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].bacillusAnthracis, ModelData().antimicrobials[selection7].bacillusAnthracis,
                 ModelData().antimicrobials[selection8].bacillusAnthracis, ModelData().antimicrobials[selection9].bacillusAnthracis, ModelData().antimicrobials[selection10].bacillusAnthracis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].bartonellaHenselae, ModelData().antimicrobials[selection7].bartonellaHenselae,
                 ModelData().antimicrobials[selection8].bartonellaHenselae, ModelData().antimicrobials[selection9].bartonellaHenselae, ModelData().antimicrobials[selection10].bartonellaHenselae].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].brucellaMelitensis, ModelData().antimicrobials[selection7].brucellaMelitensis,
                 ModelData().antimicrobials[selection8].brucellaMelitensis, ModelData().antimicrobials[selection9].brucellaMelitensis, ModelData().antimicrobials[selection10].brucellaMelitensis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].burkholderiacepaciaComplex, ModelData().antimicrobials[selection7].burkholderiacepaciaComplex,
                 ModelData().antimicrobials[selection8].burkholderiacepaciaComplex, ModelData().antimicrobials[selection9].burkholderiacepaciaComplex, ModelData().antimicrobials[selection10].burkholderiacepaciaComplex].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].campylobacterSp, ModelData().antimicrobials[selection7].campylobacterSp,
                 ModelData().antimicrobials[selection8].campylobacterSp, ModelData().antimicrobials[selection9].campylobacterSp, ModelData().antimicrobials[selection10].campylobacterSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].citrobacterSpEsbl, ModelData().antimicrobials[selection7].citrobacterSpEsbl,
                 ModelData().antimicrobials[selection8].citrobacterSpEsbl, ModelData().antimicrobials[selection9].citrobacterSpEsbl, ModelData().antimicrobials[selection10].citrobacterSpEsbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].citrobacterSpKpc, ModelData().antimicrobials[selection7].citrobacterSpKpc,
                 ModelData().antimicrobials[selection8].citrobacterSpKpc, ModelData().antimicrobials[selection9].citrobacterSpKpc, ModelData().antimicrobials[selection10].citrobacterSpKpc].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].citrobacterSpMbl, ModelData().antimicrobials[selection7].citrobacterSpMbl,
                 ModelData().antimicrobials[selection8].citrobacterSpMbl, ModelData().antimicrobials[selection9].citrobacterSpMbl, ModelData().antimicrobials[selection10].citrobacterSpMbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].citrobacterSpOxa, ModelData().antimicrobials[selection7].citrobacterSpOxa,
                 ModelData().antimicrobials[selection8].citrobacterSpOxa, ModelData().antimicrobials[selection9].citrobacterSpOxa, ModelData().antimicrobials[selection10].citrobacterSpOxa].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].corynebacteriumDiphtheriae, ModelData().antimicrobials[selection7].corynebacteriumDiphtheriae,
                 ModelData().antimicrobials[selection8].corynebacteriumDiphtheriae, ModelData().antimicrobials[selection9].corynebacteriumDiphtheriae, ModelData().antimicrobials[selection10].corynebacteriumDiphtheriae].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].corynebacteriumUlcerans, ModelData().antimicrobials[selection7].corynebacteriumUlcerans,
                 ModelData().antimicrobials[selection8].corynebacteriumUlcerans, ModelData().antimicrobials[selection9].corynebacteriumUlcerans, ModelData().antimicrobials[selection10].corynebacteriumUlcerans].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].enterobacterSpKpc, ModelData().antimicrobials[selection7].enterobacterSpKpc,
                 ModelData().antimicrobials[selection8].enterobacterSpKpc, ModelData().antimicrobials[selection9].enterobacterSpKpc, ModelData().antimicrobials[selection10].enterobacterSpKpc].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].enterobacterSpMbl, ModelData().antimicrobials[selection7].enterobacterSpMbl,
                 ModelData().antimicrobials[selection8].enterobacterSpMbl, ModelData().antimicrobials[selection9].enterobacterSpMbl, ModelData().antimicrobials[selection10].enterobacterSpMbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].enterobacterSpOxa, ModelData().antimicrobials[selection7].enterobacterSpOxa,
                 ModelData().antimicrobials[selection8].enterobacterSpOxa, ModelData().antimicrobials[selection9].enterobacterSpOxa, ModelData().antimicrobials[selection10].enterobacterSpOxa].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].enterococcusSpVRE, ModelData().antimicrobials[selection7].enterococcusSpVRE,
                 ModelData().antimicrobials[selection8].enterococcusSpVRE, ModelData().antimicrobials[selection9].enterococcusSpVRE, ModelData().antimicrobials[selection10].enterococcusSpVRE].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].escherichiaColiEsbl, ModelData().antimicrobials[selection7].escherichiaColiEsbl,
                 ModelData().antimicrobials[selection8].escherichiaColiEsbl, ModelData().antimicrobials[selection9].escherichiaColiEsbl, ModelData().antimicrobials[selection10].escherichiaColiEsbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].escherichiaColiKpc, ModelData().antimicrobials[selection7].escherichiaColiKpc,
                 ModelData().antimicrobials[selection8].escherichiaColiKpc, ModelData().antimicrobials[selection9].escherichiaColiKpc, ModelData().antimicrobials[selection10].escherichiaColiKpc].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].escherichiaColiMbl, ModelData().antimicrobials[selection7].escherichiaColiMbl,
                 ModelData().antimicrobials[selection8].escherichiaColiMbl, ModelData().antimicrobials[selection9].escherichiaColiMbl, ModelData().antimicrobials[selection10].escherichiaColiMbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].escherichiaColiOxa, ModelData().antimicrobials[selection7].escherichiaColiOxa,
                 ModelData().antimicrobials[selection8].escherichiaColiOxa, ModelData().antimicrobials[selection9].escherichiaColiOxa, ModelData().antimicrobials[selection10].escherichiaColiOxa].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].hafniaSp, ModelData().antimicrobials[selection7].hafniaSp,
                 ModelData().antimicrobials[selection8].hafniaSp, ModelData().antimicrobials[selection9].hafniaSp, ModelData().antimicrobials[selection10].hafniaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].klebsiellaSpEsbl, ModelData().antimicrobials[selection7].klebsiellaSpEsbl,
                 ModelData().antimicrobials[selection8].klebsiellaSpEsbl, ModelData().antimicrobials[selection9].klebsiellaSpEsbl, ModelData().antimicrobials[selection10].klebsiellaSpEsbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].klebsiellaSpKpc, ModelData().antimicrobials[selection7].klebsiellaSpKpc,
                 ModelData().antimicrobials[selection8].klebsiellaSpKpc, ModelData().antimicrobials[selection9].klebsiellaSpKpc, ModelData().antimicrobials[selection10].klebsiellaSpKpc].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].klebsiellaSpMbl, ModelData().antimicrobials[selection7].klebsiellaSpMbl,
                 ModelData().antimicrobials[selection8].klebsiellaSpMbl, ModelData().antimicrobials[selection9].klebsiellaSpMbl, ModelData().antimicrobials[selection10].klebsiellaSpMbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].klebsiellaSpOxa, ModelData().antimicrobials[selection7].klebsiellaSpOxa,
                 ModelData().antimicrobials[selection8].klebsiellaSpOxa, ModelData().antimicrobials[selection9].klebsiellaSpOxa, ModelData().antimicrobials[selection10].klebsiellaSpOxa].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].mrCons, ModelData().antimicrobials[selection7].mrCons,
                 ModelData().antimicrobials[selection8].mrCons, ModelData().antimicrobials[selection9].mrCons, ModelData().antimicrobials[selection10].mrCons].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].mrSa, ModelData().antimicrobials[selection7].mrSa,
                 ModelData().antimicrobials[selection8].mrSa, ModelData().antimicrobials[selection9].mrSa, ModelData().antimicrobials[selection10].mrSa].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].mrStaphylococcusCapitis, ModelData().antimicrobials[selection7].mrStaphylococcusCapitis,
                 ModelData().antimicrobials[selection8].mrStaphylococcusCapitis, ModelData().antimicrobials[selection9].mrStaphylococcusCapitis, ModelData().antimicrobials[selection10].mrStaphylococcusCapitis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].mrStaphylococcusSaprophyticus, ModelData().antimicrobials[selection7].mrStaphylococcusSaprophyticus,
                 ModelData().antimicrobials[selection8].mrStaphylococcusSaprophyticus, ModelData().antimicrobials[selection9].mrStaphylococcusSaprophyticus, ModelData().antimicrobials[selection10].mrStaphylococcusSaprophyticus].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].msCons, ModelData().antimicrobials[selection7].msCons,
                 ModelData().antimicrobials[selection8].msCons, ModelData().antimicrobials[selection9].msCons, ModelData().antimicrobials[selection10].msCons].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].msSa, ModelData().antimicrobials[selection7].msSa,
                 ModelData().antimicrobials[selection8].msSa, ModelData().antimicrobials[selection9].msSa, ModelData().antimicrobials[selection10].msSa].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].pasteurellaSp, ModelData().antimicrobials[selection7].pasteurellaSp,
                 ModelData().antimicrobials[selection8].pasteurellaSp, ModelData().antimicrobials[selection9].pasteurellaSp, ModelData().antimicrobials[selection10].pasteurellaSp].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].proteusMirabilisEsbl, ModelData().antimicrobials[selection7].proteusMirabilisEsbl,
                 ModelData().antimicrobials[selection8].proteusMirabilisEsbl, ModelData().antimicrobials[selection9].proteusMirabilisEsbl, ModelData().antimicrobials[selection10].proteusMirabilisEsbl].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].staphylococcusCapitis, ModelData().antimicrobials[selection7].staphylococcusCapitis,
                 ModelData().antimicrobials[selection8].staphylococcusCapitis, ModelData().antimicrobials[selection9].staphylococcusCapitis, ModelData().antimicrobials[selection10].staphylococcusCapitis].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].streptococcusAnginosusgroup, ModelData().antimicrobials[selection7].streptococcusAnginosusgroup,
                 ModelData().antimicrobials[selection8].streptococcusAnginosusgroup, ModelData().antimicrobials[selection9].streptococcusAnginosusgroup, ModelData().antimicrobials[selection10].streptococcusAnginosusgroup].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].streptococcusGroupabcg, ModelData().antimicrobials[selection7].streptococcusGroupabcg,
                 ModelData().antimicrobials[selection8].streptococcusGroupabcg, ModelData().antimicrobials[selection9].streptococcusGroupabcg, ModelData().antimicrobials[selection10].streptococcusGroupabcg].max() ?? 0.0,
                [ModelData().antimicrobials[selection6].viridansStreptococci, ModelData().antimicrobials[selection7].viridansStreptococci,
                 ModelData().antimicrobials[selection8].viridansStreptococci, ModelData().antimicrobials[selection9].viridansStreptococci, ModelData().antimicrobials[selection10].viridansStreptococci].max() ?? 0.0
            ]
            
        } else {
            finalArrayScores = [
                ModelData().antimicrobials[selection6].citrobacterBraakii,
                ModelData().antimicrobials[selection6].citrobacterFreundii,
                ModelData().antimicrobials[selection6].achromobacterXylosoxidans,
                ModelData().antimicrobials[selection6].acinetobacterSp,
                ModelData().antimicrobials[selection6].aeromonasDhakensis,
                ModelData().antimicrobials[selection6].aeromonasSp,
                ModelData().antimicrobials[selection6].anaplasmaPhagocytophilum,
                ModelData().antimicrobials[selection6].bacillusSp,
                ModelData().antimicrobials[selection6].bacteroidesSp,
                ModelData().antimicrobials[selection6].bordetellaPertussis,
                ModelData().antimicrobials[selection6].borreliaBurgorferi,
                ModelData().antimicrobials[selection6].burkholderiaPseudomallei,
                ModelData().antimicrobials[selection6].chlamydiaPneumoniae,
                ModelData().antimicrobials[selection6].chlamydiaPsittaci,
                ModelData().antimicrobials[selection6].chlamydiaTrachomatis,
                ModelData().antimicrobials[selection6].citrobacterSp,
                ModelData().antimicrobials[selection6].clostridioidesDifficile,
                ModelData().antimicrobials[selection6].clostridiumPerfringens,
                ModelData().antimicrobials[selection6].corynebacteriumSp,
                ModelData().antimicrobials[selection6].coxiellaBurnetii,
                ModelData().antimicrobials[selection6].cutibacteriumAcnes,
                ModelData().antimicrobials[selection6].ehrlichiaChaffeensis,
                ModelData().antimicrobials[selection6].eikenellaSp,
                ModelData().antimicrobials[selection6].enterobacterSp,
                ModelData().antimicrobials[selection6].enterococcusCasseliflavus,
                ModelData().antimicrobials[selection6].enterococcusFaecalis,
                ModelData().antimicrobials[selection6].enterococcusFaecium,
                ModelData().antimicrobials[selection6].enterococcusGallinarum,
                ModelData().antimicrobials[selection6].enterococcusSp,
                ModelData().antimicrobials[selection6].escherichiaHermanii,
                ModelData().antimicrobials[selection6].francisellaTularensis,
                ModelData().antimicrobials[selection6].fusobacteriumNecrophorum,
                ModelData().antimicrobials[selection6].haemophilusDucreyi,
                ModelData().antimicrobials[selection6].haemophilusInfluenzae,
                ModelData().antimicrobials[selection6].helicobacterPylori,
                ModelData().antimicrobials[selection6].kingellaKingae,
                ModelData().antimicrobials[selection6].klebsiellaAerogenes,
                ModelData().antimicrobials[selection6].legionellaPneumophila,
                ModelData().antimicrobials[selection6].leptospiraInterrogans,
                ModelData().antimicrobials[selection6].listeriaMonocytogenes,
                ModelData().antimicrobials[selection6].moraxellaCatarrhalis,
                ModelData().antimicrobials[selection6].morganellaSp,
                ModelData().antimicrobials[selection6].mycoplasmaGenitalium,
                ModelData().antimicrobials[selection6].mycoplasmaHominis,
                ModelData().antimicrobials[selection6].mycoplasmaPneumoniae,
                ModelData().antimicrobials[selection6].neisseriaGonorrhoeae,
                ModelData().antimicrobials[selection6].neisseriaMeningitidis,
                ModelData().antimicrobials[selection6].nocardiaAbscessus,
                ModelData().antimicrobials[selection6].nocardiaAsteroides,
                ModelData().antimicrobials[selection6].nocardiaCyriacigeorgica,
                ModelData().antimicrobials[selection6].nocardiaFarcinica,
                ModelData().antimicrobials[selection6].nocardiaNova,
                ModelData().antimicrobials[selection6].nocardiaTransvalensis,
                ModelData().antimicrobials[selection6].prevotellaSp,
                ModelData().antimicrobials[selection6].proteusMirabilis,
                ModelData().antimicrobials[selection6].proteusPenneri,
                ModelData().antimicrobials[selection6].proteusVulgaris,
                ModelData().antimicrobials[selection6].providenciaSp,
                ModelData().antimicrobials[selection6].pseudomonasAeruginosa,
                ModelData().antimicrobials[selection6].rickettsiaRickettsi,
                ModelData().antimicrobials[selection6].salmonellaSp,
                ModelData().antimicrobials[selection6].serratiaMarcescens,
                ModelData().antimicrobials[selection6].shigellaSp,
                ModelData().antimicrobials[selection6].staphylococcusSaprophyticus,
                ModelData().antimicrobials[selection6].stenotrophomonasMaltophilia,
                ModelData().antimicrobials[selection6].streptococcusPneumoniae,
                ModelData().antimicrobials[selection6].treponemaPallidum,
                ModelData().antimicrobials[selection6].ureaplasmaParvum,
                ModelData().antimicrobials[selection6].ureaplasmaUrealyticum,
                ModelData().antimicrobials[selection6].vibrioSp,
                ModelData().antimicrobials[selection6].yersiniaEnterocolitica,
                ModelData().antimicrobials[selection6].yersiniaPseudotuberculosis,
                ModelData().antimicrobials[selection6].escherichiaColi,
                ModelData().antimicrobials[selection6].klebsiellaSp,
                ModelData().antimicrobials[selection6].aerococcusSp,
                ModelData().antimicrobials[selection6].bacillusAnthracis,
                ModelData().antimicrobials[selection6].bartonellaHenselae,
                ModelData().antimicrobials[selection6].brucellaMelitensis,
                ModelData().antimicrobials[selection6].burkholderiacepaciaComplex,
                ModelData().antimicrobials[selection6].campylobacterSp,
                ModelData().antimicrobials[selection6].citrobacterSpEsbl,
                ModelData().antimicrobials[selection6].citrobacterSpKpc,
                ModelData().antimicrobials[selection6].citrobacterSpMbl,
                ModelData().antimicrobials[selection6].citrobacterSpOxa,
                ModelData().antimicrobials[selection6].corynebacteriumDiphtheriae,
                ModelData().antimicrobials[selection6].corynebacteriumUlcerans,
                ModelData().antimicrobials[selection6].enterobacterSpKpc,
                ModelData().antimicrobials[selection6].enterobacterSpMbl,
                ModelData().antimicrobials[selection6].enterobacterSpOxa,
                ModelData().antimicrobials[selection6].enterococcusSpVRE,
                ModelData().antimicrobials[selection6].escherichiaColiEsbl,
                ModelData().antimicrobials[selection6].escherichiaColiKpc,
                ModelData().antimicrobials[selection6].escherichiaColiMbl,
                ModelData().antimicrobials[selection6].escherichiaColiOxa,
                ModelData().antimicrobials[selection6].hafniaSp,
                ModelData().antimicrobials[selection6].klebsiellaSpEsbl,
                ModelData().antimicrobials[selection6].klebsiellaSpKpc,
                ModelData().antimicrobials[selection6].klebsiellaSpMbl,
                ModelData().antimicrobials[selection6].klebsiellaSpOxa,
                ModelData().antimicrobials[selection6].mrCons,
                ModelData().antimicrobials[selection6].mrSa,
                ModelData().antimicrobials[selection6].mrStaphylococcusCapitis,
                ModelData().antimicrobials[selection6].mrStaphylococcusSaprophyticus,
                ModelData().antimicrobials[selection6].msCons,
                ModelData().antimicrobials[selection6].msSa,
                ModelData().antimicrobials[selection6].pasteurellaSp,
                ModelData().antimicrobials[selection6].proteusMirabilisEsbl,
                ModelData().antimicrobials[selection6].staphylococcusCapitis,
                ModelData().antimicrobials[selection6].streptococcusAnginosusgroup,
                ModelData().antimicrobials[selection6].streptococcusGroupabcg,
                ModelData().antimicrobials[selection6].viridansStreptococci
            ]
        }
        
        let score1 = vDSP.sum(initialArrayScores)
        let score2 = vDSP.sum(finalArrayScores)
        
        initialSpectrumScore = (score1 / 837) * 100
        finalSpectrumScore = (score2 / 837) * 100
        deltaSpectrumScore = finalSpectrumScore - initialSpectrumScore
        
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
                            
                            if(selection4 != 0){
                                HStack {
                                    Text("Antimicrobial n°5")
                                        .font(.subheadline)
                                    Picker("", selection: $selection5){
                                        ForEach(ModelData().antimicrobials, id:\.id){ item in
                                            Text("\(item.drug)")
                                        }
                                    }.pickerStyle(.menu)
                                }
                            }
                        }
                    }
                }
            }
            
            Divider()
            
            List {
                Text("Choose final antimicrobial therapy")
                HStack {
                    Text("Antimicrobial n°6")
                        .font(.subheadline)
                    Picker("", selection: $selection6){
                        ForEach(ModelData().antimicrobials, id:\.id){ item in
                            Text("\(item.drug)")
                        }
                    }.pickerStyle(.menu)
                }
                
                if(selection6 != 0) {
                    HStack{
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
                        
                        if(selection8 != 0){
                            HStack {
                                Text("Antimicrobial n°9")
                                    .font(.subheadline)
                                Picker("", selection: $selection9){
                                    ForEach(ModelData().antimicrobials, id:\.id){ item in
                                        Text("\(item.drug)")
                                    }
                                }.pickerStyle(.menu)
                            }
                            
                            if(selection9 != 0){
                                HStack {
                                    Text("Antimicrobial n°10")
                                        .font(.subheadline)
                                    Picker("", selection: $selection10){
                                        ForEach(ModelData().antimicrobials, id:\.id){ item in
                                            Text("\(item.drug)")
                                        }
                                    }.pickerStyle(.menu)
                                }
                            }
                            
                        }
                    }
                }
            }
            
            NavigationLink("S3score", destination: FilteredAntimicrobial(selection1: $selection1, selection2: $selection2, selection3: $selection3, selection4: $selection4, selection5: $selection5, selection6: $selection6, selection7: $selection7, selection8: $selection8, selection9: $selection9, selection10: $selection10, initialSpectrumScore: $initialSpectrumScore, finalSpectrumScore: $finalSpectrumScore, deltaSpectrumScore: $deltaSpectrumScore, calc: self.calc))
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                .navigationTitle("Simplified Spectrum Score (S3score)")
                .navigationBarTitleDisplayMode(.inline)
            
            Button {
                selection1 = 0
                selection2 = 0
                selection3 = 0
                selection4 = 0
                selection5 = 0
                selection6 = 0
                selection7 = 0
                selection8 = 0
                selection9 = 0
                selection10 = 0
            } label: {
                Text("Reset")
            }
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)
            
            
        }
        
    }
    
}

struct AntimicrobialList_Previews: PreviewProvider {
    static var previews: some View {
        AntimicrobialList()
            .environmentObject(ModelData())
    }
}

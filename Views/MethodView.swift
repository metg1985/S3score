import SwiftUI

struct MethodView: View {
    
    @State private var currentZoom = 0.0
    @State private var totalZoom = 1.0
    
    var body: some View {
        
        ScrollView {
            Section(header:
                        Text("Methods")
                .font(.title)
                .fontWeight(Font.Weight.bold)
            ){
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("**Database development of bacteria-antibiotics pairs.**\nAntibiotics spectrum ranking was achieved by developing a database harboring pairs of bacteria-antibiotics; the first column of the database included all bacterial species of interest, whereas the first row included all antimicrobial drugs of interest. Regarding the bacterial species of interest, only validly published taxonomic units were used according to the list of prokaryotic names with standing nomenclature. (_Parte, A. C., et al. (2020). List of Prokaryotic names with Standing in Nomenclature (LPSN) moves to the DSMZ. Int J Syst Evol Microbiol 70(11): 5607-5612._)\n")
                        Spacer()
                    }
                    Spacer()
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("**S\u{00B3} score metrics assignment.**\nFor each bacterium, an antimicrobial drug was assigned a score of 0 if it showed no _in vitro_ activity against it, or a score of 1 if there was evidence of _in vitro_ activity [Figure 1]. In an effort of standardization, EUCAST clinical breakpoints and EUCAST’s Expected Resistant Phenotypes were used to assign bacteria-antibiotics scores (see EUCAST website for more informations). Data was extracted from the latest version of each file, namely, EUCAST clinical breakpoints v14 and EUCAST Expected Resistant Phenotypes v1.2. In case a clinical breakpoint was missing, a review of the literature was performed to assess the in vitro activity of the missing values which mainly concerned atypical bacteria such as _Legionella pneumophila_, _Chlamydia_ species and other infrequent or difficult-to-culture bacterial species (see references for further details).\n")
                        Spacer()
                    }
                    Spacer()
                }
                VStack{
                    Spacer()
                    Image("Figure1")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(currentZoom + totalZoom)
                        .gesture(
                            MagnifyGesture()
                                .onChanged { value in
                                    currentZoom = value.magnification - 1
                                }
                                .onEnded { value in
                                    totalZoom += currentZoom
                                    currentZoom = 0
                                }
                        )
                        .accessibilityZoomAction { action in
                            if action.direction == .zoomIn {
                                totalZoom += 1
                            } else {
                                totalZoom -= 1
                            }
                        }
                        .clipped()
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Figure 1. Database conception of S\u{00B3} score iOS® App. Database building included extraction of data from EUCAST Breakpoints v13.1, EUCAST Expected Resistance Phenotypes v1.2 and selected in vitro activity studies (A). Raw table included antimicrobial drugs and their respective documented in vitro activity on all bacterial species of interest, taking into account the number of validly published taxa for each bacterium or row (B). Final database for spectrum score calculation which included the number of validly published taxa multiplied by the binary score (0: inactive, 1: active) for each row (C). Illustration of the final formula computing the S\u{00B3} score stating that in case of combination therapy only the highest value is retained for score calculation to avoid overlapping coverage of antimicrobial drugs (D).")
                            .font(.caption)
                        Spacer()
                    }
                    Spacer()
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("**Mitigating the potential sources of biases with taxa normalization.**\nThe main goal of S\u{00B3} score is to estimate the activity of an antimicrobial drug on a wide range of bacterial species in order to rank them, however mass spectrometry (MALDI-TOF) cannot always identify bacteria to the species level of resolution, and some others are included in complexes (i.e., _Enterobacter cloacae_ complex), which can lead to over/under reporting of bacterial species in the database and be a source of bias. For instance, amoxicillin-clavulanate harbors an activity on anaerobic bacterial species such as _Bacteroides_ whose genus includes 51 validly published species (_Cosson P, Zulianello L, Join-Lambert O, Faurisson F, Gebbie L, Benghezal M, et al. Pseudomonas aeruginosa virulence analyzed in a Dictyostelium discoideum host system. J Bacteriol. 2002;184(11):3027-33._). In this context, not considering the number of species in the _Bacteroides_ genus would lead to a lower-than-expected spectrum score. S\u{00B3} score was developed to mitigate this risk of bias, through the normalization of spectrum scores using the number of validly published taxa for bacterial species. The number of validly published species was used and multiplied to the initial dichotomic spectrum score (0=inactive, 1=active) to calculate the weighted value. Ultimately, all paired bacteria-antibiotics scores were aggregated and divided by the total number of taxa for normalization. As an illustration, the pair _Bacteroides_-amoxicillin-clavulanate would be assigned an individual score of 51 [Figure 1].\n")
                        Spacer()
                    }
                    Spacer()
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("**Antibiotics activity spectrum ranking and local prevalence of resistance.**\nS\u{00B3} score was developed to include the expected phenotypic resistance of bacterial species only, such as it is reported by EUCAST. Local antimicrobial resistance epidemiology would affect spectrum scores and lead to falsely low or high scores depending on the local prevalence. Rather, S\u{00B3} score was developed to be used in combination with the DOOR-MAT (_Wilson BM, Jiang Y, Jump RLP, Viau RA, Perez F, Bonomo RA, et al. Desirability of Outcome Ranking for the Management of Antimicrobial Therapy (DOOR MAT): A Framework for Assessing Antibiotic Selection Strategies in the Presence of Drug Resistance. Clin Infect Dis. 2021;73(2):344-50._) system allowing to compute antimicrobial drug ranking with S\u{00B3} score and desirability outcome based on the local prevalence of antimicrobial resistance. This system had the advantage of being adaptable to any geographic situation without having to change all spectrum scores in the database.\n")
                        Spacer()
                    }
                    Spacer()
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("**Antimicrobial drugs used in combination.**\nAntimicrobial drugs were considered as monotherapy except for aminoglycosides in Gram-positive bacterial species, which are mainly administered in combination to a beta-lactam. In case of combination of antimicrobial drugs, only the maximal value was considered to compute the final S\u{00B3} score to avoid a falsely high spectrum score due to overlapping coverage of bacterial species. The theoretical maximal spectrum score value is 1. Examples are provided in [Figure S1] and [Figure S2].\n")
                        Spacer()
                    }
                    Spacer()
                }
                VStack{
                    Spacer()
                    Image("FigureS1")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(currentZoom + totalZoom)
                        .gesture(
                            MagnifyGesture()
                                .onChanged { value in
                                    currentZoom = value.magnification - 1
                                }
                                .onEnded { value in
                                    totalZoom += currentZoom
                                    currentZoom = 0
                                }
                        )
                        .accessibilityZoomAction { action in
                            if action.direction == .zoomIn {
                                totalZoom += 1
                            } else {
                                totalZoom -= 1
                            }
                        }
                        .clipped()
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Figure S1. Illustration of in-app use of S\u{00B3} score to assess antimicrobial de-escalation (ADE) event in a patient with diverticulitis Hinchey Ia/Ib caused by a sensitive strain of _Escherichia coli_ treated empirically with ceftriaxone and metronidazole. Right part of the figure shows two different outcomes, namely “No de-escalation” if ciprofloxacin and metronidazole are used, or “de-escalation” if co-amoxicillin is used.")
                            .font(.caption)
                        Spacer()
                    }
                    Spacer()
                }
                VStack{
                    Spacer()
                    Image("FigureS2")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(currentZoom + totalZoom)
                        .gesture(
                            MagnifyGesture()
                                .onChanged { value in
                                    currentZoom = value.magnification - 1
                                }
                                .onEnded { value in
                                    totalZoom += currentZoom
                                    currentZoom = 0
                                }
                        )
                        .accessibilityZoomAction { action in
                            if action.direction == .zoomIn {
                                totalZoom += 1
                            } else {
                                totalZoom -= 1
                            }
                        }
                        .clipped()
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Figure S2. Illustration of in-app use of S\u{00B3} score to assess ADE event in a patient with ventilator-associated pneumonia caused by _P. aeruginosa_ treated initially with meropenem, vancomycin and amikacin switched to ciprofloxacin and ceftazidime with its clinical outcome associated, namely “de-escalation”. ")
                            .font(.caption)
                        Spacer()
                    }
                    Spacer()
                }
            }
            .font(.subheadline)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    struct MethodView_Previews: PreviewProvider {
        static var previews: some View {
            MethodView()
        }
    }
}

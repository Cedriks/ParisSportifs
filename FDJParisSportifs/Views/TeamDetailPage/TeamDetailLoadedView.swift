//
//  TeamDetailLoadedView.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import SwiftUI

struct TeamDetailLoadedView: View {
    var team: Team
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                AsyncImage(
                    url: URL(string: team.strTeamBadge!),
                    content:{ image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: UIScreen.main.bounds.height)
                            .opacity(0.15)
                            .padding(.horizontal)
                    },
                    placeholder: {
                       
                    }
                )
                Spacer()
                    .frame(height: 40)
            }
            VStack {
                ScrollView([.vertical]) {
                    if(team.strTeamBanner != nil) {
                        AsyncImage(
                            url: URL(string: team.strTeamBanner!),
                            content:{ image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: UIScreen.main.bounds.width)
                                    .cornerRadius(4)
                                    .padding(.horizontal, 4.0)
                            },
                            placeholder: {
                                Image(systemName: "photo")
                                    .frame(height: 40)
                            }
                        )
                    }
                    Text(team.strCountry ?? "-")
                        .font(.title)
                    Text(team.strLeague ?? "-")
                        .font(.title2)
                    Text(team.strDescriptionEN ?? "-")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.all)
                }
            }
            .navigationTitle(team.strTeam)
        }    }
}

struct TeamDetailLoadedView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailLoadedView(team: Team(
            idTeam: "133702",
            idSoccerXML: "117",
            idAPIfootball: "98",
            intLoved: nil,
            strTeam: "Ajaccio",
            strTeamShort: nil,
            strAlternate: "AC Ajaccio, Athletic Club Aiacciu",
            intFormedYear: "1910",
            strSport: "Soccer",
            strLeague: "French Ligue 1",
            idLeague: "4334",
            strLeague2: "Coupe de France",
            idLeague2: "4484",
            strLeague3: "",
            idLeague3: nil,
            strLeague4: "",
            idLeague4: nil,
            strLeague5: "",
            idLeague5: nil,
            strLeague6: "",
            idLeague6: nil,
            strLeague7: "",
            idLeague7: nil,
            strDivision: nil,
            strManager: "",
            strStadium: "Stade Fran??ois Coty",
            strKeywords: "L'ACA",
            strRSS: "",
            strStadiumThumb: "https://www.thesportsdb.com/images/media/team/stadium/tpspsp1420759508.jpg",
            strStadiumDescription: "Stade Fran??ois Coty is a football stadium in the Corsican city of Ajaccio, France, and the home of AC Ajaccio. Its capacity is 10,660.\r\n\r\nThe stadium was inaugurated on 1 December 1969 under the name Parc des Sports de l'ACA. A crowd of 14,421 was in attendance to see AC Ajaccio defeat SC Bastia in the Corsican derby. Known informally as Timizzolu, the stadium was renovated in 2002 and renamed after Fran??ois Coty, a businessman and far-right politician from Ajaccio. Since 2007, the stadium has undergone substantial improvements to enable it to host Ligue 1 matches.",
            strStadiumLocation: "Ajaccio",
            intStadiumCapacity: "10500",
            strWebsite: "ac-ajaccio.corsica",
            strFacebook: "www.facebook.com/ACAofficiel/",
            strTwitter: "twitter.com/ACAjaccio",
            strInstagram: "www.instagram.com/acajaccio",
            strDescriptionEN: "Athletic Club Ajaccio (Corsican: Athletic Club Aiacciu), commonly referred to as AC Ajaccio, ACA or simply Ajaccio, is a French association football club based in the city of Ajaccio on the island of Corsica. The club was founded in 1910 and plays in Ligue 1. The club president is Christian Leca, and the first-team is coached by manager Olivier Pantaloni, following the sacking of Christian Bracconi in October 2014. Ajaccio play their home matches at the Stade Fran??ois Coty and are rivals with fellow Corsican club Bastia, with whom they contest the Corsica derby (Derby Corse).",
            strDescriptionDE: nil,
            strDescriptionFR: "L'Athletic Club Ajaccio (dont le nom officiel en corse est Athletic Club Aiacciu), couramment abr??g?? en AC Ajaccio ou ACA, est un club de football fran??ais fond?? en 1910. Il est pr??sid?? par Alain Orsoni depuis juillet 2008. L'??quipe premi??re ??volue en Ligue 2 depuis la saison 2014-2015. L'AC Ajaccio a remport?? deux titres de champion de France de Ligue 2 en 1967 et 2002 et un titre de champion de France amateur (National) en 1998. Il dispute ses matches ?? domicile au Stade Fran??ois Coty.",
            strDescriptionCN: nil,
            strDescriptionIT: nil,
            strDescriptionJP: nil,
            strDescriptionRU: nil,
            strDescriptionES: "El Athletic Club Ajaccien (conocido como AC Ajaccio) es un club de f??tbol franc??s, de la ciudad de Ajaccio en la isla de C??rcega. Fue fundado en 1910 y juega en la Ligue 1 del f??tbol franc??s. El club mantiene una tradicional rivalidad con el SC Bastia, tambi??n de la isla, con el que disputa el \"Derbi de C??rcega\".",
            strDescriptionPT: nil,
            strDescriptionSE: nil,
            strDescriptionNL: nil,
            strDescriptionHU: nil,
            strDescriptionNO: nil,
            strDescriptionIL: nil,
            strDescriptionPL: nil,
            strKitColour1: "#ED2228",
            strKitColour2: "#FFFFFF",
            strKitColour3: "",
            strGender: "Male",
            strCountry: "France",
            strTeamBadge: "https://www.thesportsdb.com/images/media/team/badge/qpxvwy1473505505.png",
            strTeamJersey: "https://www.thesportsdb.com/images/media/team/jersey/rk1n921616146043.png",
            strTeamLogo: "https://www.thesportsdb.com/images/media/team/logo/twttqt1420759362.png",
            strTeamFanart1: "https://www.thesportsdb.com/images/media/team/fanart/vsvwpy1420758594.jpg",
            strTeamFanart2: "https://www.thesportsdb.com/images/media/team/fanart/txxrpq1420758610.jpg",
            strTeamFanart3: "https://www.thesportsdb.com/images/media/team/fanart/tqvuqv1420758626.jpg",
            strTeamFanart4: "https://www.thesportsdb.com/images/media/team/fanart/sqrsvu1420759017.jpg",
            strTeamBanner: "https://www.thesportsdb.com/images/media/team/banner/upwrpx1420758932.jpg",
            strYoutube: "www.youtube.com/user/ACAiacciuofficiel",
            strLocked: "unlocked"
        ))
    }
}

//
//  Team.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 08/01/2023.
//

import Foundation

struct Team: Codable, Comparable {
    let idTeam: String
    let idSoccerXML: String?
    let idAPIfootball: String?
    let intLoved: String?
    let strTeam: String
    let strTeamShort: String?
    let strAlternate: String?
    let intFormedYear: String?
    let strSport: String?
    let strLeague: String?
    let idLeague: String?
    let strLeague2: String?
    let idLeague2: String?
    let strLeague3: String?
    let idLeague3: String?
    let strLeague4: String?
    let idLeague4: String?
    let strLeague5: String?
    let idLeague5: String?
    let strLeague6:String?
    let idLeague6: String?
    let strLeague7: String?
    let idLeague7: String?
    let strDivision: String?
    let strManager: String?
    let strStadium: String?
    let strKeywords: String?
    let strRSS: String?
    let strStadiumThumb: String?
    let strStadiumDescription: String?
    let strStadiumLocation: String?
    let intStadiumCapacity: String?
    let strWebsite: String?
    let strFacebook: String?
    let strTwitter: String?
    let strInstagram: String?
    let strDescriptionEN: String?
    let strDescriptionDE: String?
    let strDescriptionFR: String?
    let strDescriptionCN: String?
    let strDescriptionIT: String?
    let strDescriptionJP: String?
    let strDescriptionRU: String?
    let strDescriptionES: String?
    let strDescriptionPT: String?
    let strDescriptionSE: String?
    let strDescriptionNL: String?
    let strDescriptionHU: String?
    let strDescriptionNO: String?
    let strDescriptionIL: String?
    let strDescriptionPL: String?
    let strKitColour1: String?
    let strKitColour2: String?
    let strKitColour3: String?
    let strGender: String?
    let strCountry: String?
    let strTeamBadge: String?
    let strTeamJersey: String?
    let strTeamLogo: String?
    let strTeamFanart1: String?
    let strTeamFanart2: String?
    let strTeamFanart3: String?
    let strTeamFanart4: String?
    let strTeamBanner: String?
    let strYoutube: String?
    let strLocked: String?
    
    
    /// sort anti-alphabetically
    static func < (lhs: Team, rhs: Team) -> Bool {
        lhs.strTeam > rhs.strTeam
    }
    
    static var example: Team = Team(idTeam: "133702",
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
                                    strStadium: "Stade François Coty",
                                    strKeywords: "L'ACA",
                                    strRSS: "",
                                    strStadiumThumb: "https://www.thesportsdb.com/images/media/team/stadium/tpspsp1420759508.jpg",
                                    strStadiumDescription: "Stade François Coty is a football stadium in the Corsican city of Ajaccio, France, and the home of AC Ajaccio. Its capacity is 10,660.\r\n\r\nThe stadium was inaugurated on 1 December 1969 under the name Parc des Sports de l'ACA. A crowd of 14,421 was in attendance to see AC Ajaccio defeat SC Bastia in the Corsican derby. Known informally as Timizzolu, the stadium was renovated in 2002 and renamed after François Coty, a businessman and far-right politician from Ajaccio. Since 2007, the stadium has undergone substantial improvements to enable it to host Ligue 1 matches.",
                                    strStadiumLocation: "Ajaccio",
                                    intStadiumCapacity: "10500",
                                    strWebsite: "ac-ajaccio.corsica",
                                    strFacebook: "www.facebook.com/ACAofficiel/",
                                    strTwitter: "twitter.com/ACAjaccio",
                                    strInstagram: "www.instagram.com/acajaccio",
                                    strDescriptionEN: "Athletic Club Ajaccio (Corsican: Athletic Club Aiacciu), commonly referred to as AC Ajaccio, ACA or simply Ajaccio, is a French association football club based in the city of Ajaccio on the island of Corsica. The club was founded in 1910 and plays in Ligue 1. The club president is Christian Leca, and the first-team is coached by manager Olivier Pantaloni, following the sacking of Christian Bracconi in October 2014. Ajaccio play their home matches at the Stade François Coty and are rivals with fellow Corsican club Bastia, with whom they contest the Corsica derby (Derby Corse).",
                                    strDescriptionDE: nil,
                                    strDescriptionFR: "L'Athletic Club Ajaccio (dont le nom officiel en corse est Athletic Club Aiacciu), couramment abrégé en AC Ajaccio ou ACA, est un club de football français fondé en 1910. Il est présidé par Alain Orsoni depuis juillet 2008. L'équipe première évolue en Ligue 2 depuis la saison 2014-2015. L'AC Ajaccio a remporté deux titres de champion de France de Ligue 2 en 1967 et 2002 et un titre de champion de France amateur (National) en 1998. Il dispute ses matches à domicile au Stade François Coty.",
                                    strDescriptionCN: nil,
                                    strDescriptionIT: nil,
                                    strDescriptionJP: nil,
                                    strDescriptionRU: nil,
                                    strDescriptionES: "El Athletic Club Ajaccien (conocido como AC Ajaccio) es un club de fútbol francés, de la ciudad de Ajaccio en la isla de Córcega. Fue fundado en 1910 y juega en la Ligue 1 del fútbol francés. El club mantiene una tradicional rivalidad con el SC Bastia, también de la isla, con el que disputa el \"Derbi de Córcega\".",
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
                                    strLocked: "unlocked")
}

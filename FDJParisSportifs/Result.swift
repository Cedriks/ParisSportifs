//
//  Result.swift
//  FDJParisSportifs
//
//  Created by Cedrik on 06/01/2023.
//

import Foundation

enum LoadingState {
    case loading, loaded, failed
}

struct Result: Codable {
    let leagues: [League]?
    let teams: [Team]?
}
struct League: Codable {
    let idLeague: String
    let strLeague: String?
    let strSport: String?
    let strLeagueAlternate: String?
    
    static var example: League = League(idLeague: "12345",
                                        strLeague: "strLeague",
                                        strSport: "strSport",
                                        strLeagueAlternate: "strLeagueAlternate")
}
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

/*
"teams": [
        {
            "idTeam": "133714",
            "idSoccerXML": "131",
            "idAPIfootball": "85",
            "intLoved": null,
            "strTeam": "Paris SG",
            "strTeamShort": null,
            "strAlternate": "Paris Saint-Germain, PSG, Paris Saint Germain",
            "intFormedYear": "1970",
            "strSport": "Soccer",
            "strLeague": "French Ligue 1",
            "idLeague": "4334",
            "strLeague2": "Coupe de France",
            "idLeague2": "4484",
            "strLeague3": "UEFA Champions League",
            "idLeague3": "4480",
            "strLeague4": "French Trophée des Champions",
            "idLeague4": "4901",
            "strLeague5": "",
            "idLeague5": null,
            "strLeague6": "",
            "idLeague6": null,
            "strLeague7": "",
            "idLeague7": null,
            "strDivision": null,
            "strManager": "",
            "strStadium": "Parc des Princes",
            "strKeywords": "Les Parisiens",
            "strRSS": "",
            "strStadiumThumb": "https://www.thesportsdb.com/images/media/team/stadium/uwuptx1420577306.jpg",
            "strStadiumDescription": "The Parc des Princes (literally \"Park of the Princes\" or \"Princes' Park\" in English) is an all-seater football stadium located in the southwest of Paris, France. The venue, with a seating capacity of 48,712 spectators, has been the home of French football club Paris Saint-Germain since 1973. The current Parc des Princes was inaugurated on 4 June 1972, endowed with very avant-garde architecture for the period. Comfort and visibility were the key words of project architects Roger Taillibert and Siavash Teimouri. PSG became the resident club of the new stadium in June 1973 and its image and history has since been associated to Le Parc. Named after the Monarch's hunting grounds that it sits on, it was initially opened as a multi-purpose venue on 18 July 1897.\r\n\r\nThe Parc des Princes is the fourth largest football stadium in France. Originally a velodrome, it was the finish line of the Tour de France from the first event in 1903 until General Charles de Gaulle ordered the track demolished in the late 1960s. He decided in 1967 that the Parc des Princes should be dedicated to football and rugby games with a capacity of under 60,000 seats. The Parc des Princes was the national stadium of the France football team and the France rugby union team until the construction of the Stade de France for the 1998 FIFA World Cup. The stadium and grounds are owned by the Paris city council and the Société d’Exploitation Sports-Evénements (SESE) holds the concession to the Parc des Princes since 1990.\r\n\r\nInitially a multi-task sports venue at first, it has hosted many major sports events. Le Parc was an Olympic site in the 1900 Games of the II Olympiad and hosted games in two FIFA World Cups. The stadium has also been the venue for two Euro finals, three UEFA Champions League finals, two UEFA Cup finals, one UEFA Cup Winners' Cup final, two Latin Cup finals, four USFSA championship finals, one Coupe Sheriff Dewar final, 33 French Cup finals, three League Cup finals, 30 Tournoi de Paris editions and 31 Top 14 finals. The ground has also hosted 128 football matches for the French national team, 59 Five Nations Championships games, one UCI Track Cycling World Championships and 54 Tour de France finishes. The stadium also witnessed the first live sports report in France and has even hosted boxing championships and music concerts. In recent times, the Parc des Princes has refocused on more medium-sized events as compared to the larger Stade de France.",
            "strStadiumLocation": "Paris, France",
            "intStadiumCapacity": "47929",
            "strWebsite": "www.psg.fr",
            "strFacebook": "www.facebook.com/PSG",
            "strTwitter": "twitter.com/PSG_inside",
            "strInstagram": "instagram.com/psg",
            "strDescriptionEN": "Paris Saint-Germain Football Club, commonly referred to as Paris Saint-Germain, Paris SG, or simply Paris or PSG, is a French professional football club based in Paris. Founded in 1970, the club has traditionally worn red, blue and white kits. PSG has played their home matches in the 47,929-capacity Parc des Princes, in the 16th arrondissement of Paris, since 1974. The club plays in the highest tier of French football, Ligue 1.\r\n\r\nThe Parisian club established itself as a major force in France, and one of the major forces of European football in the 2010s. PSG have won 40 titles, making it the most successful French club in history by this measure. PSG are also the club with most consecutive seasons playing in the top-flight (they have been in Ligue 1 for 46 seasons since 1974), one of only two French clubs to have won a major European title, the most popular football club in France, and one of the most widely supported teams in the world.\r\n\r\nDomestically, the Parisians have won eight Ligue 1 titles, a record twelve Coupe de France, a record eight Coupe de la Ligue, and a record nine Trophée des Champions titles. In European football, they have won one UEFA Cup Winners' Cup and one UEFA Intertoto Cup. The capital club has also won one Ligue 2, regarded as a minor official title. PSG have a long-standing rivalry with Olympique de Marseille. The duo contest French football's most notorious match, known as Le Classique.\r\n\r\nThe State of Qatar, through its shareholding organisation Qatar Sports Investments (QSI), has been the club's owner since 2011. The takeover made Paris Saint-Germain the richest club in France and one of the wealthiest in the world. As of the 2018–19 season, PSG have the fifth-highest revenue in the footballing world with an annual revenue of €636m according to Deloitte, and are the world's eleventh most valuable football club, worth €825m according to Forbes.",
            "strDescriptionDE": null,
            "strDescriptionFR": "Le Paris Saint-Germain Football Club (couramment abrégé en Paris SG ou PSG) est un club de football français basé à Paris, issu de la fusion en 1970 du Stade Saint-Germain, fondé en 1904, et du Paris FC fondé en 1969.\r\n\r\nPrésent en première division depuis 1974, le Paris SG est depuis 2007 le club français y évoluant depuis le plus longtemps sans discontinuité : la saison 2014-2015 est sa 41e saison consécutive dans l'élite. Le club a remporté quatre titres de champion de France en 1986, 1994, 2013 et 2014, huit Coupes de France, quatre Coupes de la Ligue et une Coupe d'Europe des vainqueurs de coupe en 1996, la seule remportée par un club français. Malgré sa jeune existence, ses performances européennes lui valent d'apparaître au troisième rang français (et 49e rang européen) du classement des clubs de football du XXe siècle selon l'IFFHS.\r\n\r\nLe Paris Saint-Germain joue à domicile au Parc des Princes, depuis juillet 1974, et s'entraîne au Centre d'entraînement Ooredoo à Saint-Germain-en-Laye, un lieu hérité du Stade Saint-Germain. Dirigé par Daniel Hechter puis Francis Borelli, le club est racheté en 1991 par le diffuseur du championnat, Canal+, qui mène le club parisien à un certain succès pendant ses premières années. En 2006, le PSG devient la propriété du fonds d'investissement américain Colony Capital, intéressé à la future rénovation du Parc des Princes. En 2011 et 2012, le Qatar Sports Investments, fonds d'investissement souverain de l’émirat du Qatar, rachète à son tour le club, lui apportant des moyens financiers considérables et en fait une des sections du nouveau club omnisports du Paris Saint-Germain. Nasser Al-Khelaïfi devient le président du conseil de surveillance.",
            "strDescriptionCN": null,
            "strDescriptionIT": "Il Paris Saint-Germain Football Club (pronuncia francese: /paʁi sɛ̃ ʒɛʁmɛ̃/), meglio conosciuto come Paris Saint-Germain o più semplicemente con la sigla PSG, è una società calcistica francese con sede a Parigi e a Saint-Germain-en-Laye.\r\n\r\nFondato nel 1970 a seguito della fusione tra il Paris FC e lo Stade Saint-Germain per opera della Federazione calcistica francese con lo scopo di colmare l'assenza di una squadra parigina nella massima serie nazionale, il club partecipa ininterrottamente alla Ligue 1 dalla stagione 1974-1975, ed è diventata la prima squadra francese a disputare più di 44 edizioni consecutive del massimo campionato francese, superando il precedente record del Nantes, che ne aveva disputate ininterrottamente 44 dal 1963 al 2007.\r\n\r\nDal 1974 la squadra disputa le partite interne nel Parc des Princes, stanziato nel XVI arrondissement di Parigi. L'impianto utilizzato in precedenza, il Camp des Loges, ospita le partite delle selezioni minori del PSG e gli allenamenti della squadra maggiore. Come degna rappresentante della Ville Lumière, i colori sociali del club sono il blu, il rosso e il bianco, gli stessi della bandiera di Parigi. Fin dalla fondazione, il completo tradizionale del club è una maglietta di colore blu con una barra rossa al centro incorniciata da due linee bianche. Lo stemma invece rappresenta la Tour Eiffel stilizzata, sotto la quale c’è il fleur de lys (giglio), simbolo della città di Saint-Germain e della monarchia francese.\r\n\r\nNel suo palmarès annovera 42 titoli nazionali — 9 campionati, 14 Coppe nazionali, 9 Coppe di Lega e 10 Supercoppe — che ne fanno il club più titolato di Francia davanti a Olympique Marsiglia (25) e Saint-Étienne (22). A livello internazionale vanta invece una Coppe delle Coppe (vinta nel 1996) ed una Coppa Intertoto UEFA, che pone il PSG a pari merito con l'OM nella classifica dei club francesi per numero di vittorie in competizioni internazionali (2). Proprio con la formazione marsigliese sussiste la più accesa rivalità del calcio francese, denominata Le Classique. Nel 1994 il PSG fu nominato Squadra mondiale dell'anno dall'IFFHS.",
            "strDescriptionJP": null,
            "strDescriptionRU": null,
            "strDescriptionES": null,
            "strDescriptionPT": null,
            "strDescriptionSE": null,
            "strDescriptionNL": null,
            "strDescriptionHU": null,
            "strDescriptionNO": null,
            "strDescriptionIL": null,
            "strDescriptionPL": null,
            "strKitColour1": "",
            "strKitColour2": "",
            "strKitColour3": "",
            "strGender": "Male",
            "strCountry": "France",
            "strTeamBadge": "https://www.thesportsdb.com/images/media/team/badge/rwqrrq1473504808.png",
            "strTeamJersey": "https://www.thesportsdb.com/images/media/team/jersey/fkrql41625580666.png",
            "strTeamLogo": "https://www.thesportsdb.com/images/media/team/logo/dyxou41548937710.png",
            "strTeamFanart1": "https://www.thesportsdb.com/images/media/team/fanart/tptpwt1420506492.jpg",
            "strTeamFanart2": "https://www.thesportsdb.com/images/media/team/fanart/xquwpt1420576819.jpg",
            "strTeamFanart3": "https://www.thesportsdb.com/images/media/team/fanart/rrrqtp1420504434.jpg",
            "strTeamFanart4": "https://www.thesportsdb.com/images/media/team/fanart/wxsuqt1420576885.jpg",
            "strTeamBanner": "https://www.thesportsdb.com/images/media/team/banner/wvaw7l1641382901.jpg",
            "strYoutube": "www.youtube.com/user/PSGofficiel",
            "strLocked": "unlocked"
        }
 ]*/

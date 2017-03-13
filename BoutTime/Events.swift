//
//  Events.swift
//  BoutTime
//
//  Created by Nathan Fulkerson on 9/26/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation
import GameKit

struct Event {
    let title: String
    let eventInfoURI: String
    let eventDate: Int
}
// Extend Event type so we can see if we are already using that event somewhere.
extension Event: Equatable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.title == rhs.title
    }
}

enum EventError: Error {
    case InvalidTitle
    case InvalidDate
    case InvalidURL
    case EventMissing
}

struct EventData {
    // Significant events in computing from 1835 to present.
    
    let events: [Event] = [
        Event(title: "Charles Babbage begins work on Analytical Engine.", eventInfoURI: "https://en.wikipedia.org/wiki/Analytical_Engine", eventDate: 1835),
        Event(title: "Ada Lovelace creates first computer program.", eventInfoURI: "https://en.wikipedia.org/wiki/Ada_Lovelace#First_computer_program", eventDate: 1842),
        Event(title: "Alan Turing publishes principles of modern computing.", eventInfoURI: "https://en.wikipedia.org/wiki/Alan_Turing#University_and_work_on_computability", eventDate: 1936),
        Event(title: "Konrad Zuse creates the Z2 electromechanical relay computer.", eventInfoURI: "https://en.wikipedia.org/wiki/Konrad_Zuse#The_Z2.2C_Z3.2C_and_Z4", eventDate: 1939),
        Event(title: "British crpytologists develop device to decrypt German Enigma Machine messages during WWII.", eventInfoURI: "https://en.wikipedia.org/wiki/Bombe", eventDate: 1939),
        Event(title: "IBM creates the Harvard Mark I general purpose computer.", eventInfoURI: "https://en.wikipedia.org/wiki/Harvard_Mark_I", eventDate: 1944),
        Event(title: "Alan Turing develops the Turing Test to measure human and computer intelligence.", eventInfoURI: "https://en.wikipedia.org/wiki/Turing_test", eventDate: 1950),
        Event(title: "UNIVAC, the first commercially successful computer, is delivered to the U.S. Bureau of Census.", eventInfoURI: "https://en.wikipedia.org/wiki/UNIVAC_I", eventDate: 1951),
        Event(title: "Oldest known recording of computer generated music played by the Ferranti Mark 1.", eventInfoURI: "https://en.wikipedia.org/wiki/Ferranti_Mark_1#Computer_music", eventDate: 1951),
        Event(title: "FORTRAN development begins.", eventInfoURI: "https://en.wikipedia.org/wiki/Fortran", eventDate: 1954),
        Event(title: "First conference on artificial intelligence held at Dartmouth College.", eventInfoURI: "https://en.wikipedia.org/wiki/Artificial_intelligence", eventDate: 1956),
        Event(title: "First dot matrix printer marketed by IBM.", eventInfoURI: "https://en.wikipedia.org/wiki/Dot_matrix_printing", eventDate: 1957),
        Event(title: "Development on LISP programming language begins.", eventInfoURI: "https://en.wikipedia.org/wiki/Lisp_(programming_language)", eventDate: 1958),
        Event(title: "COBOL developed by Grace Murray Hopper.", eventInfoURI: "https://en.wikipedia.org/wiki/COBOL", eventDate: 1959),
        Event(title: "ALGOL, the first structured, procedural programming language, released.", eventInfoURI: "https://en.wikipedia.org/wiki/ALGOL", eventDate: 1960),
        Event(title: "Spacewar!, an early computer game, written by MIT student Steve Russell.", eventInfoURI: "https://en.wikipedia.org/wiki/Spacewar!", eventDate: 1962),
        Event(title: "First prototype of a computer mouse created by Douglas Engelbart.", eventInfoURI: "http://www.macworld.com/article/1137400/input-devices/mouse40.html", eventDate: 1963),
        Event(title: "IBM System/360 launches--the first business and scientific computer, and notable for using 8-bit bytes.", eventInfoURI: "https://en.wikipedia.org/wiki/IBM_System/360", eventDate: 1964),
        Event(title: "Moore's Law, an observation that processor complexity doubled every year, published by Gordon Moore.", eventInfoURI: "https://en.wikipedia.org/wiki/Moore%27s_law", eventDate: 1965),
        Event(title: "Hewlett-Packard enters the general purpose computer market.", eventInfoURI: "https://en.wikipedia.org/wiki/Hewlett-Packard", eventDate: 1966),
        Event(title: "The floppy disk is invented at IBM.", eventInfoURI: "https://en.wikipedia.org/wiki/Floppy_disk", eventDate: 1967),
        Event(title: "Intel is founded.", eventInfoURI: "https://en.wikipedia.org/wiki/Intel", eventDate: 1968),
        Event(title: "ARPANET, the original basis of the Internet, begins.", eventInfoURI: "https://en.wikipedia.org/wiki/ARPANET", eventDate: 1969),
        Event(title: "The first Request for Comments, RFC 1 published.", eventInfoURI: "https://en.wikipedia.org/wiki/Request_for_Comments", eventDate: 1969),
        Event(title: "First dynamic RAM chip introduced by Intel.", eventInfoURI: "https://en.wikipedia.org/wiki/Dynamic_random-access_memory#History", eventDate: 1970),
        Event(title: "First program able to send e-mail messages between computers developed.", eventInfoURI: "https://en.wikipedia.org/wiki/Email#ARPANET_mail", eventDate: 1971),
        Event(title: "Atari founded and Pong released.", eventInfoURI: "https://en.wikipedia.org/wiki/Atari", eventDate: 1972),
        Event(title: "The first international connections to ARPANET are established.", eventInfoURI: "https://en.wikipedia.org/wiki/ARPANET", eventDate: 1972),
        Event(title: "Development of TCP/IP internet protocols begins.", eventInfoURI: "https://en.wikipedia.org/wiki/Internet_protocol_suite", eventDate: 1973),
        Event(title: "Ethernet developed, enabling machines to be connected together in a LAN.", eventInfoURI: "https://en.wikipedia.org/wiki/Ethernet", eventDate: 1973),
        Event(title: "Introduction of the Intel 8080.", eventInfoURI: "https://en.wikipedia.org/wiki/Intel_8080", eventDate: 1974),
        Event(title: "Microsoft formed by Bill Gates and Paul Allen.", eventInfoURI: "https://en.wikipedia.org/wiki/Microsoft", eventDate: 1975),
        Event(title: "The MITS Altair 8800, the first commercially successful hobby computer, is released", eventInfoURI: "https://en.wikipedia.org/wiki/Altair_8800", eventDate: 1975),
        Event(title: "Apple Computer, Inc. founded to market the Apple I.", eventInfoURI: "https://en.wikipedia.org/wiki/Apple_Inc.", eventDate: 1976),
        Event(title: "Z80 chip released by Zilog. This chip was the foundation of many computers, like the Tandy TRS-80 and Sinclair ZX Spectrum.", eventInfoURI: "https://en.wikipedia.org/wiki/Zilog_Z80", eventDate: 1976),
        Event(title: "Commodore introduces the Commodore PET.", eventInfoURI: "https://en.wikipedia.org/wiki/Commodore_PET", eventDate: 1977),
        Event(title: "Apple II computer released.", eventInfoURI: "https://en.wikipedia.org/wiki/Apple_II", eventDate: 1977),
        Event(title: "Introduction of the first x86 processor, the 16-bit Intel 8086.", eventInfoURI: "https://en.wikipedia.org/wiki/Intel_8086", eventDate: 1978),
        Event(title: "Space Invaders released.", eventInfoURI: "https://en.wikipedia.org/wiki/Space_Invaders", eventDate: 1978),
        Event(title: "Programming language, Ada, introduced for US DOD.", eventInfoURI: "https://en.wikipedia.org/wiki/Ada_(programming_language)", eventDate: 1979),
        Event(title: "Compact disc invented.", eventInfoURI: "https://en.wikipedia.org/wiki/Compact_disc", eventDate: 1979),
        Event(title: "Disgruntled Atari programmers found Activision, the first 3rd-party game publisher.", eventInfoURI: "https://en.wikipedia.org/wiki/Activision", eventDate: 1979),
        Event(title: "Sinclair ZX80 released.", eventInfoURI: "https://en.wikipedia.org/wiki/ZX80", eventDate: 1980),
        Event(title: "Richard Feynman proposes quantum computing.", eventInfoURI: "https://en.wikipedia.org/wiki/Quantum_computing", eventDate: 1981),
        Event(title: "MS-DOS version 1.0 released.", eventInfoURI: "https://en.wikipedia.org/wiki/MS-DOS", eventDate: 1981),
        Event(title: "Commodore 64 unveiled and released later this year.", eventInfoURI: "https://en.wikipedia.org/wiki/Commodore_64", eventDate: 1982),
        Event(title: "Microsoft Word released.", eventInfoURI: "https://en.wikipedia.org/wiki/Microsoft_Word", eventDate: 1983),
        Event(title: "Apple introduces the Lisa, a sluggish $10,000 computer.", eventInfoURI: "https://en.wikipedia.org/wiki/Apple_Lisa", eventDate: 1983),
        Event(title: "Richard Stallman announces the GNU Project, a major stepstone in the free open souce software (FOSS) movement.", eventInfoURI: "https://en.wikipedia.org/wiki/GNU_Project", eventDate: 1983),
        Event(title: "Hewlett-Packard releases the LaserJet printer.", eventInfoURI: "https://en.wikipedia.org/wiki/HP_LaserJet", eventDate: 1984),
        Event(title: "Apple Macintosh released.", eventInfoURI: "https://en.wikipedia.org/wiki/Macintosh", eventDate: 1984),
        Event(title: "Tetris written by Alexey Pazhitnov.", eventInfoURI: "https://en.wikipedia.org/wiki/Tetris", eventDate: 1985),
        Event(title: "Commodore releases the Amiga.", eventInfoURI: "https://en.wikipedia.org/wiki/Amiga", eventDate: 1985),
        Event(title: "Microsoft Windows launched.", eventInfoURI: "https://en.wikipedia.org/wiki/Microsoft_Windows", eventDate: 1985),
        Event(title: "Macintosh II released.", eventInfoURI: "https://en.wikipedia.org/wiki/Macintosh_II", eventDate: 1987),
        Event(title: "OS/2 released by Microsoft and IBM.", eventInfoURI: "https://en.wikipedia.org/wiki/OS/2", eventDate: 1987),
        Event(title: "Adobe Photoshop created.", eventInfoURI: "https://en.wikipedia.org/wiki/Adobe_Photoshop", eventDate: 1988),
        Event(title: "World Wide Web invented by Tim Berners-Lee at CERN.", eventInfoURI: "https://en.wikipedia.org/wiki/World_Wide_Web", eventDate: 1989),
        Event(title: "Windows 3.0 released.", eventInfoURI: "https://en.wikipedia.org/wiki/Windows_3.0", eventDate: 1990),
        Event(title: "Linux kernel is born, created by Linus Torvalds, then a Finnish college student.", eventInfoURI: "https://en.wikipedia.org/wiki/Linux_kernel", eventDate: 1991),
        Event(title: "'Windows NT addresses 2 Gigabytes of RAM, which is more than any application will ever need.' - Microsoft", eventInfoURI: "https://en.wikipedia.org/wiki/Windows_NT", eventDate: 1992),
        Event(title: "Wolfenstein 3D released by id Software.", eventInfoURI: "https://en.wikipedia.org/wiki/Wolfenstein_3D", eventDate: 1992),
        Event(title: "MP3 file format created.", eventInfoURI: "https://en.wikipedia.org/wiki/MP3", eventDate: 1993),
        Event(title: "Netscape Navigator 1.0 released.", eventInfoURI: "https://en.wikipedia.org/wiki/Netscape_Navigator", eventDate: 1994),
        Event(title: "Windows 95 released.", eventInfoURI: "https://en.wikipedia.org/wiki/Windows_95", eventDate: 1995),
        Event(title: "Sony releases the Playstation.", eventInfoURI: "https://en.wikipedia.org/wiki/PlayStation", eventDate: 1995),
        Event(title: "Netscape announces development of JavaScript.", eventInfoURI: "https://en.wikipedia.org/wiki/JavaScript", eventDate: 1995),
        Event(title: "Netscape Navigator 2.0, the first browser to support JavaScript, released.", eventInfoURI: "https://en.wikipedia.org/wiki/Netscape_Navigator", eventDate: 1996),
        Event(title: "Hotmail released on July 4, representing freedom from ISP-based email.", eventInfoURI: "https://en.wikipedia.org/wiki/Outlook.com", eventDate: 1996),
        Event(title: "IBM's Deep Blue becomes first computer to beat reigning World Chess Champion.", eventInfoURI: "https://en.wikipedia.org/wiki/Deep_Blue_(chess_computer)", eventDate: 1997),
        Event(title: "Apple announces the iMac, an all-in-one computer designed by Jonathan Ive.", eventInfoURI: "https://en.wikipedia.org/wiki/IMac", eventDate: 1998),
        Event(title: "RSA Security, Inc. releases the RSA algorithm into public domain.", eventInfoURI: "https://en.wikipedia.org/wiki/RSA_(cryptosystem)", eventDate: 2000),
        Event(title: "Apple releases Mac OS X, derived from the NeXTSTEP OS.", eventInfoURI: "https://en.wikipedia.org/wiki/MacOS", eventDate: 2001),
        Event(title: "Microsoft releases Windows XP.", eventInfoURI: "https://en.wikipedia.org/wiki/Windows_XP", eventDate: 2001),
        Event(title: "RIM releases the first BlackBerry smartphone.", eventInfoURI: "https://en.wikipedia.org/wiki/BlackBerry", eventDate: 2002),
        Event(title: "First release of the Ubuntu Linux distribution.", eventInfoURI: "https://en.wikipedia.org/wiki/Ubuntu_(operating_system)", eventDate: 2004),
        Event(title: "Mozilla Firefox 1.0 releaed.", eventInfoURI: "https://en.wikipedia.org/wiki/Firefox", eventDate: 2004),
        Event(title: "Apple announces use of Intel-based processors.", eventInfoURI: "http://www.apple.com/pr/library/2005/06/06Apple-to-Use-Intel-Microprocessors-Beginning-in-2006.html", eventDate: 2005),
        Event(title: "Microsoft releases the Xbox 360.", eventInfoURI: "https://en.wikipedia.org/wiki/Xbox_360", eventDate: 2005),
        Event(title: "Apple introduces the MacBook Pro.", eventInfoURI: "https://en.wikipedia.org/wiki/MacBook_Pro", eventDate: 2006),
        Event(title: "Sony releases the Playstation 3.", eventInfoURI: "https://en.wikipedia.org/wiki/PlayStation_3", eventDate: 2006),
        Event(title: "Nintendo releases the Wii.", eventInfoURI: "https://en.wikipedia.org/wiki/Wii", eventDate: 2006),
        Event(title: "iPhone introduced by Apple.", eventInfoURI: "http://en.wikipedia.org/wiki/iPhone", eventDate: 2007),
        Event(title: "First public beta of Google Chrome.", eventInfoURI: "https://en.wikipedia.org/wiki/Google_Chrome", eventDate: 2008),
        Event(title: "First version of Android introduced by Google.", eventInfoURI: "https://en.wikipedia.org/wiki/Android_(operating_system)", eventDate: 2008),
        Event(title: "The online cryptocurrency Bitcoin is released.", eventInfoURI: "https://en.wikipedia.org/wiki/Bitcoin", eventDate: 2009),
        Event(title: "Microsoft releases Windows 7.", eventInfoURI: "https://en.wikipedia.org/wiki/Windows_7", eventDate: 2009),
        Event(title: "Apple releases Mac OS X Snow Leopard.", eventInfoURI: "https://en.wikipedia.org/wiki/Mac_OS_X_Snow_Leopard", eventDate: 2009),
        Event(title: "Apple releases the iPad.", eventInfoURI: "https://en.wikipedia.org/wiki/IPad", eventDate: 2010),
        Event(title: "The first Chromebooks go on sale.", eventInfoURI: "https://en.wikipedia.org/wiki/Chromebook", eventDate: 2011),
        Event(title: "Raspberry Pi, a low-cost, credit card sized computer, is released.", eventInfoURI: "https://en.wikipedia.org/wiki/Raspberry_Pi", eventDate: 2012),
        Event(title: "Scientists at MIT create a quantum computer potentially capable of cracking modern encryption techniques.", eventInfoURI: "http://www.pcworld.com/article/3041115/security/mits-new-5-atom-quantum-computer-could-transform-encryption.html", eventDate: 2016)
    ]
    /**
     Retrieves a random event from the EventList data source.
     
     - Returns: An object of type Event.
     */
    func getRandomEvent() -> Event {
        let randomIndex = getRandomIndex()
        return events[randomIndex]
    }
    
    private func getRandomIndex() -> Int {
        return GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
    }
}



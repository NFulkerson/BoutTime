//
//  Events.swift
//  BoutTime
//
//  Created by Nathan Fulkerson on 9/26/16.
//  Copyright © 2016 Nathan Fulkerson. All rights reserved.
//

import Foundation

struct Event {
    let title: String
    let eventInfoURI: String
    let eventDate: Date
}

let eventList: [Event] = [
    Event(title: "Nintendo founded", eventInfoURI: "https://en.wikipedia.org/wiki/Nintendo", eventDate: Date(timeIntervalSince1970: -2533161600)),
    Event(title: "Atari 2600 released.", eventInfoURI: "https://en.wikipedia.org/wiki/Atari_2600", eventDate: Date(timeIntervalSince1970: 242827200)),
    Event(title: "NeXT, Inc. founded by Steve Jobs.", eventInfoURI: "https://en.wikipedia.org/wiki/NeXT", eventDate: Date(timeIntervalSince1970: 476625600))
]

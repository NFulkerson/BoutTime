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
    let eventDate: Date
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
    // keep track of which events are returned so only unique events
    // are presented.
    // we could reset this if the count has reached four, as that would mean
    // our view were properly set up.
    // we might even be able to deliver all four events in one request and handle it all on the data side.
    var currentEvents: [Event] = []
    
    let events: [Event] = [
        Event(title: "Nintendo founded", eventInfoURI: "https://en.wikipedia.org/wiki/Nintendo", eventDate: Date(timeIntervalSince1970: -2533161600)),
        Event(title: "Atari 2600 released.", eventInfoURI: "https://en.wikipedia.org/wiki/Atari_2600", eventDate: Date(timeIntervalSince1970: 242827200)),
        Event(title: "NeXT, Inc. founded by Steve Jobs.", eventInfoURI: "https://en.wikipedia.org/wiki/NeXT", eventDate: Date(timeIntervalSince1970: 476625600)),
        Event(title: "Angry Birds released.", eventInfoURI: "https://en.wikipedia.org/wiki/Angry_Birds", eventDate: Date(timeIntervalSince1970: 1259668800)),
        Event(title: "Apple's App Store reaches 10 billion downloads.", eventInfoURI: "https://www.cnet.com/news/apple-app-store-reaches-10-billion-downloads/", eventDate: Date(timeIntervalSince1970: 1295710200)),
        Event(title: "iOS App Store becomes available.", eventInfoURI: "https://en.wikipedia.org/wiki/App_Store_(iOS)", eventDate: Date(timeIntervalSince1970: 1215691200)),
        Event(title: "Swift becomes open source.", eventInfoURI: "http://www.theverge.com/2015/12/3/9842854/apple-swift-open-source-released", eventDate: Date(timeIntervalSince1970: 1449144000)),
        Event(title: "First Pokemon game released in Japan.", eventInfoURI: "https://en.wikipedia.org/wiki/Pokémon_(video_game_series)", eventDate: Date(timeIntervalSince1970: 825422400)),
        Event(title: "Raspberry Pi 1 released.", eventInfoURI: "https://www.raspberrypi.org", eventDate: Date(timeIntervalSince1970: 1330495200)),
        Event(title: "Oculus Rift funded on Kickstarter.", eventInfoURI: "https://www.kickstarter.com/projects/1523379957/oculus-rift-step-into-the-game/description", eventDate: Date(timeIntervalSince1970: 1343908800)),
        Event(title: "HTC Vive released.", eventInfoURI: "", eventDate: Date(timeIntervalSince1970: 1459857600)),
        Event(title: "Nintendo Entertainment System released in the USA.", eventInfoURI: "", eventDate: Date(timeIntervalSince1970: 498484800)),
        Event(title: "Facebook opens registration to everyone.", eventInfoURI: "https://en.wikipedia.org/wiki/Facebook#History", eventDate: Date(timeIntervalSince1970: 1159272000)),
        Event(title: "Zelda: A Link to the Past released.", eventInfoURI: "", eventDate: Date())
    ]
    
    func getRandomEvent() -> Event {
        let randomIndex = getRandomIndex()
        return events[randomIndex]
    }
    
    private func getRandomIndex() -> Int {
        return GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
    }
}



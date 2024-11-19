//
//  BuildManifest.swift
//  UpgradeYourMac
//
//  Created by Hanna Torales Palacios on 2024/11/19.
//

import Foundation
import SwiftData

struct BuildManifest: Codable {
    var logs: [String: Buildlog]
}

@Model
class Buildlog: Codable, Comparable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case timeStartedRecording
        case timeStopeddRecording
    }
    var title: String
    var timeStartedRecording: Double
    var timeStopeddRecording: Double
    
    var timeTaken: Double {
        timeStopeddRecording - timeStartedRecording
    }
    
    var dateStarted: Date {
        Date(timeIntervalSinceReferenceDate: timeStartedRecording)
    }
    
    init(title: String, timeStartedRecording: Double, timeStopeddRecording: Double) {
        self.title = title
        self.timeStartedRecording = timeStartedRecording
        self.timeStopeddRecording = timeStopeddRecording
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.timeStartedRecording = try container.decode(Double.self, forKey: .timeStartedRecording)
        self.timeStopeddRecording = try container.decode(Double.self, forKey: .timeStopeddRecording)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(timeStartedRecording, forKey: .timeStartedRecording)
        try container.encode(timeStopeddRecording, forKey: .timeStopeddRecording)
    }
    
    static func < (lhs: Buildlog, rhs: Buildlog) -> Bool {
        lhs.timeStartedRecording < rhs.timeStopeddRecording
    }
}

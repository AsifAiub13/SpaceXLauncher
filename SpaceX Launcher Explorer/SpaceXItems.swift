//
//  SpaceXItems.swift
//  SpaceX Launcher Explorer
//
//  Created by Asif Seraje on 7/10/25.
//

struct SpaceXItems: Identifiable, Decodable {
    let flight_number: Int
    var id: Int { flight_number }
    
    let mission_name: String?
    let launch_date_utc: String?
    let launch_success: Bool?
    let name : String?
    let date_utc : String?
    let details : String?
    let success : Bool?
    let imageUrl: String?
    let links: Links?
}

struct Links: Codable {
    let mission_patch, mission_patch_small: String?
}

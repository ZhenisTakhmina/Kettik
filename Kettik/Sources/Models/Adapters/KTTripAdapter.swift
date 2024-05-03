//
//  KTTripAdapter.swift
//  Kettik
//
//  Created by Tami on 01.05.2024.
//

import Foundation

struct KTTripAdapter {
    
    let id: String
    let name: String?
    let description: String?
    let thumbnailURL: URL?
    let location: String?
    let price: Int?
    let formattedPrice: String?
    let difficulty: KTTripDifficulty?
    let date: String?
    let duration: String?
    
    init(id: String, name: String, description: String?, thumbnailURL: URL?, location: String?, price: Int?, formattedPrice: String?, difficulty: KTTripDifficulty?, date: String?, duration: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnailURL = thumbnailURL
        self.location = location
        self.price = price
        self.formattedPrice = formattedPrice
        self.difficulty = difficulty
        self.date = date
        self.duration = duration
    }
    
    init(trip: KTTrip) {
        self.id = trip.id
        self.name = trip.name
        self.description = trip.description
        self.thumbnailURL = URL(string: trip.thumbnail ?? "")
        self.location = trip.location
        self.price = trip.price
        self.formattedPrice = trip.price?.kztFormatted
        self.difficulty = .init(rawValue: trip.difficulty ?? "")
        self.date = trip.date
        self.duration = trip.duration
    }
}

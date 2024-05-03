//
//  KTTrip.swift
//  Kettik
//
//  Created by Tami on 01.05.2024.
//

import FirebaseFirestore

struct KTTrip: FBSnapshotInitializable {
    
    let id: String
    let name: String?
    let location: String?
    let price: Int?
    let date: String?
    let description: String?
    let thumbnail: String?
    let images: [String]?
    let difficulty: String?
    let duration: String?
    
    init?(documentSnapshot: DocumentSnapshot?) {
        guard let id = documentSnapshot?.documentID else { return nil }
        
        let name: String? = documentSnapshot?.data()?["name"] as? String
        let location: String? = documentSnapshot?.data()?["location"] as? String
        let date: String? = documentSnapshot?.data()?["date"] as? String
        let price: Int? = documentSnapshot?.data()?["price"] as? Int
        let description: String? = documentSnapshot?.data()?["description"] as? String
        let thumbnail: String? = documentSnapshot?.data()?["thumbnail"] as? String
        let images: [String]? = documentSnapshot?.data()?["images"] as? [String]
        let difficulty: String? = documentSnapshot?.data()?["difficulty"] as? String
        let duration: String? = documentSnapshot?.data()?["duration"] as? String
        
        self.id = id
        self.name = name
        self.location = location
        self.price = price
        self.description = description
        self.thumbnail = thumbnail
        self.images = images
        self.difficulty = difficulty
        self.date = date
        self.duration = duration
    }
}

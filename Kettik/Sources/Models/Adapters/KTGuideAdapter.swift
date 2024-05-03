//
//  KTGuideAdapter.swift
//  Kettik
//
//  Created by Tami on 02.05.2024.
//

import Foundation

struct KTGuideAdapter {
    
    let id: String
    let name: String?
    let role: String?
    let photoURL: URL?
    let description: String?
    
    init(id: String, name: String?, role: String?, photoURL: URL?, description: String?) {
        self.id = id
        self.name = name
        self.role = role
        self.photoURL = photoURL
        self.description = description
    }
    
    init(guide: KTGuide) {
        self.id = guide.id
        self.name = guide.name
        self.role = guide.role
        self.photoURL = URL(string: guide.photo ?? "")
        self.description = guide.description
    }
}

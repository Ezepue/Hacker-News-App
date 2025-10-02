//
//  PostData.swift
//  HAXOR News
//
//  Created by Chukwuebuka Ezepue on 02/10/2025.
//

import Foundation

public struct NewsResponseObj: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    
    let objectID: String
    let points: Int?
    let title: String?
    let url: String?
    let createdAt: String?
    //let updatedAt: String?
}

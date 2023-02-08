//
//  list.swift
//  equalinfotech
//
//  Created by STC on 08/02/23.
//

import Foundation
struct apiResponce : Decodable{
    var data : [information]
}
struct information: Decodable {
    let id, name: String
    let image: String
    let details: Details
}
struct Details: Decodable {
    let additional_information: String

  
    }


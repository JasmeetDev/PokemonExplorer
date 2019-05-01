//
//	Ability.swift
//
//	Create by Vaneet Modgill on 1/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Abilities : Codable {

	let name : String?
	let url : String?
    let ability : Ability?
	let isHidden : Bool?
	let slot : Int?


	enum CodingKeys: String, CodingKey {
		case name = "name"
		case url = "url"
		case ability = "ability"
		case isHidden = "is_hidden"
		case slot = "slot"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		url = try values.decodeIfPresent(String.self, forKey: .url)
        ability = try values.decodeIfPresent(Ability.self, forKey: .ability)
		isHidden = try values.decodeIfPresent(Bool.self, forKey: .isHidden)
		slot = try values.decodeIfPresent(Int.self, forKey: .slot)
	}


}

struct Ability : Codable {
    
    var name : String = ""
    var url : String = ""
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
    
    
}

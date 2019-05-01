//
//	Form.swift
//
//	Create by Vaneet Modgill on 1/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Form : Codable {

	let name : String?
	let url : String?


	enum CodingKeys: String, CodingKey {
		case name = "name"
		case url = "url"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}


}

struct Types : Codable {
    let type : TypeForm?
    let slot : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case slot = "slot"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(TypeForm.self, forKey: .type)
        slot = try values.decodeIfPresent(Int.self, forKey: .slot)
    }
    
    
}

struct TypeForm : Codable {
    
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

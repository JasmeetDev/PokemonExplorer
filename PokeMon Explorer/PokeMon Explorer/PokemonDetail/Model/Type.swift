//
//	Type.swift
//
//	Create by Vaneet Modgill on 1/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Type : Codable {

	let slot : Int?
	let type : Form?


	enum CodingKeys: String, CodingKey {
		case slot = "slot"
		case type
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		slot = try values.decodeIfPresent(Int.self, forKey: .slot)
		type = try Form(from: decoder)
	}


}

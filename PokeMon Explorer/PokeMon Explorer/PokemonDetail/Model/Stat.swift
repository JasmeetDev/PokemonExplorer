//
//	Stat.swift
//
//	Create by Vaneet Modgill on 1/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Stat : Codable {

	let baseStat : Int?
	let effort : Int?
	let stat : Form?


	enum CodingKeys: String, CodingKey {
		case baseStat = "base_stat"
		case effort = "effort"
		case stat
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		baseStat = try values.decodeIfPresent(Int.self, forKey: .baseStat)
		effort = try values.decodeIfPresent(Int.self, forKey: .effort)
		stat = try Form(from: decoder)
	}


}
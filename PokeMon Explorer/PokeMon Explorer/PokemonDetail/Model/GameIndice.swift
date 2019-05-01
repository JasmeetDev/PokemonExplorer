//
//	GameIndice.swift
//
//	Create by Vaneet Modgill on 1/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct GameIndice : Codable {

	let gameIndex : Int?
	let version : Form?


	enum CodingKeys: String, CodingKey {
		case gameIndex = "game_index"
		case version
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		gameIndex = try values.decodeIfPresent(Int.self, forKey: .gameIndex)
		version = try Form(from: decoder)
	}


}
//
//	Sprite.swift
//
//	Create by Vaneet Modgill on 1/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Sprite : Codable {

	let backDefault : String?
	let backFemale : String?
	let backShiny : String?
	let backShinyFemale : String?
	let frontDefault : String?
	let frontFemale : String?
	let frontShiny : String?
	let frontShinyFemale : String?


	enum CodingKeys: String, CodingKey {
		case backDefault = "back_default"
		case backFemale = "back_female"
		case backShiny = "back_shiny"
		case backShinyFemale = "back_shiny_female"
		case frontDefault = "front_default"
		case frontFemale = "front_female"
		case frontShiny = "front_shiny"
		case frontShinyFemale = "front_shiny_female"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		backDefault = try values.decodeIfPresent(String.self, forKey: .backDefault)
		backFemale = try values.decodeIfPresent(String.self, forKey: .backFemale)
		backShiny = try values.decodeIfPresent(String.self, forKey: .backShiny)
		backShinyFemale = try values.decodeIfPresent(String.self, forKey: .backShinyFemale)
		frontDefault = try values.decodeIfPresent(String.self, forKey: .frontDefault)
		frontFemale = try values.decodeIfPresent(String.self, forKey: .frontFemale)
		frontShiny = try values.decodeIfPresent(String.self, forKey: .frontShiny)
		frontShinyFemale = try values.decodeIfPresent(String.self, forKey: .frontShinyFemale)
	}


}
//
//	VersionGroupDetail.swift
//
//	Create by Vaneet Modgill on 1/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct VersionGroupDetail : Codable {

	let levelLearnedAt : Int?
	let moveLearnMethod : Form?
	let versionGroup : Form?


	enum CodingKeys: String, CodingKey {
		case levelLearnedAt = "level_learned_at"
		case moveLearnMethod
		case versionGroup
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		levelLearnedAt = try values.decodeIfPresent(Int.self, forKey: .levelLearnedAt)
		moveLearnMethod = try Form(from: decoder)
		versionGroup = try Form(from: decoder)
	}


}
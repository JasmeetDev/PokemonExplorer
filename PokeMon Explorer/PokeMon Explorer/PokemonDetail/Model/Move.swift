//
//	Move.swift
//
//	Create by Vaneet Modgill on 1/5/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Move : Codable {

	let move : Form?
	let versionGroupDetails : [VersionGroupDetail]?


	enum CodingKeys: String, CodingKey {
		case move
		case versionGroupDetails = "version_group_details"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		move = try Form(from: decoder)
		versionGroupDetails = try values.decodeIfPresent([VersionGroupDetail].self, forKey: .versionGroupDetails)
	}


}
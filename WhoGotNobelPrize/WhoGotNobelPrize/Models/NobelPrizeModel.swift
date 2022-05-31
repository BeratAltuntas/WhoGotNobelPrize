//
//  NobelPrizeModel.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 31.05.2022.
//

import Foundation

// MARK: - NobelPrize
struct NobelPrizeModel: Codable {
	let nobelPrizes: [NobelPrizeElement]?
	let meta: NobelPrizeMeta?
	let links: NobelPrizeLinks?
}

// MARK: - Links
struct NobelPrizeLinks: Codable {
	let first, linksSelf, next, last: String?
}

// MARK: - Meta
struct NobelPrizeMeta: Codable {
	let offset, limit, count: Int?
	let terms, license, disclaimer: String?
}

// MARK: - NobelPrizeElement
struct NobelPrizeElement: Codable {
	let awardYear: String?
	let category, categoryFullName: NobelPrizeCategory?
	let prizeAmount, prizeAmountAdjusted: Int?
	let links: [NobelPrizeLink]?
	let laureates: [NobelPrizeLaureate]?
	let dateAwarded: String?
}

// MARK: - Category
struct NobelPrizeCategory: Codable {
	let en, no, se: String?
}

// MARK: - Laureate
struct NobelPrizeLaureate: Codable {
	let id: String?
	let knownName, fullName: NobelPrizeName?
	let portion, sortOrder: String?
	let motivation: NobelPrizeCategory?
	let links: [NobelPrizeLink]?
	let orgName: NobelPrizeOrgName?
	let nativeName: String?
}

// MARK: - Name
struct NobelPrizeName: Codable {
	let en: String?
}

// MARK: - Link
struct NobelPrizeLink: Codable {
	let rel: String?
	let href: String?
	let action: String?
	let types: String?
}

// MARK: - OrgName
struct NobelPrizeOrgName: Codable {
	let en, no: String?
}

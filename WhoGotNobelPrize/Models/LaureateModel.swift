// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let laureatesModel = try? newJSONDecoder().decode(LaureatesModel.self, from: jsonData)

import Foundation

// MARK: - LaureatesModel
struct LaureatesModel: Codable {
	let laureates: [Laureate]?
	let meta: LaureateMeta?
	let links: LaureateLinks?
}

// MARK: - Links
struct LaureateLinks: Codable {
	let first, linksSelf, next, last: String?

	enum CodingKeys: String, CodingKey {
		case first
		case linksSelf = "self"
		case next, last
	}
}

// MARK: - Meta
struct LaureateMeta: Codable {
	let offset, limit, count: Int?
	let terms, license, disclaimer: String?
}

// MARK: - Laureate
struct Laureate: Codable {
	let id: String?
	let knownName, givenName, familyName, fullName: LaureateName?
	let fileName: String?
	let gender: String?
	let birth: LaureateBirth?
	let wikipedia: LaureateWikipedia?
	let wikidata: LaureateWikidata?
	let sameAs: [String]?
	let links: [LaureateLink]?
	let nobelPrizes: [LaureateNobelPrize]?
}

// MARK: - Birth
struct LaureateBirth: Codable {
	let date: String?
	let place: LaureatePlace?
}

// MARK: - Place
struct LaureatePlace: Codable {
	let city, country, cityNow, countryNow, continent, locationString: LaureateCity?
}

// MARK: - City
struct LaureateCity: Codable {
	let en, no, se: String?
	let sameAs: [String]?
}

// MARK: - Name
struct LaureateName: Codable {
	let en, se: String?
}


// MARK: - Link
struct LaureateLink: Codable {
	let rel, href, action, types, title: String?
	let linkClass: [String]?

	enum CodingKeys: String, CodingKey {
		case rel, href, action, types, title
		case linkClass = "class"
	}
}


// MARK: - NobelPrize
struct LaureateNobelPrize: Codable {
	let awardYear: String?
	let category, categoryFullName: LaureateCity?
	let sortOrder, portion, dateAwarded: String?
	let prizeStatus: String?
	let motivation: LaureateCity?
	let prizeAmount, prizeAmountAdjusted: Int?
	let affiliations: [LaureateAffiliation]?
	let links: [LaureateLink]?
	let residences: [LaureateResidence]?
}

// MARK: - Affiliation
struct LaureateAffiliation: Codable {
	let name: LaureateCity?
	let nameNow: LaureateNameNow?
	let city, country, cityNow, countryNow, locationString: LaureateCity?
}

// MARK: - NameNow
struct LaureateNameNow: Codable {
	let en: String?
}
// MARK: - Residence
struct LaureateResidence: Codable {
	let country, countryNow, locationString: LaureateCity?
}

// MARK: - Wikidata
struct LaureateWikidata: Codable {
	let id: String?
	let url: String?
}

// MARK: - Wikipedia
struct LaureateWikipedia: Codable {
	let slug: String?
	let english: String?
}

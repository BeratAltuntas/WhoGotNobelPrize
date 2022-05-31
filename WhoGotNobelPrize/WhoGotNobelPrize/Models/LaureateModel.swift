//
//  LaureateModel.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 31.05.2022.
//

import Foundation

// MARK: - LaureateModel
struct LaureatesModel: Codable {
	let id: String?
	let knownName, givenName, familyName, fullName: LaureateFamilyName?
	let fileName, gender: String?
	let birth, death: LaureateBirth?
	let wikipedia: LaureateWikipedia?
	let wikidata: LaureateWikidata?
	let sameAs: [String]?
	let links: [LaureateLink]?
	let nobelPrizes: [LaureateNobelPrize]?
	let meta: LaureateMeta?
}

// MARK: - Birth
struct LaureateBirth: Codable {
	let date: String?
	let place: LaureatePlace?
}

// MARK: - Place
struct LaureatePlace: Codable {
	let city, country, cityNow, countryNow: LaureateCity?
	let continent, locationString: LaureateCity?
}

// MARK: - City
struct LaureateCity: Codable {
	let en, no, se: String?
	let sameAs: [String]?
}

// MARK: - FamilyName
struct LaureateFamilyName: Codable {
	let en, se: String?
}

// MARK: - Link
struct LaureateLink: Codable {
	let rel: String?
	let href: String?
	let action, types, title: String?
	let linkClass: [String]?
}

// MARK: - Meta
struct LaureateMeta: Codable {
	let terms, license, disclaimer: String?
}

// MARK: - NobelPrize
struct LaureateNobelPrize: Codable {
	let awardYear: String?
	let category, categoryFullName: LaureateCity?
	let sortOrder, portion, prizeStatus: String?
	let motivation: LaureateFamilyName?
	let prizeAmount, prizeAmountAdjusted: Int?
	let affiliations: [LaureateAffiliation]?
	let links: [LaureateLink]?
}

// MARK: - Affiliation
struct LaureateAffiliation: Codable {
	let name: LaureateCity?
	let nameNow: LaureateNameNow?
	let city, country, cityNow, countryNow: LaureateCity?
	let locationString: LaureateCity?
}

// MARK: - NameNow
struct LaureateNameNow: Codable {
	let en: String?
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

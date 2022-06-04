//
//  HomeViewModel.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 29.05.2022.
//

import Foundation

private enum DateConstants {
	static let months = ["JAN","FEB","MARCH","APR","MAY","JUNE","JULY","AUG","SEPT","OCT","NOV","DEC"]
	static let weekDays = ["MON","TUE","THUR","WED","FRI","SAT","SUN"]
}

// MARK: - HomeViewModelProtocol
protocol HomeViewModelProtocol {
	var delegate: HomeViewModelDelegate? { get set }
	var winners: [Laureate]? { get }
	
	func LoadTime()-> String
	func LoadUI()
}

// MARK: - HomeViewModelDelegate
protocol HomeViewModelDelegate: AnyObject {
	func ReloadTableView()
}

// MARK: - HomeViewModel
final class HomeViewModel {
	weak var delegate: HomeViewModelDelegate?
	var winners: [Laureate]?
	func LoadTime()-> String {
		let date = Date()
		let weekDay = Calendar.current.component(.weekday, from: date)
		let day = Calendar.current.component(.day, from: date)
		let month = Calendar.current.component(.month, from: date)
		return "\(DateConstants.weekDays[weekDay-2]),\(DateConstants.months[month]) \(day)"
	}
	func FetchData() {
		NetworkManager.shared.FetchData(endPoint: Config.laureateUrl, type: LaureatesModel?.self) { [weak self] response in
			switch response {
			case .success(let result):
				self?.winners = result.laureates
				self?.delegate?.ReloadTableView()
				break
			case .failure(let error):
				print(error)
			}
		}
	}
}

// MARK: - Extension: HomeViewModelProtocol
extension HomeViewModel: HomeViewModelProtocol {
	func LoadUI() {
		FetchData()
	}
}

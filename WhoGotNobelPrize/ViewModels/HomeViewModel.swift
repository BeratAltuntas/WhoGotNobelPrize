//
//  HomeViewModel.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 29.05.2022.
//

import Foundation

// MARK: - HomeViewModelProtocol
protocol HomeViewModelProtocol {
	var delegate: HomeViewModelDelegate? { get set }
	var winners: [Laureate]? { get }
	
	func LoadUI()
}

// MARK: - HomeViewModelDelegate
protocol HomeViewModelDelegate: AnyObject {
	var titleUI: String { get set }
	func ReloadTableView()
}

// MARK: - HomeViewModel
final class HomeViewModel {
	weak var delegate: HomeViewModelDelegate?
	var winners: [Laureate]?
	func LoadTime() {
		
		let date = Date()
		let weekDay = Calendar.current.component(.weekday, from: date).description.uppercased()
		let day = Calendar.current.component(.day, from: date).description.uppercased()
		let month = Calendar.current.component(.month, from: date).description.uppercased()
		delegate?.titleUI = "\(weekDay),\(month) \(day)"
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
		LoadTime()
		FetchData()
	}
}

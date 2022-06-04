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
	func FetchData()
}

// MARK: - HomeViewModelDelegate
protocol HomeViewModelDelegate: AnyObject {
}

// MARK: - HomeViewModel
final class HomeViewModel {
	weak var delegate: HomeViewModelDelegate?
	var winners: [Laureate]?
	
}

// MARK: - Extension: HomeViewModelProtocol
extension HomeViewModel: HomeViewModelProtocol {
	func FetchData() {
		NetworkManager.shared.FetchData(endPoint: Config.laureateUrl, type: LaureatesModel?.self) { [weak self] response in
			switch response {
			case .success(let result):
				self?.winners = result.laureates
				break
			case .failure(let error):
				print(error)
			}
		}
	}
}

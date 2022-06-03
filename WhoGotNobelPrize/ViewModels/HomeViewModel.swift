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
	func FetchData()
}

// MARK: - HomeViewModelDelegate
protocol HomeViewModelDelegate: AnyObject {
}

// MARK: - HomeViewModel
final class HomeViewModel {
	weak var delegate: HomeViewModelDelegate?
}

// MARK: - Extension: HomeViewModelProtocol
extension HomeViewModel: HomeViewModelProtocol {
	func FetchData() {
		NetworkManager.shared.FetchData(endPoint: Config.laureateUrl, type: LaureatesModel?.self) { response in
			switch response {
			case .success(let result):
				print(result.laureates?.first?.familyName?.en)
				break
			case .failure(let error):
				print(error)
			}
		}
	}
}

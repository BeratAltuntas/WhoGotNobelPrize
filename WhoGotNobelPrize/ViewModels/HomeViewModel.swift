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
	
}

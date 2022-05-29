//
//  DetailViewModel.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 29.05.2022.
//

import Foundation

// MARK: - DetailViewProtocol
protocol DetailViewProtocol {
	var delegate: DetailViewDelegate? { get set }
}

// MARK: - DetailViewDelegate
protocol DetailViewDelegate: AnyObject {
	
}

// MARK: - DetailViewModel
final class DetailViewModel {
	weak var delegate: DetailViewDelegate?
}

// MARK: - Extension: DetailViewProtocol
extension DetailViewModel: DetailViewProtocol {
	
}

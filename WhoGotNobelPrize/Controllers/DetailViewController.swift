//
//  DetailViewController.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 29.05.2022.
//

import UIKit

// MARK: - DetailViewController
class DetailViewController: UIViewController {

	var viewModel: DetailViewProtocol! {
		didSet {
			viewModel.delegate = self
		}
	}
}

// MARK: - Extension: DetailViewDelegate
extension DetailViewController: DetailViewDelegate {
	
}

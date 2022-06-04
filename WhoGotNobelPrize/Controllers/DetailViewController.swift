//
//  DetailViewController.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 29.05.2022.
//

import UIKit

// MARK: - DetailViewController
class DetailViewController: UIViewController {

	@IBOutlet weak var imageViewBanner: UIImageView!
	@IBOutlet weak var labelNobelUniAndCategory: UILabel!
	@IBOutlet weak var labelTitleLaureate: UILabel!
	@IBOutlet weak var labelLaureateMotivation: UILabel!
	@IBOutlet weak var labelCityOfResidence: UILabel!
	@IBOutlet weak var labelLink1: UILabel!
	@IBOutlet weak var labelLink2: UILabel!
	var viewModel: DetailViewProtocol! {
		didSet {
			viewModel.delegate = self
		}
	}
	@IBAction func GoHomePage_TUI(_ sender: Any) {
		dismiss(animated: true)
	}
}

// MARK: - Extension: DetailViewDelegate
extension DetailViewController: DetailViewDelegate {
	
}

//
//  DetailViewController.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 29.05.2022.
//

import UIKit

// MARK: - DetailViewController
class DetailViewController: UIViewController {

	@IBOutlet weak private var imageViewBanner: UIImageView!
	@IBOutlet weak private var labelNobelUniAndCategory: UILabel!
	@IBOutlet weak private var labelTitleLaureate: UILabel!
	@IBOutlet weak private var labelLaureateMotivation: UILabel!
	@IBOutlet weak private var labelCityOfResidence: UILabel!
	@IBOutlet weak private var labelLink1: UILabel!
	internal var viewModel: DetailViewProtocol! {
		didSet {
			viewModel.delegate = self
		}
	}
	internal var selectedLaureate: Laureate!
	
	override func viewDidLoad() {
		SetLinkTapRecognizer()
		if let href = selectedLaureate.links?[1].href {
			viewModel.LoadUI(url: href)
		}
	}
	func SetLinkTapRecognizer() {
		let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ImageTapped(tapGestureRecognizer:)))
		labelLink1.isUserInteractionEnabled = true
		labelLink1.addGestureRecognizer(imageTapGestureRecognizer)
	}
	@objc func ImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
		if let link1 = selectedLaureate.links?[1].href {
			UIApplication.shared.open(URL(string:link1)!)
		}
	}
	@IBAction func GoHomePage_TUI(_ sender: Any) {
		dismiss(animated: true)
	}
}

// MARK: - Extension: DetailViewDelegate
extension DetailViewController: DetailViewDelegate {
	
	func LoadUIAttiributes() {
		if let awardYear = selectedLaureate.nobelPrizes?.first?.awardYear,
		   let categoryFullName = selectedLaureate.nobelPrizes?.first?.categoryFullName?.en,
		   let laureateName = selectedLaureate.fullName?.en,
		   let university = selectedLaureate.nobelPrizes?.first?.affiliations?.first?.name?.en,
		   let motivation = selectedLaureate.nobelPrizes?.first?.motivation?.en,
		   let livingCity = selectedLaureate.birth?.place?.cityNow?.en,
		   let livingCountry = selectedLaureate.birth?.place?.countryNow?.en,
		   let link1 = selectedLaureate.links?[1] {
			labelNobelUniAndCategory.text = "\(university) / \(categoryFullName)"
			labelTitleLaureate.text = "\(laureateName) / \(categoryFullName) \(awardYear)"
			labelLaureateMotivation.text = motivation
			labelCityOfResidence.text = "\(livingCity) / \(livingCountry)"
			labelLink1.text = "1: \(link1.title!)"
		}
	}
	func LoadImageView(imageData: Data) {
		DispatchQueue.main.async { [weak self] in
			self?.imageViewBanner.image = UIImage(data: imageData)
		}
	}
}

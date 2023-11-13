//
//  OnboardingCollectionViewCell.swift
//  AtlasFitnessApp
//
//  Created by Alim Gönül on 31.10.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
        
    func setup( slide: OnboardingSlide) {
        if let imageName = slide.image, let image = UIImage(named: imageName) {
            slideImageView.image = image
        } else {
            // Eğer resim yüklenemezse, varsayılan bir resim veya hata işleme yapabilirsiniz.
        }
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
        
    }
}

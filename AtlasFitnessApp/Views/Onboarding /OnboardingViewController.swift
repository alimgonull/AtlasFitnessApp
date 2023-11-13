//
//  OnboardingViewController.swift
//  AtlasFitnessApp
//
//  Created by Alim Gönül on 31.10.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageController: UIPageControl!
    
    var slides = [OnboardingSlide]()
    var currentPage = 0 {
        didSet {
            pageController.currentPage = currentPage
            // Bu if kontrolü ile son sayfada olduğumuzu belirtiyoruz.
            if currentPage == slides.count-1 {
                nextBtn.setTitle("Get Started", for: .normal)
            }
            else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let image1 = OnboardingSlide(title:"Hoşgeldiniz", description:"Fitness yolculuğunuza başlamak için hazır mısınız? Uygulamamız size yardımcı olacak!", image: "image-1")
            let image2 = OnboardingSlide(title:"Egzersiz Yapın", description:"Farklı egzersizler arasından seçim yapın ve hedeflerinize ulaşın", image: "image1")
            let image3 = OnboardingSlide(title:"Sağlıklı Yaşam", description:"Sağlıklı bir yaşam tarzı sürdürmek için diyet ve takip önemlidir", image: "resim-4")
            
            slides.append(image1)
            slides.append(image2)
            slides.append(image3)
            // dizilerden birini sildiğimiğizde otomatik olarak bir tane page azaltıyor. 
            pageController.numberOfPages = slides.count
            
        }
        
        
        
        @IBAction func nextButton(_ sender: UIButton) {
            if currentPage == slides.count-1 {
                // HomeViewControllera animasyonlu geçiş
                let controller = storyboard?.instantiateViewController(identifier: "HomeVC") as! UINavigationController
                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .flipHorizontal
                present(controller, animated: true)
            }else {
                currentPage += 1
                let indexPath = IndexPath(item: currentPage, section: 0)
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        }
    }
    extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return slides.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
            cell.setup(slide: slides[indexPath.row])
            
            return cell
        }
        // Fotoğrafların boyutunu ayarladığımız kısım.
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let width = scrollView.frame.width
            currentPage = Int(scrollView.contentOffset.x / width)
            pageController.currentPage = currentPage
        }
    }


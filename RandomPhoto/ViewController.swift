//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Miguel Valera Salmerón on 25/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    let colors: [UIColor] = [
        .systemMint,
        .systemCyan,
        .systemRed,
        .systemPink,
        .systemGray,
        .systemBrown,
        .systemPurple,
        .systemOrange
    ]

    private let imageView: UIImageView = {
        let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            return imageView
        
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        
        getrandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getrandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    
    func getrandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        
        imageView.image = UIImage(data: data)
    }


}


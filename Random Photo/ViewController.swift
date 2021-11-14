//
//  ViewController.swift
//  Random Photo
//
//  Created by Elijah Lozano on 11/13/21.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        // Only allow the image to fill its border
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let colors: [UIColor] = [
        .systemBlue,
        .systemGreen,
        .systemPink,
        .systemYellow,
        .systemPurple,
        .systemOrange
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        // Give the image view a frame/border
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        // Center the image view
        imageView.center = view.center
        
        view.addSubview(button)
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    // Need the @ annotation to attach it to a button
    @objc func didTapButton() {
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }

    // Override this function to get the benefits of using
    // the safe area insets
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 55
        )
    }
    
    func getRandomPhoto() {
        let urlStr = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlStr)!
        
        guard let imgData = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: imgData)
    }

}


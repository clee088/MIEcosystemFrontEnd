//
//  HomeScreen.swift
//  EcosystemFrontEnd
//
//  Created by Noah Pikielny on 11/11/19.
//  Copyright © 2019 Christopher Lee. All rights reserved.
//

import Cocoa

class HomeScreenViewController: NSViewController {

	//MARK: - Properties
	
	private let backgroundImageView: NSImageView = {
		let view = NSImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = #imageLiteral(resourceName: "Background")
//		view.imageAlignment = .alignCenter
		return view
	}()
	
	//MARK: - Inits
	
    convenience init() {
        self.init(nibName: "HomeScreen", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		configureUI()
		
    }
	
	//MARK: - Functions
	
	private func configureUI() {
		
		[backgroundImageView].forEach { view.addSubview($0) }

		backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		backgroundImageView.heightAnchor.constraint(equalToConstant: NSScreen.main?.frame.height ?? 0).isActive = true
		backgroundImageView.widthAnchor.constraint(equalToConstant: NSScreen.main?.frame.width ?? 0).isActive = true
		
	}
	
}

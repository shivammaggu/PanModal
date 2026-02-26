//
//  CloseButtonDemoViewController.swift
//  PanModal
//
//  Demonstrates the configurable close button feature
//

import UIKit

class CloseButtonDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.1137254902, blue: 0.1294117647, alpha: 1)
        
        setupUI()
    }
    
    private func setupUI() {
        let titleLabel = UILabel()
        titleLabel.text = "Close Button Demo"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "This modal has a configurable close button on the dimmed background above the presented view."
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

extension CloseButtonDemoViewController: PanModalPresentable {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var panScrollable: UIScrollView? {
        return nil
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(200)
    }

    var anchorModalToLongForm: Bool {
        return false
    }
    
    // MARK: - Close Button Configuration
    
    var closeButtonConfig: CloseButtonConfig {
        return CloseButtonConfig(
            isEnabled: true,
            size: CGSize(width: 36.0, height: 36.0),
            distanceFromPresentedView: 20.0,
            image: nil, // Uses default system icon. You can set UIImage(named: "customCloseIcon")
            action: { [weak self] in
                // Custom action when close button is tapped
                print("Close button tapped - performing custom action")
                self?.dismiss(animated: true, completion: {
                    print("Modal dismissed")
                })
            }
        )
    }
}

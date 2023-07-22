//
//  ViewController.swift
//  postInsta
//
//  Created by HAMDI TLILI on 20/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profilIV: UIImageView!
    @IBOutlet var imageLikes: [UIImageView]!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var postDeskLabel: UILabel!
    
    var isLiked = false
    var newProfile: UIImageView?
    var baseLikes = 175
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfilIV(profilIV)
        imageLikes.forEach {
            (image) in setupProfilIV(image)
        }
        setupDoubleTap()
        profilIV.isUserInteractionEnabled = true
        upDateLikeLabel()
    }
    func setupProfilIV(_ iv: UIImageView) {
        iv.layer.cornerRadius = iv.frame.height/2
        iv.layer.borderColor = UIColor.systemBackground.cgColor
        iv.layer.borderWidth = 2
    }

    func setupDoubleTap() {
        postImage.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(addOrRemoveLike))
        tap.numberOfTapsRequired = 2
        postImage.addGestureRecognizer(tap)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profilIV {
                if newProfile == nil {
                    newProfile = UIImageView(frame: view.bounds)
                    newProfile?.image = UIImage(named:"profil")
                    newProfile?.contentMode = .scaleAspectFill
                    view.addSubview(newProfile!)
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        newProfile?.removeFromSuperview()
        newProfile = nil
    }
    
    @objc func addOrRemoveLike() {
        isLiked.toggle()
        let imageString = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: imageString), for: .normal)
         upDateLikeLabel()
        }
    func upDateLikeLabel() {
        baseLikes = isLiked ? 176 : 175
        let likesString = "\(baseLikes) J'aime"
        likesLabel.text = likesString
    }
    @IBAction func likePressed(_ sender: Any) {
        addOrRemoveLike()
    }
    
    @IBAction func otherButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1: print("Envoyer un message")
        case 2: print("Partager")
        case 3: print("Ajouter a la collection")
        default: return
        }
    }
    
    
}


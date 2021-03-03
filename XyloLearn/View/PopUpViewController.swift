import Foundation
import UIKit
import AVKit

class PopUpViewController: UIViewController {
    
    var player: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    
    @IBOutlet var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopPlayer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.removeFromSuperview()
        playSoundOnLoop(soundName: "Background")
    }
    
    
    func playVideo(videoName: String){
        
        guard let path = Bundle.main.path(forResource: videoName, ofType: "mp4") else {
            print("No Video found!!")
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        avPlayerLayer = AVPlayerLayer(player: player)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resize
        
        videoView.layer.addSublayer(avPlayerLayer!)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayerLayer.player?.currentItem)
        
        playVideo()
    }
    
    override func viewDidLayoutSubviews() {

        avPlayerLayer.frame = videoView.layer.bounds
    }

    private func playVideo() {
        player.play()
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification){
        dismiss(animated: true, completion: nil)
    }
}

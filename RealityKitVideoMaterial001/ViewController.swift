import UIKit
import RealityKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet private var arView: ARView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // ① Anchorの追加
        let anchor = AnchorEntity()
        arView.scene.anchors.append(anchor)

        // ② Playerの生成と動画再生
        let asset = AVURLAsset(url: Bundle.main.url(forResource: "video001", withExtension: "mp4")!)
        let playerItem = AVPlayerItem(asset: asset)
        let player = AVPlayer()
        player.replaceCurrentItem(with: playerItem)
        player.play()

        // ③ Plane生成とVideoMaterial設定
        let planeMesh = MeshResource.generatePlane(width: 0.8, height: 0.45)
        let material = VideoMaterial(avPlayer: player)
        let planeModel = ModelEntity(mesh: planeMesh, materials: [material])
        planeModel.position = SIMD3<Float>(0.0, 0.0, -1.0)
        anchor.addChild(planeModel)
    }
}

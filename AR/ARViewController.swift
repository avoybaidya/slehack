
import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {

    var sceneView : ARSCNView!
    
    var e:EchoAR!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = ARSCNView()
        
        // Set the view's delegate
        sceneView.delegate = self
        //let scene = SCNScene(named: "art.scnassets/River otter.usdz")!
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        let e = EchoAR();
        let scene = SCNScene()
        e.loadAllNodes(){ (nodes) in
            for node in nodes{
                //scene.rootNode.addChildNode(node);
            }
        }
        
        // Set the scene to the view
        sceneView.scene=scene;
        self.view.addSubview(sceneView)
        // constrain scene view
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        sceneView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sceneView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        sceneView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0).isActive = true
        sceneView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1.0).isActive = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        //configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    

    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }

    
}

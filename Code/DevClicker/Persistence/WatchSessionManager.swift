import WatchConnectivity

// Note that the WCSessionDelegate must be an NSObject
// So no, you cannot use the nice Swift struct here!
class WatchSessionManager: NSObject, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        return
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        return
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        return
    }
    
    // Instantiate the Singleton
    static let sharedManager = WatchSessionManager()
    
    private override init() {
        super.init()
    }
    
    // Keep a reference for the session,
    // which will be used later for sending / receiving data
    private let session: WCSession? = WCSession.isSupported() ? WCSession.default : nil
    
    // Add a validSession variable to check that the Watch is paired
    // and the Watch App installed to prevent extra computation
    // if these conditions are not met.
    
    // This is a computed property, since the user can pair their device and / or
    // install your app while using your iOS app, so this can become valid
    
    private var validSession: WCSession? {
        
        // paired - the user has to have their device paired to the watch
        // watchAppInstalled - the user must have your watch app installed
        
        // Note: if the device is paired, but your watch app is not installed
        // consider prompting the user to install it for a better experience
        
        if let session = session, session.isPaired && session.isWatchAppInstalled {
            return session
        }
        return nil
    }
    
    func startSession() {
        session?.delegate = self
        session?.activate()
    }
    
    func updateGame(game: Game) throws {
        
        let encodedObject = try? JSONEncoder().encode(game.gameStats)
        
        if let session = validSession {
            do {
                try session.updateApplicationContext(["gameStats": String(data: encodedObject!, encoding: .utf8)!])
            } catch let error {
                throw error
            }
        }
    }
}

import LoggerAPI
import Health
import KituraContracts

func initializeMyRoutes(app: App) {
    
    app.router.get("/myroute", handler: getStatus)
    app.router.get("/mysecureroute", handler: getStatusSecure)
    
    private func getStatus(respondWith: @escaping (Status?, RequestError?) -> Void) -> Void {
        if health.status.state == .UP {
            respondWith(health.status, nil)
        } else {
            respondWith(nil, RequestError(.serviceUnavailable, body: health.status))
        }
    }
    
    private func getStatus(user: UserAuth, respondWith: @escaping (Status?, RequestError?) -> Void) -> Void {
        if health.status.state == .UP {
            respondWith(health.status, nil)
        } else {
            respondWith(nil, RequestError(.serviceUnavailable, body: health.status))
        }
    }
    
}

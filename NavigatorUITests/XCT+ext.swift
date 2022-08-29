import XCTest
extension XCUIElement {

    
    /**
     * Sends a tap event to a hittable point computed for the element.
     */
    func tapSlow(){
        tap()
        sleep(1)
    }
}

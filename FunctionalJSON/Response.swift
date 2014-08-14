import Foundation

struct Response {
    let data: NSData
    let statusCode: Int = 500

    init(data: NSData, urlResponse: NSURLResponse) {
        self.data = data
        if let httpResponse = urlResponse as? NSHTTPURLResponse {
            statusCode = httpResponse.statusCode
        }
    }
}

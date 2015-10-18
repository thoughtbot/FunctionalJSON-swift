import Foundation

func performRequest<A: JSONDecodable>(request: NSURLRequest, callback: (Result<A>) -> ()) {
    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, urlResponse, error in
        callback(parseResult(data, urlResponse: urlResponse, error: error))
    }
    task.resume()
}

func parseResult<A: JSONDecodable>(data: NSData!, urlResponse: NSURLResponse!, error: NSError!) -> Result<A> {
    let responseResult: Result<Response> = Result(error, Response(data: data, urlResponse: urlResponse))
    return responseResult >>> parseResponse
                          >>> decodeJSON
                          >>> decodeObject
}

func parseResponse(response: Response) -> Result<NSData> {
    let successRange = 200..<300
    if !successRange.contains(response.statusCode) {
        return .Error(NSError(domain: "<Your domain>", code: 1, userInfo: nil)) // customize the error message to your liking
    }
    return Result(nil, response.data)
}

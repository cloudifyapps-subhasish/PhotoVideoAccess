import Capacitor
import Photos

@objc(PhotoVideoAccess)
public class PhotoVideoAccess: CAPPlugin {

    @objc func getPhotos(_ call: CAPPluginCall) {
        let status = PHPhotoLibrary.authorizationStatus()

        if status == .denied || status == .restricted {
            call.reject("Access to photos is restricted or denied")
            return
        }

        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                var photos: [String] = []
                let assets = PHAsset.fetchAssets(with: .image, options: nil)

                assets.enumerateObjects { (asset, index, stop) in
                    let options = PHImageRequestOptions()
                    options.isSynchronous = true
                    PHImageManager.default().requestImageData(for: asset, options: options) { (data, _, _, _) in
                        if let data = data {
                            let base64String = data.base64EncodedString()
                            photos.append(base64String)
                        }
                    }
                }

                call.resolve(["photos": photos])
            } else {
                call.reject("Access to photos was not granted")
            }
        }
    }

    @objc func getVideos(_ call: CAPPluginCall) {
        // Similar implementation for fetching videos
    }
}

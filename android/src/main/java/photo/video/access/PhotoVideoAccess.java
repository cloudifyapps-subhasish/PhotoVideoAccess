package photo.video.access;

import android.Manifest;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.provider.MediaStore;
import androidx.core.content.ContextCompat;

import com.getcapacitor.Plugin;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.annotation.Permission;
import com.getcapacitor.annotation.PermissionCallback;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@CapacitorPlugin(
    name = "PhotoVideoAccess",
    permissions = {
        @Permission(alias = "photos", strings = {Manifest.permission.READ_EXTERNAL_STORAGE})
    }
)
public class PhotoVideoAccess extends Plugin {

    @PluginMethod
    public void getPhotos(PluginCall call) {
        if (ContextCompat.checkSelfPermission(getContext(), Manifest.permission.READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            requestPermissionForAlias("photos", call, "permissionCallback");
        } else {
            loadPhotos(call);
        }
    }

    @PermissionCallback
    private void permissionCallback(PluginCall call) {
        if (getPermissionState("photos") == PermissionState.GRANTED) {
            loadPhotos(call);
        } else {
            call.reject("Permission is required to access photos");
        }
    }

    private void loadPhotos(PluginCall call) {
        ArrayList<String> photos = new ArrayList<>();
        String[] projection = {MediaStore.Images.Media.DATA};
        Cursor cursor = getContext().getContentResolver().query(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, projection, null, null, null);
        if (cursor != null) {
            int columnIndex = cursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
            while (cursor.moveToNext()) {
                String imagePath = cursor.getString(columnIndex);
                photos.add(imagePath);
            }
            cursor.close();
        }
        JSObject result = new JSObject();
        result.put("photos", photos);
        call.resolve(result);
    }

    @PluginMethod
    public void getVideos(PluginCall call) {
        // Similar implementation for fetching videos
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import java.nio.file.Path;

public class DownloadObject {
  public static void downloadObject(
      String projectId, String bucketName, String objectName, Path destFilePath) {
    // The ID of your GCP project
    // String projectId = "your-project-id";

    // The ID of your GCS bucket
    // String bucketName = "your-unique-bucket-name";

    // The ID of your GCS object
    // String objectName = "your-object-name";

    // The path to which the file should be downloaded
    // Path destFilePath1 = Paths.get("/local/path/to/file.txt");

    Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();

    Blob blob = storage.get(BlobId.of(bucketName, objectName));
    blob.downloadTo(destFilePath);

  }
}

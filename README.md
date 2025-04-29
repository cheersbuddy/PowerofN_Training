

### Steps to Integrate GCS with Your Django Project

#### 1. **Install Required Libraries**
   Ensure you have the necessary dependencies to integrate GCS with Django.

   ```bash
   pip install django-storages[boto3] google-cloud-storage
   ```

   - `django-storages`: Provides storage backend integration for Django.
   - `google-cloud-storage`: Allows interaction with GCS.

---

#### 2. **Configure GCS in Django**
   Update your Django project settings to use GCS for file storage.

   **Update `settings.py`:**
   ```python
   from google.oauth2 import service_account

   # GCS Configuration
   DEFAULT_FILE_STORAGE = 'storages.backends.gcloud.GoogleCloudStorage'
   GS_BUCKET_NAME = 'your-bucket-name'
   GS_DEFAULT_ACL = 'publicRead'

   # Optional: Use a service account key for authentication
   GS_CREDENTIALS = service_account.Credentials.from_service_account_file(
       '/path/to/your-service-account-key.json'
   )
   ```

   Replace:
   - `your-bucket-name` with the name of your GCS bucket.
   - `/path/to/your-service-account-key.json` with the path to your service account key file.

---

#### 3. **Upload Company Logos to GCS**
   Modify your model or utility function to upload company logos directly to GCS.

   **Example Model:**
   ```python
   from django.db import models

   class Company(models.Model):
       name = models.CharField(max_length=255)
       logo = models.ImageField(upload_to='company_logos/')  # Stored in GCS
   ```

   When you upload a file to this field, it will automatically be saved in the specified GCS bucket under the `company_logos/` directory.

---

#### 4. **Update Your View**
   Ensure your view provides the correct URL for the logo. Django's `ImageField` with GCS integration automatically generates a public URL.

   **Example View:**
   ```python
   from django.shortcuts import render
   from .models import Company

   def company_view(request):
       company = Company.objects.first()
       return render(request, 'template.html', {'company_data': company})
   ```

---

#### 5. **Update Your Template**
   Update your template to use the GCS-hosted logo URL.

   **Updated Template Code:**
   ```html
   <div id="kt_app_sidebar_logo" class="m-0 me-10">
       <!--begin::Logo image-->
       <img alt="Logo" src="{{ company_data.logo.url }}"
           onerror="this.onerror=null;this.src='/static/images/default_company_logo.png';"
           class="app-sidebar-logo-default c_logo" id="logo_sidebar"/>
       <!--end::Logo image-->
   </div>
   ```

   The `company_data.logo.url` will now point to the file in your GCS bucket.

---

#### 6. **Migration of Existing Media Files (Optional)**
   If you already have files stored in your local `media/` directory, you can migrate them to GCS using a script.

   **Migration Script Example:**
   ```python
   import os
   from google.cloud import storage

   def upload_to_gcs(local_dir, bucket_name):
       client = storage.Client()
       bucket = client.get_bucket(bucket_name)

       for root, dirs, files in os.walk(local_dir):
           for file in files:
               local_path = os.path.join(root, file)
               blob_path = os.path.relpath(local_path, local_dir)
               blob = bucket.blob(blob_path)
               blob.upload_from_filename(local_path)
               print(f'Uploaded {local_path} to {blob_path}')

   # Call the function
   upload_to_gcs('/path/to/local/media', 'your-bucket-name')
   ```

---

#### 7. **Set Up Bucket Permissions**
   Ensure your bucket permissions allow public access to the files if needed. You can configure the bucket to make files publicly accessible by default or manage individual object permissions.

   **To Make Files Public via GCP Console:**
   - Go to the GCS bucket in the Google Cloud Console.
   - Navigate to the "Permissions" tab.
   - Add a member `allUsers` with the role `Storage Object Viewer`.

---

#### 8. **Best Practices**
   - **Security**: Avoid hardcoding credentials. Use environment variables or secrets management.
   - **Caching**: Use a CDN (e.g., Cloudflare) for faster delivery of static files.
   - **Resizing**: Use a library like Pillow to resize or optimize images before uploading them to reduce storage costs.



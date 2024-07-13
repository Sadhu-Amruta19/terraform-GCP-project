resource "google_cloud_run_service" "hello-service" {

  name     = "hello-world-app"
  location = "us-east1"
  template {
    spec {
      containers {
        image = "us-east1-docker.pkg.dev/terraform-GCP-project/hello-world-repo"
        ports {
          container_port = 3000
        }
      }
    }
  }
  traffic {
    percent = 100
    latest_revision = true
  }

}
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}
resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.hello-service.location
  project     = google_cloud_run_service.hello-service.project
  service     = google_cloud_run_service.hello-service.name
  policy_data = data.google_iam_policy.noauth.policy_data
}

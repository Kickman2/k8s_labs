provider "google" {
  credentials = file("<PATH_TO_YOUR_SERVICE_ACCOUNT_KEY_JSON>")
  project     = "<YOUR_PROJECT_ID>"
  region      = "<YOUR_REGION>"
}

module "gke" {
  source            = "terraform-google-modules/kubernetes-engine/google"
  cluster_name      = "my-gke-cluster"
  region            = var.region
  node_pools        = {
    default-pool = {
      machine_type = "n1-standard-2"
      node_count   = 2
    }
  }
}


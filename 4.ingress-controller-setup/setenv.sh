DIR=$(pwd)
cat << EOF > "$DIR/backend.tf"
terraform {
  backend "gcs" {
    bucket = "`gsutil ls  | grep "backend-" | awk -F "/" '{print $3}'`"
    prefix = "/dev`pwd`"
  }
}
EOF
cat "$DIR/backend.tf"
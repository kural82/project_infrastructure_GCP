module "tools" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "tools"
}

module "dev" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "dev"
}

module "cert-manager" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "cert-manager"
}

module "external-dns" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "external-dns"
}

module "grafana" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "grafana"
}
module "canada" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "canada"
}

module "qa" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "qa"
}

module "stage" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "stage"
}

module "prod" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "prod"
} 



module "canada-dev" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "canada-dev"
}

module "canada-qa" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "canada-qa"
}

module "canada-stage" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "canada-stage"
}

module "canada-prod" {
  source = "./module"
  annotations = {
    name = "new-annotation"
  }
  labels = {
    name = "new-labels"
  }
  name = "canada-prod"
}
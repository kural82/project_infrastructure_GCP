### Resizing nexus volume

envs/dev.tfvars 
```
nexus_storage_size = "20Gi"
```


variable.tf 
```
variable "nexus_storage_size" {}
```


sonatype-nexus.tf
```
persistence:
  enabled: true
  accessMode: ReadWriteOnce
  storageSize: ${var.nexus_storage_size}
```

```
cd 8.nexus-setup
terraform plan    -var-file envs/dev.tfvars
terraform apply   -var-file envs/dev.tfvars
```



### Verification
```
k get pvc -n sonatype-nexus
k get pv 
```

#### Grafana 
Volume dashboard.  <br>
Wait for  3 minutes 


#### GCP Console 
https://console.cloud.google.com/kubernetes/persistentvolumeclaim/

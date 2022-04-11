podTemplate(yaml: '''
    apiVersion: v1
    kind: Pod
    spec:
      containers:
      - name: tools
        image: docker.projectxconsulting.net/tools:latest
        command:
        - sleep
        args:
        - 99d
      imagePullSecrets:
      - name: regcred
''') {
  node(POD_LABEL) {
    stage('Helm') {
      container('tools') {
          sh 'helm version'
      }
    }
    stage('terraform') {
      container('tools') {
          sh 'terraform version'
      }
    }
    stage('packer') {
      container('tools') {
          sh 'packer version'
      }
    }
    stage('gcloud') {
      container('tools') {
          sh 'gcloud version'
      }
    }
    stage('git') {
      container('tools') {
          sh 'git version'
      }
    }
  }
}

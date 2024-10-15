global:
  nameOverride: controller

replicaCount: 1

autoscaling:
  enabled: false

serviceAccount:
  create: false
  name: ${serviceAccount}

clusterName: ${cluster_name}
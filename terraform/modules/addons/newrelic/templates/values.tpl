newrelic-infrastructure:
  # newrelic-infrastructure.enabled -- Install the [`newrelic-infrastructure` chart](https://github.com/newrelic/nri-kubernetes/tree/main/charts/newrelic-infrastructure)
  enabled: true

nri-prometheus:
  # nri-prometheus.enabled -- Install the [`nri-prometheus` chart](https://github.com/newrelic/nri-prometheus/tree/main/charts/nri-prometheus)
  enabled: false

nri-metadata-injection:
  # nri-metadata-injection.enabled -- Install the [`nri-metadata-injection` chart](https://github.com/newrelic/k8s-metadata-injection/tree/main/charts/nri-metadata-injection)
  enabled: true

kube-state-metrics:
  # kube-state-metrics.enabled -- Install the [`kube-state-metrics` chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-state-metrics) from the stable helm charts repository.
  # This is mandatory if `infrastructure.enabled` is set to `true` and the user does not provide its own instance of KSM version >=1.8 and <=2.0. Note, kube-state-metrics v2+ disables labels/annotations
  # metrics by default. You can enable the target labels/annotations metrics to be monitored by using the metricLabelsAllowlist/metricAnnotationsAllowList options described [here](https://github.com/prometheus-community/helm-charts/blob/159cd8e4fb89b8b107dcc100287504bb91bf30e0/charts/kube-state-metrics/values.yaml#L274) in
  # your Kubernetes clusters.
  enabled: true

nri-kube-events:
  # nri-kube-events.enabled -- Install the [`nri-kube-events` chart](https://github.com/newrelic/nri-kube-events/tree/main/charts/nri-kube-events)
  enabled: true

newrelic-logging:
  # newrelic-logging.enabled -- Install the [`newrelic-logging` chart](https://github.com/newrelic/helm-charts/tree/master/charts/newrelic-logging)
  enabled: true
  # fluentBit:
    # -- What path will be mounted to read logs from the node
    # linuxMountPath: /var
    # persistence:
      # -- Fluent Bit persistence is needed to keep track of tailed logs, if set to none data loss or logs duplications could happen. Options are "hostPath", "none", "persistentVolume"
      # mode: hostPath
      # persistentVolume:
        # -- When using persistent volume a storage class could be needed depending on the cluster. It should be a storage class that allows ReadWriteMany
        # storageClass: 


newrelic-pixie:
  # newrelic-pixie.enabled -- Install the [`newrelic-pixie`](https://github.com/newrelic/helm-charts/tree/master/charts/newrelic-pixie)
  enabled: false

pixie-chart:
  # pixie-chart.enabled -- Install the [`pixie-chart` chart](https://docs.pixielabs.ai/installing-pixie/install-schemes/helm/#3.-deploy)
  enabled: false

newrelic-infra-operator:
  # newrelic-infra-operator.enabled -- Install the [`newrelic-infra-operator` chart](https://github.com/newrelic/newrelic-infra-operator/tree/main/charts/newrelic-infra-operator) (Beta)
  enabled: false

newrelic-prometheus-agent:
  # newrelic-prometheus-agent.enabled -- Install the [`newrelic-prometheus-agent` chart](https://github.com/newrelic/newrelic-prometheus-configurator/tree/main/charts/newrelic-prometheus-agent)
  enabled: true

newrelic-k8s-metrics-adapter:
  # newrelic-k8s-metrics-adapter.enabled -- Install the [`newrelic-k8s-metrics-adapter.` chart](https://github.com/newrelic/newrelic-k8s-metrics-adapter/tree/main/charts/newrelic-k8s-metrics-adapter) (Beta)
  enabled: false


# -- change the behaviour globally to all the supported helm charts.
# See [user's guide of the common library](https://github.com/newrelic/helm-charts/blob/master/library/common-library/README.md) for further information.
# @default -- See [`values.yaml`](values.yaml)
global:
  # -- The cluster name for the Kubernetes cluster.
  cluster: tutorial6042-cluster

  # -- The license key for your New Relic Account. This will be preferred configuration option if both `licenseKey` and `customSecret` are specified.
  licenseKey: ${license_key}
  # -- The license key for your New Relic Account. This will be preferred configuration option if both `insightsKey` and `customSecret` are specified.
  insightsKey: ""
  # -- Name of the Secret object where the license key is stored
  customSecretName: ""
  # -- Key in the Secret object where the license key is stored
  customSecretLicenseKey: ""

  # -- Additional labels for chart objects
  labels: {}
  # -- Additional labels for chart pods
  podLabels: {}

  images:
    # -- Changes the registry where to get the images. Useful when there is an internal image cache/proxy
    registry: ""
    # -- Set secrets to be able to fetch images
    pullSecrets: []

  serviceAccount:
    # -- Add these annotations to the service account we create
    annotations: {}
    # -- Configures if the service account should be created or not
    create:
    # -- Change the name of the service account. This is honored if you disable on this chart the creation of the service account so you can use your own
    name:

  # -- (bool) Sets pod's hostNetwork
  # @default -- false
  hostNetwork:
  # -- Sets pod's dnsConfig
  dnsConfig: {}

  # -- Sets pod's priorityClassName
  priorityClassName: ""
  # -- Sets security context (at pod level)
  podSecurityContext: {}
  # -- Sets security context (at container level)
  containerSecurityContext: {}

  # -- Sets pod/node affinities
  affinity: {}
  # -- Sets pod's node selector
  nodeSelector: {}
  # -- Sets pod's tolerations to node taints
  tolerations: []

  # -- Adds extra attributes to the cluster and all the metrics emitted to the backend
  customAttributes: {}

  # -- (bool) Reduces number of metrics sent in order to reduce costs
  # @default -- false
  lowDataMode: true

  # -- (bool) In each integration it has different behavior. See [Further information](#values-managed-globally-3) but all aims to send less metrics to the backend to try to save costs |
  # @default -- false
  privileged: true

  # -- (bool) Must be set to `true` when deploying in an EKS Fargate environment
  # @default -- false
  fargate:

  # -- Configures the integration to send all HTTP/HTTPS request through the proxy in that URL. The URL should have a standard format like `https://user:password@hostname:port`
  proxy:  

  # -- (bool) Send the metrics to the staging backend. Requires a valid staging license key
  # @default -- false
  nrStaging:
  fedramp:
    # fedramp.enabled -- (bool) Enables FedRAMP
    # @default -- false
    enabled: 

  # -- (bool) Sets the debug logs to this integration or all integrations if it is set globally
  # @default -- false
  verboseLog:

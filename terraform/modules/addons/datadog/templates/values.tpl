datadog:
  apiKeyExistingSecret: ${secret_name}
  apm:
    instrumentation:
      enabled: true
      libVersions:
        java: "1"
        dotnet: "3"
        python: "2"
        js: "5"
        ruby: "2"
  logs:
    enabled: true
    containerCollectAll: true

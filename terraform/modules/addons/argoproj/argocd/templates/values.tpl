installCRDs: true
global:
  domain: gitops.${project_name}.kubediscovery.com

certificate:
  enabled: false

server:
  ingress:
    enabled: true
    ingressClassName: ${ingress_class}
    hostname: gitops.${project_name}.kubediscovery.com
    annotations:
      nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
      nginx.ingress.kubernetes.io/ssl-passthrough: "true"
    tls: false
  extraArgs:
    - --insecure
  service:
    type: ClusterIP
  extensions:
    enabled: true
    extensionList:
      - name: rollout-extension
        env:
          - name: EXTENSION_URL
            value: https://github.com/argoproj-labs/rollout-extension/releases/download/v0.3.5/extension.tar

configs:
  styles: |
    .nav-bar {
      background: #222;
    }
    .sidebar {
       background-color: #222;
     }
    .sidebar__logo span {
      display: "Synera sempre ao seu lado";
    }
    .sidebar__logo img {
      content: url(https://synera.com.br/wp-content/uploads/2022/09/logo-normal-branco-150x150.png);
    }
    .login .argo__logo {
      background-image: url(https://synera.com.br/wp-content/uploads/2022/09/1.png);
     }
    .login__box img {
      content: url(https://synera.com.br/wp-content/uploads/2024/01/logo-normal.png);
    }
    .logo-image img {
      content: url(https://synera.com.br/wp-content/uploads/2024/01/logo-normal.png);
    }
    .login {
      background-color: #222;
    }


  cm:
    ui.bannercontent: Synera, deploy de forma inteligente
    ui.bannerurl: "https://www.kubediscovery.com"
    ui.bannerpermanent: "true"
    ui.bannerposition: "top"
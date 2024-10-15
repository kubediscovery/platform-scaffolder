# Repository

Ao executar o template e criar o projeto, o mesmo irá criar um repositório no GitHub, dentro da organização da KubeDiscovery, esse repositório ficará disponível até o prazo final do seu ambiente de testes, depois o mesmo será destruído.

O repositório, terá a seguinte estrutura de diretórios:
```
.
├── .github/workflow
├── catalog
├── gitops
│   ├── helm
│   ├── apps
├── infra
│   ├── terraform
│   │   └── modules
│   │       ├── backstage
│   │       ├── idm
│   │       ├── law
│   │       ├── private_dns
│   │       └── rsg
├── src
│   └── cmd
```

Vamos entender um pouco dessa estrutura proposta e qual a funcionalidade de cada diretório.

1. .github/workflow: diretório que contém o workflow responsável por executar o Terraform;  
2. catalog: esse é um dos componentes que aparecerá no Backstage (componentes), condo parte do seu sistema provisionado;
3. gitops: diretório com os manifestos do kubernetes em geral;
   3.1 helm: diretório com o deploy do ArgoCD;
   3.2 apps: applications do ArgoCD, contendo todos os deployments necessários;
4. infra: contém os modulos do terraform que serão aplicados na cloud;
5. src: contém o código em Golang que será provisionado através do ArgoCD.

Portanto, o repositório conterá recurso para CI (continuous integrations) com o GitHub workflow, CD (continous delivery) com o ArgoCD e Argo Rollout, infra as code com o Terraform e um código simples de example.

**Futuras melhorias que teremos, são integrações com observability.**

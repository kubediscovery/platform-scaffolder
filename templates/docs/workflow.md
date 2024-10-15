# GitHub Workflow

Nessa etapa, teremos toda a estrutura que será executada com o CI, que são:

1. Scan de código com o Trivy;
2. Build do container que temos com o código em Golang;
3. Execução do Terraform para o provisionamento da infraestrutura;
4. Deploy do ArgoCD através do Helm.


Com essa estrutura básica, conseguimos abranger muitas áreas do processo de Workflow.  Aqui estamos usando o GitHub como exemplo, mas poderia ser qualquer outra ferramenta de CI.

Fizemos uma abordagem de Usar o Argo Workflow no fluxo, que se torna bem interessante, pois acaba-se utilizando toda a stack do ArgoProj.

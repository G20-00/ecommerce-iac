
# Ecommerce Infrastructure as Code (IAC)

Este repositorio contiene la infraestructura como código (IaC) necesaria para desplegar y administrar los recursos de un sistema de comercio electrónico en Azure utilizando Terraform.

## Estructura del Proyecto

El proyecto está organizado en los siguientes módulos de Terraform:

- `resource_group`: Crea un grupo de recursos en Azure.
- `storage_account`: Configura una cuenta de almacenamiento en Azure.
- `storage_share`: Configura un recurso de almacenamiento compartido.
- `virtual_network`: Configura una red virtual en Azure.
- `subnet`: Configura una subred dentro de la red virtual.
- `network_security_group`: Configura un grupo de seguridad de red.
- `redis_cache`: Configura un caché Redis en Azure.
- `aks_ecommerce`: Despliega un clúster de Kubernetes gestionado a través de Azure Kubernetes Service.
- `cr_ecommerce_auto`: Utiliza Azure Container Registry para almacenar y gestionar imágenes de contenedores Docker.
- `ecommerce_autoiac_mysqlserver`: Proporciona un servidor MySQL para almacenamiento de datos relacionales.
- `mysonarcube`: Aloja SonarQube para análisis de código y aseguramiento de calidad.
- `mysonarqubestorage`: Guarda datos y archivos relacionados con operaciones de SonarQube.
- `ni_ecommerce`: Conecta máquinas virtuales y otros recursos, permitiendo una comunicación fluida.
- `nsg_ecommerce`: Controla el tráfico hacia y desde los recursos, asegurando que solo el tráfico autorizado tenga acceso.
- `password_redis_auto`: Gestiona contraseñas y claves utilizando Azure Key Vault.
- `redis_auto`: Proporciona almacenamiento en caché en memoria para datos frecuentemente solicitados.

Además, el proyecto incluye los siguientes workflows en GitHub Actions para la automatización y la integración continua:

- `infracost.yml`: Calcula y muestra el costo de los recursos de infraestructura desplegados.
- `terraform-pr.yml`: Ejecuta las acciones necesarias para validar los cambios en los pull requests utilizando Terraform.
- `terraform-release.yml`: Gestiona el proceso de lanzamiento de la infraestructura con Terraform.
- `terraform-state.yml`: Realiza el manejo del estado de la infraestructura asegurando la consistencia de los despliegues.

Cada módulo y workflow está diseñado para asegurar la eficiencia y seguridad del sistema de comercio electrónico, asegurando que los recursos sean gestionados de manera óptima.


## Estructura de Carpetas

```
ecommerce-iac/
├── .git/
├── .github/
│   ├── workflows/
│   │   ├── infracost.yml
│   │   ├── terraform-pr.yml
│   │   ├── terraform-release.yml
│   │   ├── terraform-state.yml
├── terraform/
│   ├── modules/
│   │   ├── azurerm/
│   │   │   ├── network_security_group/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── redis_cache/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── resource_group/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── storage_account/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── storage_share/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── subnet/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── virtual_network/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── aks_ecommerce/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── cr_ecommerce_auto/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── ecommerce_autoiac_mysqlserver/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── mysonarcube/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── mysonarqubestorage/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── ni_ecommerce/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── nsg_ecommerce/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── password_redis_auto/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
│   │   │   ├── redis_auto/
│   │   │   │   ├── main.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   ├── variables.tf
├── main.tf
├── outputs.tf
├── variables.tf
├── README.md
```

## Archivos Principales

### main.tf

Define los recursos principales y las configuraciones del proyecto. Aquí se incluyen las declaraciones de los módulos y la lógica principal para crear y configurar los recursos en Azure.

### outputs.tf

Define las salidas que se mostrarán después de aplicar el plan de Terraform. Las salidas son útiles para obtener información sobre los recursos creados, como el ID de un recurso o su dirección IP.

### variables.tf

Define las variables usadas en los módulos de Terraform. Las variables permiten parametrizar las configuraciones, facilitando la reutilización y el mantenimiento del código.

## Requisitos

- [Terraform](https://www.terraform.io/downloads.html) v0.14 o superior
- Una cuenta de [Azure](https://azure.microsoft.com/)

## Configuración

1. **Clonar el repositorio**:
    ```sh
    git clone https://github.com/G20-00/ecommerce-iac.git
    cd ecommerce-iac
    ```

2. **Inicializar Terraform**:
    ```sh
    terraform init
    ```

3. **Definir las variables**:

    Cree un archivo `terraform.tfvars` con el siguiente contenido (modifique los valores según sus necesidades):
    ```hcl
    resource_group_name = "mi-grupo-de-recursos"
    location            = "eastus"
    storage_account_name= "mistorageaccount"
    vnet_name           = "mivnet"
    subnet_name         = "misubnet"
    nsg_name            = "minsg"
    redis_cache_name    = "micache"
    ```

4. **Planificar la infraestructura**:
    ```sh
    terraform plan
    ```

5. **Aplicar la infraestructura**:
    ```sh
    terraform apply
    ```

## Descripción de los Módulos

### resource_group

- **main.tf**: Define el grupo de recursos en Azure.
- **outputs.tf**: Exporta el nombre del grupo de recursos.
- **variables.tf**: Define las variables para el nombre del grupo de recursos y la ubicación.

### storage_account

- **main.tf**: Configura una cuenta de almacenamiento en Azure.
- **outputs.tf**: Exporta el nombre de la cuenta de almacenamiento.
- **variables.tf**: Define las variables para la cuenta de almacenamiento.

### storage_share

- **main.tf**: Configura un recurso de almacenamiento compartido.
- **outputs.tf**: Exporta el nombre del recurso de almacenamiento compartido.
- **variables.tf**: Define las variables para el almacenamiento compartido.

### virtual_network

- **main.tf**: Configura una red virtual en Azure.
- **outputs.tf**: Exporta el nombre de la red virtual.
- **variables.tf**: Define las variables para la red virtual.

### subnet

- **main.tf**: Configura una subred dentro de la red virtual.
- **outputs.tf**: Exporta el nombre de la subred.
- **variables.tf**: Define las variables para la subred.

### network_security_group

- **main.tf**: Configura un grupo de seguridad de red.
- **outputs.tf**: Exporta el nombre del grupo de seguridad.
- **variables.tf**: Define las variables para el grupo de seguridad.

### redis_cache

- **main.tf**: Configura un caché Redis en Azure.
- **outputs.tf**: Exporta el nombre del caché Redis.
- **variables.tf**: Define las variables para el caché Redis.

### aks_ecommerce

- **main.tf**: Despliega un clúster de Kubernetes gestionado a través de Azure Kubernetes Service.
- **outputs.tf**: Exporta información relevante del clúster de Kubernetes.
- **variables.tf**: Define las variables para el clúster de Kubernetes.

### cr_ecommerce_auto

- **main.tf**: Utiliza Azure Container Registry para almacenar y gestionar imágenes de contenedores Docker.
- **outputs.tf**: Exporta información del registro de contenedores.
- **variables.tf**: Define las variables para el registro de contenedores.

### ecommerce_autoiac_mysqlserver

- **main.tf**: Proporciona un servidor MySQL para almacenamiento de datos relacionales.
- **outputs.tf**: Exporta información del servidor MySQL.
- **variables.tf**: Define las variables para el servidor MySQL.

### mysonarcube

- **main.tf**: Aloja SonarQube para análisis de código y aseguramiento de calidad.
- **outputs.tf**: Exporta información de SonarQube.
- **variables.tf**: Define las variables para SonarQube.

### mysonarqubestorage

- **main.tf**: Guarda datos y archivos relacionados con operaciones de SonarQube.
- **outputs.tf**: Exporta información del almacenamiento de SonarQube.
- **variables.tf**: Define las variables para el almacenamiento de SonarQube.

### ni_ecommerce

- **main.tf**: Conecta máquinas virtuales y otros recursos, permitiendo una comunicación fluida.
- **outputs.tf**: Exporta información de la interfaz de red.
- **variables.tf**: Define las variables para la interfaz de red.

### nsg_ecommerce

- **main.tf**: Controla el tráfico hacia y desde los recursos, asegurando que solo el tráfico autorizado tenga acceso.
- **outputs.tf**: Exporta información del grupo de seguridad.
- **variables.tf**: Define las variables para el grupo de seguridad.

### password_redis_auto

- **main.tf**: Gestiona contraseñas y claves utilizando Azure Key Vault.
- **outputs.tf**: Exporta información del almacén de claves.
- **variables.tf**: Define las variables para el almacén de claves.

### redis_auto

- **main.tf**: Proporciona almacenamiento en caché en memoria para datos frecuentemente solicitados.
- **outputs.tf**: Exporta información del caché Redis.
- **variables.tf**: Define las variables para el caché Redis.

## Comandos Útiles

### Inicialización de Terraform

# Comandos Útiles

## Inicialización de Terraform

```sh
    terraform init
```
Este comando prepara el entorno de trabajo de Terraform, descargando los proveedores necesarios y configurando el backend.

## Planificación de la Infraestructura

```sh
    terraform plan
```
Este comando crea un plan de ejecución, mostrando las acciones que Terraform realizará para alcanzar el estado deseado de la infraestructura.

## Aplicación de la Infraestructura

```sh
    terraform apply
```
Este comando aplica los cambios necesarios para alcanzar el estado deseado de la infraestructura, según lo definido en los archivos de configuración de Terraform.

# Comandos para Correr Grafana

## Port-Forward de Grafana

Para acceder a Grafana desde tu máquina local, necesitas hacer un port-forwarding desde el servicio de Grafana en tu clúster de Kubernetes.

1. Identifica el servicio de Grafana:

```sh
    kubectl get svc -n kube-public
```

Busca el nombre del servicio de Grafana, por ejemplo, `kube-prometheus-stackr-grafana`.

2. Ejecuta el port-forwarding:

```sh
    kubectl port-forward svc/kube-prometheus-stackr-grafana 3000:80 -n kube-public
```

Este comando redirige el puerto 80 del servicio de Grafana al puerto 3000 en tu máquina local.

## Acceso a Grafana

Después de ejecutar el port-forwarding, puedes acceder a Grafana abriendo tu navegador web y navegando a:

```sh
    http://localhost:3000
```

Esta URL te permitirá acceder a la interfaz de Grafana localmente.

# Comandos Adicionales para Kubernetes y Grafana

## Listar Pods

```sh
    kubectl get pods -n kube-public
```
Este comando lista todos los pods en el namespace `kube-public`.

## Describir un Pod

```sh
    kubectl describe pod <pod-name> -n kube-public
```
Este comando proporciona información detallada sobre un pod específico.

## Ver los Logs de un Pod

```sh
    kubectl logs <pod-name> -n kube-public
```
Este comando muestra los logs de un pod específico, útil para depurar problemas.


## Contribuciones

Las contribuciones son bienvenidas. Para contribuir, siga estos pasos:

1. Haga un fork del proyecto.
2. Cree una nueva rama (`git checkout -b feature/nueva-caracteristica`).
3. Realice sus cambios y haga commit (`git commit -am 'Agregar nueva característica'`).
4. Empuje su rama (`git push origin feature/nueva-caracteristica`).
5. Cree un nuevo Pull Request.

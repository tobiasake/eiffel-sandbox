<!---
   Copyright 2018 Ericsson AB.
   For a full list of individual contributors, please see the commit history.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
--->

<img src="./images/logo.png" alt="Eiffel Sandbox" width="350"/>

# Eiffel Sandbox
The Eiffel Sandbox provides a Docker image where multiple Eiffel [actors and event services](http://eiffel-community.github.io/eiffel-sepia) are pre-configured in a single life-like environment. This lets users and developers play around with and try out Eiffel concepts and implementations in a safe setting with a minimum of effort. To get started, see __How to Run__ and __How it Works__ below.

__Note:__ At present, the sandbox includes several implementations to be contributed to open source in the very near future. The Docker images are available, but the sources are not yet. Please stay tuned for the sources to turn up on GitHub soon.

# About this repository
The contents of this repository are licensed under the [Apache License 2.0](./LICENSE).

To get involved, please see [Code of Conduct](./CODE_OF_CONDUCT.md) and [contribution guidelines](./CONTRIBUTING.md).

# About Eiffel
This repository forms part of the Eiffel Community. Eiffel is a protocol for technology agnostic machine-to-machine communication in continuous integration and delivery pipelines, aimed at securing scalability, flexibility and traceability. Eiffel is based on the concept of decentralized real time messaging, both to drive the continuous integration and delivery system and to document it.

Visit [Eiffel Community](https://eiffel-community.github.io) to get started and get involved.

# How to Run
To run the Eiffel Sandbox, you need Docker and Docker Compose.
1. Clone the repo: `git clone https://github.com/eiffel-community/eiffel-sandbox.git`
2. In the repo root, run Docker Compose: `docker-compose up`
To run specific services, add the service name to the command. For instance, to run only the event repository: `docker-compose up eiffel-er`. Service names can be found in <a href="docker-compose.yml">docker-compose.yml</a>.

This will started multiple Eiffel services and tools with Eiffel plugins. The containers of primary interest can be accessed at the exposed ports below. Note that the hostname depends on your local environment, and that all services are accessed from the host via these exposed mapped ports (`<hostname>:<port>`). The service names are only usable from within the Docker virtual network. For additional containers and detailed port configurations, please refer to <a href="docker-compose.yml">docker-compose.yml</a>.
* <a href="https://github.com/Ericsson/eiffel-intelligence">Eiffel Intelligence</a> Artifact Frontend: 8071
* <a href="https://github.com/Ericsson/eiffel-intelligence">Eiffel Intelligence</a> Source Change Frontend: 8073
* <a href="https://github.com/Ericsson/eiffel-intelligence">Eiffel Intelligence</a> Test Execution Frontend: 8075
* <a href="https://www.sonatype.com/nexus-repository-sonatype">Nexus Repository</a>: 8081
* <a href="https://jenkins.io">Jenkins</a> 1 with <a href="https://github.com/eiffel-community/eiffel-jenkins-plugin">Eiffel Jenkins Plugin</a>: 8082
* <a href="https://jenkins.io">Jenkins</a> 2 with <a href="https://github.com/eiffel-community/eiffel-jenkins-plugin">Eiffel Jenkins Plugin</a>: 8083
* <a href="https://github.com/eiffel-community/eiffel-vici">Eiffel Vici</a>: 8092
* <a href="https://github.com/eiffel-community/eiffel-event-repository">Eiffel Event Repository</a>: 8084
* <a href="https://github.com/Ericsson/eiffel-remrem">Remrem</a> Generate: 8095
* <a href="https://github.com/Ericsson/eiffel-remrem">Remrem</a> Publish: 8096
* <a href="https://rabbitmq.com">RabbitMQ</a>: 15672

To stop the services, hit `ctrl + c`, then run `docker-compose down --volumes`. Note that this will keep the images cached, which will shorten the startup time. Further volume and image management via regular Docker commands (see <a href="https://docs.docker.com/">Docker Documentation</a>).

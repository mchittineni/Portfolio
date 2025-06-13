<template>
  <section id="skills" class="py-20 bg-white">
    <div class="container mx-auto px-6">
      <h2 class="text-4xl font-bold text-center mb-16 text-gray-800">Technical Skills</h2>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <!-- Programming Languages -->
        <div
          class="bg-white p-8 rounded-2xl shadow-lg transform hover:scale-105 transition-all duration-300 border border-gray-100"
        >
          <div class="w-12 h-12 bg-blue-50 rounded-xl flex items-center justify-center mb-6">
            <svg
              class="w-6 h-6 text-blue-600"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4"
              />
            </svg>
          </div>
          <h3 class="text-2xl font-semibold mb-6 text-gray-800">Programming Languages</h3>
          <div class="grid grid-cols-2 gap-6">
            <a
              href="https://www.python.org/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Python"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-blue-600 transition-colors"
                >Python</span
              >
            </a>

            <a
              href="https://www.java.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Java"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-blue-600 transition-colors"
                >Java</span
              >
            </a>

            <a
              href="https://www.javascript.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="JavaScript"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-blue-600 transition-colors"
                >JavaScript</span
              >
            </a>

            <a
              href="https://www.typescriptlang.org/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="TypeScript"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-blue-600 transition-colors"
                >TypeScript</span
              >
            </a>
          </div>
        </div>

        <!-- Cloud & Infrastructure -->
        <div
          class="bg-white p-8 rounded-2xl shadow-lg transform hover:scale-105 transition-all duration-300 border border-gray-100"
        >
          <div class="w-12 h-12 bg-purple-50 rounded-xl flex items-center justify-center mb-6">
            <svg
              class="w-6 h-6 text-purple-600"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M3 15a4 4 0 004 4h9a5 5 0 10-.1-9.999 5.002 5.002 0 10-9.78 2.096A4.001 4.001 0 003 15z"
              />
            </svg>
          </div>
          <h3 class="text-2xl font-semibold mb-6 text-gray-800">Cloud & Infrastructure</h3>
          <div class="grid grid-cols-2 gap-6">
            <a
              href="https://aws.amazon.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="AWS"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-purple-600 transition-colors"
                >AWS</span
              >
            </a>

            <a
              href="https://azure.microsoft.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Azure"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-purple-600 transition-colors"
                >Azure</span
              >
            </a>

            <a
              href="https://cloud.google.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/googlecloud/googlecloud-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="GCP"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-purple-600 transition-colors"
                >GCP</span
              >
            </a>

            <a
              href="https://www.oracle.com/cloud/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/oracle/oracle-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Oracle"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-purple-600 transition-colors"
                >Oracle</span
              >
            </a>
          </div>
        </div>

        <!-- DevOps Tools -->
        <div
          class="bg-white p-8 rounded-2xl shadow-lg transform hover:scale-105 transition-all duration-300 border border-gray-100"
        >
          <div class="w-12 h-12 bg-green-50 rounded-xl flex items-center justify-center mb-6">
            <svg
              class="w-6 h-6 text-green-600"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"
              />
            </svg>
          </div>
          <h3 class="text-2xl font-semibold mb-6 text-gray-800">DevOps Tools</h3>
          <div class="grid grid-cols-2 gap-6">
            <a
              href="https://www.docker.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Docker"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-green-600 transition-colors"
                >Docker</span
              >
            </a>

            <a
              href="https://kubernetes.io/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Kubernetes"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-green-600 transition-colors"
                >Kubernetes</span
              >
            </a>

            <a
              href="https://www.terraform.io/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/terraform/terraform-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Terraform"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-green-600 transition-colors"
                >Terraform</span
              >
            </a>

            <a
              href="https://www.ansible.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ansible/ansible-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Ansible"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-green-600 transition-colors"
                >Ansible</span
              >
            </a>
          </div>
        </div>

        <!-- CI/CD & Automation -->
        <div
          class="bg-white p-8 rounded-2xl shadow-lg transform hover:scale-105 transition-all duration-300 border border-gray-100"
        >
          <div class="w-12 h-12 bg-red-50 rounded-xl flex items-center justify-center mb-6">
            <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M13 10V3L4 14h7v7l9-11h-7z"
              />
            </svg>
          </div>
          <h3 class="text-2xl font-semibold mb-6 text-gray-800">CI/CD & Automation</h3>
          <div class="grid grid-cols-2 gap-6">
            <a
              href="https://www.jenkins.io/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jenkins/jenkins-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Jenkins"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-red-600 transition-colors"
                >Jenkins</span
              >
            </a>

            <a
              href="https://github.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="GitHub"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-red-600 transition-colors"
                >GitHub</span
              >
            </a>

            <a
              href="https://about.gitlab.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/gitlab/gitlab-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="GitLab"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-red-600 transition-colors"
                >GitLab</span
              >
            </a>

            <a
              href="https://bitbucket.org/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bitbucket/bitbucket-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Bitbucket"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-red-600 transition-colors"
                >Bitbucket</span
              >
            </a>
          </div>
        </div>

        <!-- Monitoring & Security -->
        <div
          class="bg-white p-8 rounded-2xl shadow-lg transform hover:scale-105 transition-all duration-300 border border-gray-100"
        >
          <div class="w-12 h-12 bg-yellow-50 rounded-xl flex items-center justify-center mb-6">
            <svg
              class="w-6 h-6 text-yellow-600"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"
              />
            </svg>
          </div>
          <h3 class="text-2xl font-semibold mb-6 text-gray-800">Monitoring & Security</h3>
          <div class="grid grid-cols-2 gap-6">
            <a
              href="https://www.datadoghq.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://www.vectorlogo.zone/logos/datadoghq/datadoghq-icon.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Datadog"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-yellow-600 transition-colors"
                >Datadog</span
              >
            </a>

            <a
              href="https://grafana.com/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/grafana/grafana-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Grafana"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-yellow-600 transition-colors"
                >Grafana</span
              >
            </a>

            <a
              href="https://prometheus.io/"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/prometheus/prometheus-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="Prometheus"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-yellow-600 transition-colors"
                >Prometheus</span
              >
            </a>

            <a
              href="https://www.elastic.co/what-is/elk-stack"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center space-x-3 group"
            >
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/elasticsearch/elasticsearch-original.svg"
                class="w-8 h-8 group-hover:scale-125 transition-transform"
                alt="ELK"
              />
              <span
                class="text-sm font-medium text-gray-600 group-hover:text-yellow-600 transition-colors"
                >ELK Stack</span
              >
            </a>
          </div>
        </div>

        <!-- Additional Skills -->
        <div
          class="bg-white p-8 rounded-2xl shadow-lg transform hover:scale-105 transition-all duration-300 border border-gray-100"
        >
          <div class="w-12 h-12 bg-indigo-50 rounded-xl flex items-center justify-center mb-6">
            <svg
              class="w-6 h-6 text-indigo-600"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"
              />
            </svg>
          </div>
          <h3 class="text-2xl font-semibold mb-6 text-gray-800">Additional Skills</h3>
          <div class="space-y-4">
            <div class="flex items-center justify-between">
              <span class="text-sm font-medium text-gray-600">Git</span>
              <div class="w-32 h-2 bg-gray-100 rounded-full">
                <div class="w-28 h-2 bg-indigo-600 rounded-full"></div>
              </div>
            </div>

            <div class="flex items-center justify-between">
              <span class="text-sm font-medium text-gray-600">SonarQube</span>
              <div class="w-32 h-2 bg-gray-100 rounded-full">
                <div class="w-24 h-2 bg-indigo-600 rounded-full"></div>
              </div>
            </div>

            <div class="flex items-center justify-between">
              <span class="text-sm font-medium text-gray-600">JUnit</span>
              <div class="w-32 h-2 bg-gray-100 rounded-full">
                <div class="w-[104px] h-2 bg-indigo-600 rounded-full"></div>
              </div>
            </div>

            <div class="flex items-center justify-between">
              <span class="text-sm font-medium text-gray-600">Maven</span>
              <div class="w-32 h-2 bg-gray-100 rounded-full">
                <div class="w-24 h-2 bg-indigo-600 rounded-full"></div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Certifications Section -->
      <div class="mt-20">
        <h3 class="text-3xl font-bold text-center mb-12 text-gray-800">Certifications</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-6xl mx-auto">
          <a
            href="https://www.credly.com/badges/5f18e335-13fb-4ccc-994d-ed8e422a0f3b/linked_in_profile"
            target="_blank"
            rel="noopener noreferrer"
            class="bg-white p-6 rounded-xl shadow-md border border-gray-100 transform hover:scale-105 transition-all duration-300 block group"
          >
            <div class="flex items-center space-x-4">
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg"
                class="w-10 h-10 group-hover:scale-110 transition-transform"
                alt="AWS"
              />
              <h4 class="font-semibold text-gray-800 group-hover:text-blue-600 transition-colors">
                AWS Certified Solutions Architect – Associate
              </h4>
            </div>
          </a>

          <a
            href="https://www.credential.net/b488aa0d-d156-499c-91a0-4132f12a97a2?key=b37942efb1541e72a4a40381246efedb424c60c551fa2b7b7baff5573d77948a#acc.5B3UOSQI"
            target="_blank"
            rel="noopener noreferrer"
            class="bg-white p-6 rounded-xl shadow-md border border-gray-100 transform hover:scale-105 transition-all duration-300 block group"
          >
            <div class="flex items-center space-x-4">
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/googlecloud/googlecloud-original.svg"
                class="w-10 h-10 group-hover:scale-110 transition-transform"
                alt="GCP"
              />
              <h4 class="font-semibold text-gray-800 group-hover:text-blue-600 transition-colors">
                Google Cloud Associate Cloud Engineer
              </h4>
            </div>
          </a>

          <a
            href="https://www.credly.com/badges/5b2e93b4-470a-4d8c-b4b7-3c0cbd10cd6a?source=linked_in_profile"
            target="_blank"
            rel="noopener noreferrer"
            class="bg-white p-6 rounded-xl shadow-md border border-gray-100 transform hover:scale-105 transition-all duration-300 block group"
          >
            <div class="flex items-center space-x-4">
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg"
                class="w-10 h-10 group-hover:scale-110 transition-transform"
                alt="Azure"
              />
              <h4 class="font-semibold text-gray-800 group-hover:text-blue-600 transition-colors">
                Microsoft Azure Fundamentals – AZ-900
              </h4>
            </div>
          </a>

          <a
            href="https://www.credly.com/badges/fda35ffe-a6ba-473a-b5ae-48aebba457d8?source=linked_in_profile"
            target="_blank"
            rel="noopener noreferrer"
            class="bg-white p-6 rounded-xl shadow-md border border-gray-100 transform hover:scale-105 transition-all duration-300 block group"
          >
            <div class="flex items-center space-x-4">
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg"
                class="w-10 h-10 group-hover:scale-110 transition-transform"
                alt="Azure AI"
              />
              <h4 class="font-semibold text-gray-800 group-hover:text-blue-600 transition-colors">
                Microsoft Azure AI Fundamentals – AI-900
              </h4>
            </div>
          </a>

          <a
            href="https://education.oracle.com/oracle-cloud-infrastructure-developer-2025-associate/pexam_1Z0-1084-25"
            target="_blank"
            rel="noopener noreferrer"
            class="bg-white p-6 rounded-xl shadow-md border border-gray-100 transform hover:scale-105 transition-all duration-300 block group"
          >
            <div class="flex items-center space-x-4">
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/oracle/oracle-original.svg"
                class="w-10 h-10 group-hover:scale-110 transition-transform"
                alt="Oracle"
              />
              <h4 class="font-semibold text-gray-800 group-hover:text-blue-600 transition-colors">
                Oracle Cloud Infrastructure Developer
              </h4>
            </div>
          </a>

          <a
            href="https://education.oracle.com/oracle-cloud-infrastructure-2025-architect-associate/pexam_1Z0-1072-25"
            target="_blank"
            rel="noopener noreferrer"
            class="bg-white p-6 rounded-xl shadow-md border border-gray-100 transform hover:scale-105 transition-all duration-300 block group"
          >
            <div class="flex items-center space-x-4">
              <img
                src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/oracle/oracle-original.svg"
                class="w-10 h-10 group-hover:scale-110 transition-transform"
                alt="Oracle"
              />
              <h4 class="font-semibold text-gray-800 group-hover:text-blue-600 transition-colors">
                Oracle Cloud Infrastructure Architect
              </h4>
            </div>
          </a>
        </div>
      </div>
    </div>
  </section>
</template>

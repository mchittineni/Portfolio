<template>
  <section id="skills" class="py-20 bg-gray-50 dark:bg-gray-900">
    <div class="container mx-auto px-6">
      <h2 class="heading-2 text-center mb-12 text-gray-800 dark:text-white">
        Technical Skills
      </h2>
      
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <!-- Cloud & Infrastructure -->
        <div class="card group hover:border-emerald-500">
          <div class="w-12 h-12 bg-emerald-50 dark:bg-emerald-900/30 rounded-xl flex items-center justify-center mb-6">
            <svg class="w-6 h-6 text-emerald-600 dark:text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 15a4 4 0 004 4h9a5 5 0 10-.1-9.999 5.002 5.002 0 10-9.78 2.096A4.001 4.001 0 003 15z" />
            </svg>
          </div>
          <h3 class="heading-3 mb-4 text-gray-800 dark:text-white">Cloud & Infrastructure</h3>
          <div class="grid grid-cols-2 gap-4 mb-6">
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="AWS" />
              <span class="text-sm text-gray-600 dark:text-gray-300">AWS</span>
            </div>
            
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="Azure" />
              <span class="text-sm text-gray-600 dark:text-gray-300">Azure</span>
            </div>
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/googlecloud/googlecloud-original.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="GCP" />
              <span class="text-sm text-gray-600 dark:text-gray-300">GCP</span>
            </div>
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/oracle/oracle-original.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="Oracle" />
              <span class="text-sm text-gray-600 dark:text-gray-300">Oracle</span>
            </div>
          </div>
          <div class="space-y-3">
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">Terraform</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-28 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">Ansible</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-24 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">Docker</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-28 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">Kubernetes</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-26 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
          </div>
        </div>

        <!-- CI/CD & Automation -->
        <div class="card group hover:border-emerald-500">
          <div class="w-12 h-12 bg-emerald-50 dark:bg-emerald-900/30 rounded-xl flex items-center justify-center mb-6">
            <svg class="w-6 h-6 text-emerald-600 dark:text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
            </svg>
          </div>
          <h3 class="heading-3 mb-4 text-gray-800 dark:text-white">CI/CD & Automation</h3>
          <div class="grid grid-cols-2 gap-4 mb-6">
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jenkins/jenkins-original.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="Jenkins" />
              <span class="text-sm text-gray-600 dark:text-gray-300">Jenkins</span>
            </div>
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="GitHub" />
              <span class="text-sm text-gray-600 dark:text-gray-300">GitHub</span>
            </div>
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/gitlab/gitlab-original.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="GitLab" />
              <span class="text-sm text-gray-600 dark:text-gray-300">GitLab</span>
            </div>
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bitbucket/bitbucket-original.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="Bitbucket" />
              <span class="text-sm text-gray-600 dark:text-gray-300">Bitbucket</span>
            </div>
          </div>
          <div class="space-y-3">
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">Git</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-28 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">SonarQube</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-24 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">JUnit</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-26 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">Maven</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-24 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
          </div>
        </div>

        <!-- Monitoring & Security -->
        <div class="card group hover:border-emerald-500">
          <div class="w-12 h-12 bg-emerald-50 dark:bg-emerald-900/30 rounded-xl flex items-center justify-center mb-6">
            <svg class="w-6 h-6 text-emerald-600 dark:text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
            </svg>
          </div>
          <h3 class="heading-3 mb-4 text-gray-800 dark:text-white">Monitoring & Security</h3>
          <div class="grid grid-cols-2 gap-4 mb-6">
            <div class="flex items-center space-x-2 group">
              <img src="https://www.vectorlogo.zone/logos/datadoghq/datadoghq-icon.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="Datadog" />
              <span class="text-sm text-gray-600 dark:text-gray-300">Datadog</span>
            </div>
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/grafana/grafana-original.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="Grafana" />
              <span class="text-sm text-gray-600 dark:text-gray-300">Grafana</span>
            </div>
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/prometheus/prometheus-original.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="Prometheus" />
              <span class="text-sm text-gray-600 dark:text-gray-300">Prometheus</span>
            </div>
            <div class="flex items-center space-x-2 group">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/elasticsearch/elasticsearch-original.svg" class="w-6 h-6 group-hover:scale-125 transition-transform" alt="ELK" />
              <span class="text-sm text-gray-600 dark:text-gray-300">ELK Stack</span>
            </div>
          </div>
          <div class="space-y-3">
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">AWS Security</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-28 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">Cloud Security</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-26 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">Incident Response</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-24 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
            <div class="flex items-center justify-between">
              <span class="text-sm text-gray-600 dark:text-gray-300">Compliance</span>
              <div class="w-32 h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
                <div class="w-26 h-2 bg-emerald-500 rounded-full"></div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Certifications -->
      <div class="mt-16">
        <h3 class="heading-3 text-center mb-8 text-gray-800 dark:text-white">
          Certifications
        </h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-4xl mx-auto">
          <div class="card group hover:border-emerald-500">
            <div class="flex items-center space-x-3">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" class="w-8 h-8" alt="AWS" />
              <h4 class="font-semibold text-gray-800 dark:text-white">AWS Certified Solutions Architect - Associate</h4>
            </div>
          </div>
          <div class="card group hover:border-emerald-500">
            <div class="flex items-center space-x-3">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/googlecloud/googlecloud-original.svg" class="w-8 h-8" alt="GCP" />
              <h4 class="font-semibold text-gray-800 dark:text-white">Google Cloud Platform Associate Cloud Engineer</h4>
            </div>
          </div>
          <div class="card group hover:border-emerald-500">
            <div class="flex items-center space-x-3">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg" class="w-8 h-8" alt="Azure" />
              <h4 class="font-semibold text-gray-800 dark:text-white">Microsoft Azure Fundamentals – AZ 900</h4>
            </div>
          </div>
          <div class="card group hover:border-emerald-500">
            <div class="flex items-center space-x-3">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg" class="w-8 h-8" alt="Azure" />
              <h4 class="font-semibold text-gray-800 dark:text-white">Microsoft Azure AI Fundamentals – AI 900</h4>
            </div>
          </div>
          <div class="card group hover:border-emerald-500">
            <div class="flex items-center space-x-3">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/oracle/oracle-original.svg" class="w-8 h-8" alt="Oracle" />
              <h4 class="font-semibold text-gray-800 dark:text-white">Oracle Cloud Infrastructure Developer 2020</h4>
            </div>
          </div>
          <div class="card group hover:border-emerald-500">
            <div class="flex items-center space-x-3">
              <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/oracle/oracle-original.svg" class="w-8 h-8" alt="Oracle" />
              <h4 class="font-semibold text-gray-800 dark:text-white">Oracle Cloud Infrastructure 2019</h4>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template> 
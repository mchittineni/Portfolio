<template>
  <section id="skills" class="py-20 bg-gradient-to-br from-gray-50 to-gray-100">
    <div class="container mx-auto px-6">
      <h2 class="text-4xl font-bold text-center mb-12 bg-gradient-to-r from-purple-600 to-pink-500 bg-clip-text text-transparent">
        Technical Skills
      </h2>
      
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <!-- Cloud & Infrastructure -->
        <div class="bg-white p-8 rounded-2xl shadow-lg transform hover:scale-105 transition-all duration-300 border border-purple-100">
          <div class="w-12 h-12 bg-purple-100 rounded-xl flex items-center justify-center mb-6">
            <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 15a4 4 0 004 4h9a5 5 0 10-.1-9.999 5.002 5.002 0 10-9.78 2.096A4.001 4.001 0 003 15z" />
            </svg>
          </div>
          <h3 class="text-2xl font-semibold mb-4 text-purple-600">Cloud & Infrastructure</h3>
          <ul class="space-y-3">
            <li class="flex items-center">
              <span class="w-2 h-2 bg-purple-600 rounded-full mr-3"></span>
              AWS, Azure, GCP, Oracle Cloud
            </li>
            <li class="flex items-center">
              <span class="w-2 h-2 bg-purple-600 rounded-full mr-3"></span>
              Terraform, Ansible, Chef, Puppet
            </li>
            <li class="flex items-center">
              <span class="w-2 h-2 bg-purple-600 rounded-full mr-3"></span>
              Docker, Kubernetes
            </li>
            <li class="flex items-center">
              <span class="w-2 h-2 bg-purple-600 rounded-full mr-3"></span>
              Infrastructure as Code (IaC)
            </li>
          </ul>
        </div>

        <!-- CI/CD & Automation -->
        <div class="bg-white p-8 rounded-2xl shadow-lg transform hover:scale-105 transition-all duration-300 border border-pink-100">
          <div class="w-12 h-12 bg-pink-100 rounded-xl flex items-center justify-center mb-6">
            <svg class="w-6 h-6 text-pink-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
            </svg>
          </div>
          <h3 class="text-2xl font-semibold mb-4 text-pink-600">CI/CD & Automation</h3>
          <ul class="space-y-3">
            <li class="flex items-center">
              <span class="w-2 h-2 bg-pink-600 rounded-full mr-3"></span>
              Jenkins, GitHub Actions
            </li>
            <li class="flex items-center">
              <span class="w-2 h-2 bg-pink-600 rounded-full mr-3"></span>
              AWS CodePipeline, Azure DevOps
            </li>
            <li class="flex items-center">
              <span class="w-2 h-2 bg-pink-600 rounded-full mr-3"></span>
              Git, GitHub
            </li>
            <li class="flex items-center">
              <span class="w-2 h-2 bg-pink-600 rounded-full mr-3"></span>
              SonarQube, JUnit
            </li>
          </ul>
        </div>

        <!-- Monitoring & Security -->
        <div class="bg-white p-8 rounded-2xl shadow-lg transform hover:scale-105 transition-all duration-300 border border-red-100">
          <div class="w-12 h-12 bg-red-100 rounded-xl flex items-center justify-center mb-6">
            <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
            </svg>
          </div>
          <h3 class="text-2xl font-semibold mb-4 text-red-600">Monitoring & Security</h3>
          <ul class="space-y-3">
            <li class="flex items-center">
              <span class="w-2 h-2 bg-red-600 rounded-full mr-3"></span>
              Datadog, Grafana, Prometheus
            </li>
            <li class="flex items-center">
              <span class="w-2 h-2 bg-red-600 rounded-full mr-3"></span>
              AWS Security Hub, IAM
            </li>
            <li class="flex items-center">
              <span class="w-2 h-2 bg-red-600 rounded-full mr-3"></span>
              Cloud Security
            </li>
            <li class="flex items-center">
              <span class="w-2 h-2 bg-red-600 rounded-full mr-3"></span>
              Incident Management
            </li>
          </ul>
        </div>
      </div>

      <!-- Certifications -->
      <div class="mt-16">
        <h3 class="text-2xl font-bold text-center mb-8 bg-gradient-to-r from-purple-600 to-pink-500 bg-clip-text text-transparent">
          Certifications
        </h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-4xl mx-auto">
          <div class="bg-white p-6 rounded-xl shadow-md border border-purple-100">
            <h4 class="font-semibold text-purple-600">AWS Certified Solutions Architect - Associate</h4>
          </div>
          <div class="bg-white p-6 rounded-xl shadow-md border border-pink-100">
            <h4 class="font-semibold text-pink-600">Google Cloud Platform Associate Cloud Engineer</h4>
          </div>
          <div class="bg-white p-6 rounded-xl shadow-md border border-red-100">
            <h4 class="font-semibold text-red-600">Microsoft Azure Fundamentals – AZ 900</h4>
          </div>
          <div class="bg-white p-6 rounded-xl shadow-md border border-purple-100">
            <h4 class="font-semibold text-purple-600">Microsoft Azure AI Fundamentals – AI 900</h4>
          </div>
          <div class="bg-white p-6 rounded-xl shadow-md border border-pink-100">
            <h4 class="font-semibold text-pink-600">Oracle Cloud Infrastructure Developer 2020</h4>
          </div>
          <div class="bg-white p-6 rounded-xl shadow-md border border-red-100">
            <h4 class="font-semibold text-red-600">Oracle Cloud Infrastructure 2019</h4>
          </div>
        </div>
      </div>
    </div>
  </section>
</template> 
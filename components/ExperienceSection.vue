<template>
  <section id="experience" class="py-20 bg-white">
    <div class="container mx-auto px-6">
      <h2 class="text-4xl font-bold text-center mb-12 text-gray-800">Work Experience</h2>

      <div class="space-y-12">
        <!-- Senior DevOps Engineer -->
        <div
          class="bg-white p-8 rounded-2xl shadow-lg border border-gray-100 hover:scale-[1.02] transition-all duration-300"
        >
          <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6">
            <div>
              <h3 class="text-2xl font-semibold text-gray-800">DevOps Engineer</h3>
              <p class="text-gray-600">University of Exeter</p>
            </div>
            <span class="text-gray-500 mt-2 md:mt-0">Oct 2022 - Present</span>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div class="bg-gray-50 p-4 rounded-xl text-center">
              <div class="text-3xl font-bold text-indigo-600">45%</div>
              <div class="text-sm text-gray-600">Cost Reduction</div>
            </div>
            <div class="bg-gray-50 p-4 rounded-xl text-center">
              <div class="text-3xl font-bold text-green-600">60%</div>
              <div class="text-sm text-gray-600">Faster Deployments</div>
            </div>
            <div class="bg-gray-50 p-4 rounded-xl text-center">
              <div class="text-3xl font-bold text-blue-600">99.9%</div>
              <div class="text-sm text-gray-600">System Uptime</div>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-gray-600 text-sm">
            <div>
              <h4 class="font-semibold text-gray-800 mb-2">Cloud & Infrastructure (AWS)</h4>
              <ul class="list-disc list-inside space-y-1">
                <li>Multi-tier architecture design using EC2, VPC, Lambda, S3</li>
                <li>Infrastructure as Code with CloudFormation, CDK (TypeScript), Terraform</li>
                <li>Serverless & event-driven architecture using Lambda, EventBridge, AppSync</li>
                <li>Networking: VPC, Route53, Load Balancing, ACM</li>
                <li>Content delivery via CloudFront, DNS with Route 53</li>
                <li>Optimized cloud resources resulting in 45% cost savings</li>
                <li>Implemented disaster recovery solutions improving system resilience</li>
                <li>Managed Kubernetes clusters using EKS, Fargate for container orchestration</li>
              </ul>
            </div>

            <div>
              <h4 class="font-semibold text-gray-800 mb-2">Security & Automation</h4>
              <ul class="list-disc list-inside space-y-1">
                <li>Security: IAM, Secrets Manager, AWS WAF, KMS, Cognito, AWS Config</li>
                <li>CI/CD: CodePipeline, CodeBuild, CodeDeploy, GitHub Actions</li>
                <li>Containerization: ECS, EKS, Fargate, Docker</li>
                <li>Implemented IaC using Terraform, reducing deployment time by 60%</li>
                <li>Monitoring: CloudWatch, Systems Manager, CloudTrail, Cost Explorer</li>
                <li>Governance: Control Tower, Resource Explorer, Well-Architected Framework</li>
                <li>Code Quality: SonarCloud, Linter, OIDC integration</li>
                <li>Managed Kubernetes clusters supporting 100+ microservices with 99.9% uptime</li>
              </ul>
            </div>
          </div>
        </div>

        <!-- DevOps Engineer -->
        <div
          class="bg-white p-8 rounded-2xl shadow-lg border border-gray-100 hover:scale-[1.02] transition-all duration-300"
        >
          <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6">
            <div>
              <h3 class="text-2xl font-semibold text-gray-800">DevOps Engineer</h3>
              <p class="text-gray-600">Procadence Technologies Limited</p>
            </div>
            <span class="text-gray-500 mt-2 md:mt-0">Apr 2021 - Sep 2022</span>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div class="bg-gray-50 p-4 rounded-xl text-center">
              <div class="text-3xl font-bold text-indigo-600">85%</div>
              <div class="text-sm text-gray-600">Automation Rate</div>
            </div>
            <div class="bg-gray-50 p-4 rounded-xl text-center">
              <div class="text-3xl font-bold text-green-600">50%</div>
              <div class="text-sm text-gray-600">Faster Response</div>
            </div>
            <div class="bg-gray-50 p-4 rounded-xl text-center">
              <div class="text-3xl font-bold text-blue-600">40%</div>
              <div class="text-sm text-gray-600">Cost Savings</div>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-gray-600 text-sm">
            <div>
              <h4 class="font-semibold text-gray-800 mb-2">Cloud & Infrastructure (GCP)</h4>
              <ul class="list-disc list-inside space-y-1">
                <li>Multi-tier architecture design using Compute Engine, VPC, Cloud Functions</li>
                <li>Infrastructure as Code with Deployment Manager, Terraform, Pulumi</li>
                <li>
                  Serverless & event-driven architecture using Cloud Functions, Pub/Sub, Cloud Run
                </li>
                <li>Automated infra provisioning using Ansible, achieving 85% automation rate</li>
                <li>Optimized cloud resources resulting in 40% cost savings</li>
              </ul>
            </div>

            <div>
              <h4 class="font-semibold text-gray-800 mb-2">Security & Automation</h4>
              <ul class="list-disc list-inside space-y-1">
                <li>Security: IAM, Secret Manager, Cloud Armor, Cloud KMS, Identity-Aware Proxy</li>
                <li>CI/CD: Implemented CI/CD pipelines reducing deployment time by 50%</li>
                <li>Monitoring: Cloud Monitoring, Cloud Logging, Cloud Trace, Cost Management</li>
                <li>Governance: Organization Policies, Resource Manager, Assured Workloads</li>
                <li>Code Quality: SonarCloud, ESLint, OIDC integration with GitHub/GitLab</li>
              </ul>
            </div>
          </div>
        </div>

        <!-- Cloud Engineer -->
        <div
          class="bg-white p-8 rounded-2xl shadow-lg border border-gray-100 hover:scale-[1.02] transition-all duration-300"
        >
          <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6">
            <div>
              <h3 class="text-2xl font-semibold text-gray-800">DevOps Engineer Intern</h3>
              <p class="text-gray-600">Procadence Technologies Limited</p>
            </div>
            <span class="text-gray-500 mt-2 md:mt-0">Jun 2020 - Mar 2021</span>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div class="bg-gray-50 p-4 rounded-xl text-center">
              <div class="text-3xl font-bold text-indigo-600">99.9%</div>
              <div class="text-sm text-gray-600">Uptime</div>
            </div>
            <div class="bg-gray-50 p-4 rounded-xl text-center">
              <div class="text-3xl font-bold text-green-600">75%</div>
              <div class="text-sm text-gray-600">Faster Recovery</div>
            </div>
            <div class="bg-gray-50 p-4 rounded-xl text-center">
              <div class="text-3xl font-bold text-blue-600">45%</div>
              <div class="text-sm text-gray-600">Efficiency Gain</div>
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-gray-600 text-sm">
            <div>
              <h4 class="font-semibold text-gray-800 mb-2">Cloud & Infrastructure (Azure)</h4>
              <ul class="list-disc list-inside space-y-1">
                <li>Managed cloud infrastructure across Azure with 99.9% uptime</li>
                <li>
                  Multi-tier architecture design using Virtual Machines, Azure Functions, Blob
                  Storage
                </li>
                <li>Implemented disaster recovery solutions reducing recovery time by 75%</li>
                <li>Infrastructure as Code with ARM templates, Bicep, Terraform, Pulumi</li>
                <li>Automated routine tasks improving operational efficiency by 45%</li>
              </ul>
            </div>

            <div>
              <h4 class="font-semibold text-gray-800 mb-2">Security & Automation</h4>
              <ul class="list-disc list-inside space-y-1">
                <li>Security: Azure AD, Key Vault, Azure Firewall, Role-Based Access Control</li>
                <li>CI/CD: Azure DevOps, GitHub Actions, Pipelines with YAML</li>
                <li>
                  Monitoring: Azure Monitor, Log Analytics, Application Insights, Cost Management
                </li>
                <li>Governance: Azure Policy, Blueprints, Management Groups, Resource Graph</li>
                <li>Code Quality: SonarCloud, ESLint, OIDC integration with Azure AD/GitHub</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

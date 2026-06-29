<template>
  <section id="experience" class="section experience">
    <div class="wrap">
      <header class="section-head center" data-reveal>
        <p class="eyebrow">Career so far</p>
        <h2 class="section-title">Work <span class="text-gradient">Experience</span></h2>
        <p class="section-sub">
          Building and optimizing cloud platforms across AWS, GCP and Azure.
        </p>
      </header>

      <div class="timeline">
        <article
          v-for="(job, i) in jobs"
          :key="job.role + job.company"
          class="timeline__item"
          data-reveal
          :style="{ transitionDelay: i * 90 + 'ms' }"
        >
          <span class="timeline__dot"></span>

          <div class="card card-hover job">
            <div class="job__head">
              <div>
                <h3 class="job__role">{{ job.role }}</h3>
                <p class="job__company">{{ job.company }}</p>
              </div>
              <span class="chip job__period">{{ job.period }}</span>
            </div>

            <div class="job__metrics">
              <div v-for="m in job.metrics" :key="m.label" class="metric">
                <div class="metric__value text-gradient">{{ m.value }}</div>
                <div class="metric__label">{{ m.label }}</div>
              </div>
            </div>

            <div class="job__groups">
              <div v-for="group in job.groups" :key="group.title" class="job__group">
                <h4 class="job__group-title">{{ group.title }}</h4>
                <ul class="job__list">
                  <li v-for="(point, p) in group.points" :key="p">{{ point }}</li>
                </ul>
              </div>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup>
  const jobs = [
    {
      role: 'DevOps Engineer',
      company: 'University of Exeter',
      period: 'Oct 2022 - Present',
      metrics: [
        { value: '45%', label: 'Cost Reduction' },
        { value: '60%', label: 'Faster Deployments' },
        { value: '99.9%', label: 'System Uptime' },
      ],
      groups: [
        {
          title: 'Cloud & Infrastructure (AWS)',
          points: [
            'Multi-tier architecture design using EC2, VPC, Lambda, S3',
            'Infrastructure as Code with CloudFormation, CDK (TypeScript), Terraform',
            'Serverless & event-driven architecture using Lambda, EventBridge, AppSync',
            'Networking: VPC, Route53, Load Balancing, ACM',
            'Content delivery via CloudFront, DNS with Route 53',
            'Optimized cloud resources resulting in 45% cost savings',
            'Implemented disaster recovery solutions improving system resilience',
            'Managed Kubernetes clusters using EKS, Fargate for container orchestration',
          ],
        },
        {
          title: 'Security & Automation',
          points: [
            'Security: IAM, Secrets Manager, AWS WAF, KMS, Cognito, AWS Config',
            'CI/CD: CodePipeline, CodeBuild, CodeDeploy, GitHub Actions',
            'Containerization: ECS, EKS, Fargate, Docker',
            'Implemented IaC using Terraform, reducing deployment time by 60%',
            'Monitoring: CloudWatch, Systems Manager, CloudTrail, Cost Explorer',
            'Governance: Control Tower, Resource Explorer, Well-Architected Framework',
            'Code Quality: SonarCloud, Linter, OIDC integration',
            'Managed Kubernetes clusters supporting 100+ microservices with 99.9% uptime',
          ],
        },
      ],
    },
    {
      role: 'DevOps Engineer',
      company: 'Procadence Technologies Limited',
      period: 'Apr 2021 - Sep 2022',
      metrics: [
        { value: '85%', label: 'Automation Rate' },
        { value: '50%', label: 'Faster Response' },
        { value: '40%', label: 'Cost Savings' },
      ],
      groups: [
        {
          title: 'Cloud & Infrastructure (GCP)',
          points: [
            'Multi-tier architecture design using Compute Engine, VPC, Cloud Functions',
            'Infrastructure as Code with Deployment Manager, Terraform, Pulumi',
            'Serverless & event-driven architecture using Cloud Functions, Pub/Sub, Cloud Run',
            'Automated infra provisioning using Ansible, achieving 85% automation rate',
            'Optimized cloud resources resulting in 40% cost savings',
          ],
        },
        {
          title: 'Security & Automation',
          points: [
            'Security: IAM, Secret Manager, Cloud Armor, Cloud KMS, Identity-Aware Proxy',
            'CI/CD: Implemented CI/CD pipelines reducing deployment time by 50%',
            'Monitoring: Cloud Monitoring, Cloud Logging, Cloud Trace, Cost Management',
            'Governance: Organization Policies, Resource Manager, Assured Workloads',
            'Code Quality: SonarCloud, ESLint, OIDC integration with GitHub/GitLab',
          ],
        },
      ],
    },
    {
      role: 'DevOps Engineer Intern',
      company: 'Procadence Technologies Limited',
      period: 'Jun 2020 - Mar 2021',
      metrics: [
        { value: '99.9%', label: 'Uptime' },
        { value: '75%', label: 'Faster Recovery' },
        { value: '45%', label: 'Efficiency Gain' },
      ],
      groups: [
        {
          title: 'Cloud & Infrastructure (Azure)',
          points: [
            'Managed cloud infrastructure across Azure with 99.9% uptime',
            'Multi-tier architecture design using Virtual Machines, Azure Functions, Blob Storage',
            'Implemented disaster recovery solutions reducing recovery time by 75%',
            'Infrastructure as Code with ARM templates, Bicep, Terraform, Pulumi',
            'Automated routine tasks improving operational efficiency by 45%',
          ],
        },
        {
          title: 'Security & Automation',
          points: [
            'Security: Azure AD, Key Vault, Azure Firewall, Role-Based Access Control',
            'CI/CD: Azure DevOps, GitHub Actions, Pipelines with YAML',
            'Monitoring: Azure Monitor, Log Analytics, Application Insights, Cost Management',
            'Governance: Azure Policy, Blueprints, Management Groups, Resource Graph',
            'Code Quality: SonarCloud, ESLint, OIDC integration with Azure AD/GitHub',
          ],
        },
      ],
    },
  ]
</script>

<style scoped>
  .timeline {
    position: relative;
    display: flex;
    flex-direction: column;
    gap: 2.5rem;
  }
  .timeline::before {
    content: '';
    position: absolute;
    left: 0.5rem;
    top: 0.5rem;
    bottom: 0.5rem;
    width: 2px;
    background: linear-gradient(to bottom, var(--accent), var(--accent-2), transparent);
    opacity: 0.4;
  }

  .timeline__item {
    position: relative;
    padding-left: 2.5rem;
  }
  .timeline__dot {
    position: absolute;
    left: 0;
    top: 0.4rem;
    width: 1.1rem;
    height: 1.1rem;
    border-radius: 50%;
    background: var(--accent-grad);
    box-shadow: 0 0 0 5px rgba(129, 140, 248, 0.15);
  }

  .job {
    padding: 1.75rem;
  }
  .job__head {
    display: flex;
    flex-wrap: wrap;
    gap: 0.75rem;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 1.5rem;
  }
  .job__role {
    font-size: 1.35rem;
    font-weight: 700;
    margin: 0;
  }
  .job__company {
    margin: 0.2rem 0 0;
    color: var(--accent);
    font-weight: 500;
  }
  .job__period {
    white-space: nowrap;
  }

  .job__metrics {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 0.75rem;
    margin-bottom: 1.75rem;
  }
  .metric {
    text-align: center;
    padding: 1rem 0.5rem;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border);
    border-radius: var(--radius-sm);
  }
  .metric__value {
    font-size: 1.6rem;
    font-weight: 800;
    line-height: 1;
  }
  .metric__label {
    margin-top: 0.4rem;
    font-size: 0.78rem;
    color: var(--text-dim);
  }

  .job__groups {
    display: grid;
    grid-template-columns: 1fr;
    gap: 1.5rem;
  }
  .job__group-title {
    font-size: 0.95rem;
    font-weight: 700;
    margin: 0 0 0.75rem;
    color: var(--text);
  }
  .job__list {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
  }
  .job__list li {
    position: relative;
    padding-left: 1.4rem;
    font-size: 0.88rem;
    color: var(--text-soft);
    line-height: 1.5;
  }
  .job__list li::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0.5rem;
    width: 0.5rem;
    height: 0.5rem;
    border-radius: 50%;
    background: var(--accent);
    opacity: 0.7;
  }

  @media (min-width: 720px) {
    .job__groups {
      grid-template-columns: 1fr 1fr;
    }
  }
</style>

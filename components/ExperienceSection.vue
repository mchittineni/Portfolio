<template>
  <section id="experience" class="section experience">
    <div class="wrap">
      <header class="section-head center" data-reveal>
        <p class="eyebrow">Career so far</p>
        <h2 class="section-title">Work <span class="text-gradient">Experience</span></h2>
        <p class="section-sub">
          Building, securing, and optimizing cloud platforms across AWS, Azure, and GCP, now
          extending into production GenAI engineering.
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
      role: 'Cloud Engineer',
      company: 'Infoplus Technologies',
      period: 'Mar 2026 - Present',
      metrics: [
        { value: '<2 hrs', label: 'Platform Provisioning' },
        { value: '25+', label: 'Terraform Modules' },
        { value: '99.9%', label: 'K8s Availability' },
      ],
      groups: [
        {
          title: 'Cloud-Native Infrastructure (AWS + GCP)',
          points: [
            'Engineered cloud-native infra for a Speckle design ecosystem and Databricks platform, cutting provisioning from 3 days to under 2 hours',
            'Built a modular Terraform framework of 25+ reusable modules with remote state, reaching 100% repeatable deploys and reducing drift by 70%',
            'Operated managed Kubernetes on GCP at 99.9% availability; autoscaling cut idle compute by 25%',
            'Integrated data-engineering workflows on Databricks (Unity Catalog, cluster policies, job orchestration)',
          ],
        },
        {
          title: 'GenAI & Platform Engineering',
          points: [
            'Prototyped GenAI and agentic-AI in platform tooling (Claude API, OpenAI, MCP), reducing manual toil by 30%',
            'Ran LLMOps on Amazon Bedrock and Vertex AI, reusing the same IaC, CI/CD, identity, and FinOps controls with zero new security findings',
            'Applied Zero Trust, least-privilege IAM, and policy-as-code across the platform',
          ],
        },
      ],
    },
    {
      role: 'Senior Cloud & DevOps Engineer',
      company: 'University of Exeter',
      period: 'Oct 2022 - Dec 2025',
      metrics: [
        { value: '50,000+', label: 'Users Supported' },
        { value: '99.99%', label: 'Uptime' },
        { value: '45%', label: 'Cost Reduction' },
      ],
      groups: [
        {
          title: 'Cloud Platforms & Governance (AWS)',
          points: [
            'Ran hybrid and AWS platforms supporting 50,000+ users at 99.99% uptime',
            'Built serverless, event-driven architectures (Lambda, API Gateway, SNS/SQS, DynamoDB)',
            'Established multi-account governance with Organizations, Control Tower, and SCPs',
            'Drove FinOps (RIs, Spot, autoscaling, rightsizing) cutting spend by 45%; mentored 5+ engineers',
          ],
        },
        {
          title: 'Security & Compliance (DevSecOps)',
          points: [
            'Implemented Zero Trust least-privilege IAM and federated identity (SSO/OIDC, RBAC/ABAC)',
            'Managed Secrets Manager + KMS rotation, Security Hub, GuardDuty, and Config',
            'Aligned controls to GDPR / SOC 2, reducing incident response time by 50%',
          ],
        },
      ],
    },
    {
      role: 'DevOps / Platform Engineer',
      company: 'Procadence Technologies',
      period: 'Apr 2021 - Sep 2022',
      metrics: [
        { value: '200+', label: 'Microservices' },
        { value: '99.9%', label: 'Uptime' },
        { value: '100%', label: 'Keyless CI/CD' },
      ],
      groups: [
        {
          title: 'Platform Engineering (GCP / GKE)',
          points: [
            'Operated GKE clusters running 200+ microservices for 15+ teams at 99.9% uptime; utilisation up 30%',
            'Authored reusable Terraform IaC for IAM and governance, cutting drift and manual effort by 60%',
          ],
        },
        {
          title: 'Security & Multi-Tenancy',
          points: [
            'Delivered keyless CI/CD via Workload Identity Federation, eliminating 100% of long-lived service-account keys',
            'Enforced multi-tenant isolation (namespaces, RBAC, IAM Conditions) and Zero Trust via IAP, with zero cross-tenant incidents',
          ],
        },
      ],
    },
    {
      role: 'Software Engineer Intern',
      company: 'Procadence Technologies',
      period: 'Jun 2020 - Mar 2021',
      metrics: [
        { value: '150+', label: 'Azure Subscriptions' },
        { value: '45%', label: 'Less Manual Effort' },
        { value: '35%', label: 'Faster Releases' },
      ],
      groups: [
        {
          title: 'Azure Automation',
          points: [
            'Automated Azure provisioning (ARM) across 150+ subscriptions, reducing manual effort by 45%',
            'Built Azure DevOps CI/CD with automated testing and secure deploys, cutting release effort by 35%',
          ],
        },
        {
          title: 'Identity & Governance',
          points: [
            'Centralised secrets via Key Vault; managed Entra ID RBAC and service principals at scale',
            'Enforced Zero Trust via Azure Policy, Management Groups, and Conditional Access (MFA + device compliance)',
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

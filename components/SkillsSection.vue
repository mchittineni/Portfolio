<template>
  <section id="skills" class="section">
    <div class="wrap">
      <header class="section-head center" data-reveal>
        <p class="eyebrow">What I work with</p>
        <h2 class="section-title">Technical <span class="text-gradient">Skills</span></h2>
        <p class="section-sub">
          A toolbox spanning multi-cloud platforms, infrastructure-as-code, and the full DevOps
          lifecycle.
        </p>
      </header>

      <!-- Skill categories -->
      <div class="skills__grid">
        <article
          v-for="(cat, i) in categories"
          :key="cat.title"
          class="card card-hover skill-card"
          data-reveal
          :style="{ transitionDelay: i * 70 + 'ms' }"
        >
          <div class="skill-card__icon">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" :d="cat.icon" />
            </svg>
          </div>
          <h3 class="skill-card__title">{{ cat.title }}</h3>
          <div class="skill-card__items">
            <a
              v-for="item in cat.items"
              :key="item.name"
              :href="item.href"
              target="_blank"
              rel="noopener noreferrer"
              class="tech"
            >
              <span class="icon-tile tech__tile">
                <img :src="item.img" :alt="item.name" loading="lazy" width="28" height="28" />
              </span>
              <span class="tech__name">{{ item.name }}</span>
            </a>
          </div>
        </article>

        <!-- Proficiency card -->
        <article
          class="card card-hover skill-card"
          data-reveal
          :style="{ transitionDelay: '350ms' }"
        >
          <div class="skill-card__icon">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden="true">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"
              />
            </svg>
          </div>
          <h3 class="skill-card__title">Proficiency</h3>
          <div class="bars">
            <div v-for="bar in proficiency" :key="bar.name" class="bar">
              <div class="bar__head">
                <span>{{ bar.name }}</span>
                <span class="bar__pct">{{ bar.level }}%</span>
              </div>
              <div class="bar__track">
                <div class="bar__fill" :style="{ width: bar.level + '%' }"></div>
              </div>
            </div>
          </div>
        </article>
      </div>

      <!-- Certifications -->
      <header class="section-head center certs-head" data-reveal>
        <p class="eyebrow">Verified</p>
        <h2 class="section-title">Certifications</h2>
      </header>
      <div class="certs">
        <a
          v-for="(cert, i) in certifications"
          :key="cert.title"
          :href="cert.href"
          target="_blank"
          rel="noopener noreferrer"
          class="card card-hover cert"
          data-reveal
          :style="{ transitionDelay: i * 60 + 'ms' }"
        >
          <span class="icon-tile cert__tile">
            <img :src="cert.img" :alt="cert.alt" loading="lazy" width="34" height="34" />
          </span>
          <h4 class="cert__title">{{ cert.title }}</h4>
        </a>
      </div>
    </div>
  </section>
</template>

<script setup>
  const categories = [
    {
      title: 'Programming Languages',
      icon: 'M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4',
      items: [
        {
          name: 'Python',
          href: 'https://www.python.org/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg',
        },
        {
          name: 'Java',
          href: 'https://www.java.com/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg',
        },
        {
          name: 'JavaScript',
          href: 'https://www.javascript.com/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg',
        },
        {
          name: 'TypeScript',
          href: 'https://www.typescriptlang.org/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg',
        },
      ],
    },
    {
      title: 'Cloud & Infrastructure',
      icon: 'M3 15a4 4 0 004 4h9a5 5 0 10-.1-9.999 5.002 5.002 0 10-9.78 2.096A4.001 4.001 0 003 15z',
      items: [
        {
          name: 'AWS',
          href: 'https://aws.amazon.com/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg',
        },
        {
          name: 'Azure',
          href: 'https://azure.microsoft.com/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg',
        },
        {
          name: 'GCP',
          href: 'https://cloud.google.com/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/googlecloud/googlecloud-original.svg',
        },
        {
          name: 'Oracle',
          href: 'https://www.oracle.com/cloud/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/oracle/oracle-original.svg',
        },
      ],
    },
    {
      title: 'DevOps Tools',
      icon: 'M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15',
      items: [
        {
          name: 'Docker',
          href: 'https://www.docker.com/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg',
        },
        {
          name: 'Kubernetes',
          href: 'https://kubernetes.io/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-original.svg',
        },
        {
          name: 'Terraform',
          href: 'https://www.terraform.io/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/terraform/terraform-original.svg',
        },
        {
          name: 'Ansible',
          href: 'https://www.ansible.com/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ansible/ansible-original.svg',
        },
      ],
    },
    {
      title: 'CI/CD & Automation',
      icon: 'M13 10V3L4 14h7v7l9-11h-7z',
      items: [
        {
          name: 'Jenkins',
          href: 'https://www.jenkins.io/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jenkins/jenkins-original.svg',
        },
        {
          name: 'GitHub',
          href: 'https://github.com/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg',
        },
        {
          name: 'GitLab',
          href: 'https://about.gitlab.com/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/gitlab/gitlab-original.svg',
        },
        {
          name: 'Bitbucket',
          href: 'https://bitbucket.org/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bitbucket/bitbucket-original.svg',
        },
      ],
    },
    {
      title: 'Monitoring & Security',
      icon: 'M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z',
      items: [
        {
          name: 'Datadog',
          href: 'https://www.datadoghq.com/',
          img: 'https://www.vectorlogo.zone/logos/datadoghq/datadoghq-icon.svg',
        },
        {
          name: 'Grafana',
          href: 'https://grafana.com/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/grafana/grafana-original.svg',
        },
        {
          name: 'Prometheus',
          href: 'https://prometheus.io/',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/prometheus/prometheus-original.svg',
        },
        {
          name: 'ELK Stack',
          href: 'https://www.elastic.co/what-is/elk-stack',
          img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/elasticsearch/elasticsearch-original.svg',
        },
      ],
    },
  ]

  const proficiency = [
    { name: 'Git', level: 88 },
    { name: 'SonarQube', level: 75 },
    { name: 'JUnit', level: 81 },
    { name: 'Maven', level: 75 },
  ]

  const certifications = [
    {
      title: 'AWS Certified Solutions Architect – Associate',
      alt: 'AWS',
      href: 'https://www.credly.com/badges/5f18e335-13fb-4ccc-994d-ed8e422a0f3b/linked_in_profile',
      img: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg',
    },
    {
      title: 'Google Cloud Associate Cloud Engineer',
      alt: 'GCP',
      href: 'https://www.credential.net/b488aa0d-d156-499c-91a0-4132f12a97a2?key=b37942efb1541e72a4a40381246efedb424c60c551fa2b7b7baff5573d77948a#acc.5B3UOSQI',
      img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/googlecloud/googlecloud-original.svg',
    },
    {
      title: 'Microsoft Azure Fundamentals – AZ-900',
      alt: 'Azure',
      href: 'https://www.credly.com/badges/5b2e93b4-470a-4d8c-b4b7-3c0cbd10cd6a?source=linked_in_profile',
      img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg',
    },
    {
      title: 'Microsoft Azure AI Fundamentals – AI-900',
      alt: 'Azure AI',
      href: 'https://www.credly.com/badges/fda35ffe-a6ba-473a-b5ae-48aebba457d8?source=linked_in_profile',
      img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/azure/azure-original.svg',
    },
    {
      title: 'Oracle Cloud Infrastructure Developer',
      alt: 'Oracle',
      href: 'https://education.oracle.com/oracle-cloud-infrastructure-developer-2025-associate/pexam_1Z0-1084-25',
      img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/oracle/oracle-original.svg',
    },
    {
      title: 'Oracle Cloud Infrastructure Architect',
      alt: 'Oracle',
      href: 'https://education.oracle.com/oracle-cloud-infrastructure-2025-architect-associate/pexam_1Z0-1072-25',
      img: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/oracle/oracle-original.svg',
    },
  ]
</script>

<style scoped>
  .skills__grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(min(100%, 20rem), 1fr));
    gap: 1.5rem;
  }

  .skill-card {
    padding: 1.75rem;
  }
  .skill-card__icon {
    display: grid;
    place-items: center;
    width: 3rem;
    height: 3rem;
    border-radius: 0.8rem;
    background: rgba(129, 140, 248, 0.12);
    border: 1px solid rgba(129, 140, 248, 0.25);
    color: var(--accent);
    margin-bottom: 1.25rem;
  }
  .skill-card__icon svg {
    width: 1.5rem;
    height: 1.5rem;
  }
  .skill-card__title {
    font-size: 1.25rem;
    font-weight: 700;
    margin: 0 0 1.25rem;
  }
  .skill-card__items {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 0.9rem;
  }

  .tech {
    display: flex;
    align-items: center;
    gap: 0.65rem;
    text-decoration: none;
    color: var(--text-soft);
    transition: color 0.2s ease;
  }
  .tech__tile {
    width: 2.5rem;
    height: 2.5rem;
    flex-shrink: 0;
    transition: transform 0.25s ease;
  }
  .tech__tile img {
    width: 1.6rem;
    height: 1.6rem;
    object-fit: contain;
  }
  .tech:hover {
    color: var(--text);
  }
  .tech:hover .tech__tile {
    transform: scale(1.12);
  }
  .tech__name {
    font-size: 0.9rem;
    font-weight: 500;
  }

  /* Proficiency bars */
  .bars {
    display: flex;
    flex-direction: column;
    gap: 1.1rem;
  }
  .bar__head {
    display: flex;
    justify-content: space-between;
    font-size: 0.9rem;
    color: var(--text-soft);
    margin-bottom: 0.45rem;
  }
  .bar__pct {
    color: var(--text-dim);
  }
  .bar__track {
    height: 0.5rem;
    background: rgba(255, 255, 255, 0.07);
    border-radius: 999px;
    overflow: hidden;
  }
  .bar__fill {
    height: 100%;
    border-radius: 999px;
    background: var(--accent-grad);
  }

  /* Certifications */
  .certs-head {
    margin-top: 4.5rem;
  }
  .certs {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(min(100%, 22rem), 1fr));
    gap: 1.25rem;
  }
  .cert {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 1.25rem;
    text-decoration: none;
    color: var(--text);
  }
  .cert__tile {
    width: 3rem;
    height: 3rem;
    flex-shrink: 0;
  }
  .cert__tile img {
    width: 2rem;
    height: 2rem;
    object-fit: contain;
  }
  .cert__title {
    font-size: 0.98rem;
    font-weight: 600;
    margin: 0;
    line-height: 1.35;
    transition: color 0.2s ease;
  }
  .cert:hover .cert__title {
    color: var(--accent);
  }
</style>

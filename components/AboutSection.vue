<template>
  <section id="about" class="hero">
    <!-- Floating accent orbs -->
    <div class="hero__orbs" aria-hidden="true">
      <span class="orb hero__orb-1"></span>
      <span class="orb hero__orb-2"></span>
    </div>

    <div class="wrap hero__inner">
      <!-- Content -->
      <div class="hero__content">
        <p class="eyebrow animate-in" style="animation-delay: 0.05s">
          Cloud &amp; DevOps Architect
        </p>
        <h1 class="hero__title animate-in" style="animation-delay: 0.15s">
          Hi, I'm <span class="text-gradient">Manideep&nbsp;Chittineni</span>
        </h1>
        <p class="hero__lede animate-in" style="animation-delay: 0.25s">
          I specialize in enterprise-scale migrations and cloud infrastructure optimization —
          transforming complex systems into efficient, scalable, secure, and cost-effective
          solutions.
        </p>

        <div class="hero__actions animate-in" style="animation-delay: 0.35s">
          <a href="#contact" class="btn btn-primary">Get in Touch</a>
          <a href="/Manideep_Chittineni_Resume.pdf" download class="btn btn-ghost">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden="true">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"
              />
            </svg>
            Download Resume
          </a>
        </div>

        <dl class="hero__stats animate-in" style="animation-delay: 0.45s">
          <div v-for="stat in stats" :key="stat.label" class="hero__stat">
            <dt class="hero__stat-value text-gradient">{{ stat.value }}</dt>
            <dd class="hero__stat-label">{{ stat.label }}</dd>
          </div>
        </dl>
      </div>

      <!-- Profile -->
      <div class="hero__visual animate-in" style="animation-delay: 0.3s">
        <div class="hero__photo-ring">
          <div class="hero__photo">
            <img
              src="/profile.jpg"
              alt="Portrait of Manideep Chittineni"
              width="320"
              height="320"
              loading="eager"
            />
          </div>
        </div>
        <span class="hero__badge">
          <span class="hero__badge-dot"></span>
          Available for opportunities
        </span>
      </div>
    </div>

    <a href="#skills" class="hero__scroll" aria-label="Scroll to skills">
      <span class="hero__mouse"><span class="hero__wheel"></span></span>
    </a>
  </section>
</template>

<script setup>
  const stats = [
    { value: '5+', label: 'Years Experience' },
    { value: '6', label: 'Cloud Certifications' },
    { value: '99.9%', label: 'System Uptime' },
    { value: '45%', label: 'Avg. Cost Saved' },
  ]
</script>

<style scoped>
  .hero {
    position: relative;
    min-height: 100vh;
    display: flex;
    align-items: center;
    overflow: hidden;
    padding-top: var(--nav-h);
  }

  .hero__orbs {
    position: absolute;
    inset: 0;
  }
  .hero__orb-1 {
    top: -6rem;
    right: -4rem;
    width: 26rem;
    height: 26rem;
    background: rgba(129, 140, 248, 0.4);
  }
  .hero__orb-2 {
    bottom: -8rem;
    left: -6rem;
    width: 24rem;
    height: 24rem;
    background: rgba(34, 211, 238, 0.32);
    animation-delay: 5s;
  }

  .hero__inner {
    position: relative;
    z-index: 1;
    display: grid;
    grid-template-columns: 1fr;
    gap: 3rem;
    align-items: center;
    padding-block: 3rem;
  }

  .hero__title {
    font-size: clamp(2.4rem, 1.4rem + 4.2vw, 4.2rem);
    font-weight: 800;
    line-height: 1.05;
    letter-spacing: -0.03em;
    margin: 0.6rem 0 0;
  }
  .hero__lede {
    color: var(--text-soft);
    font-size: 1.15rem;
    line-height: 1.7;
    max-width: 34rem;
    margin: 1.4rem 0 0;
  }

  .hero__actions {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    margin-top: 2rem;
  }
  .hero__actions svg {
    width: 1.15rem;
    height: 1.15rem;
  }

  .hero__stats {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1.25rem 2rem;
    margin: 3rem 0 0;
    max-width: 30rem;
  }
  .hero__stat {
    border-left: 2px solid var(--border-strong);
    padding-left: 1rem;
  }
  .hero__stat-value {
    font-size: 1.8rem;
    font-weight: 800;
    line-height: 1;
  }
  .hero__stat-label {
    margin: 0.35rem 0 0;
    color: var(--text-dim);
    font-size: 0.85rem;
  }

  /* Visual */
  .hero__visual {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-self: center;
  }
  .hero__photo-ring {
    padding: 6px;
    border-radius: 50%;
    background: var(--accent-grad);
    box-shadow: 0 30px 70px -30px rgba(129, 140, 248, 0.7);
  }
  .hero__photo {
    width: clamp(15rem, 38vw, 20rem);
    height: clamp(15rem, 38vw, 20rem);
    border-radius: 50%;
    overflow: hidden;
    border: 6px solid var(--bg);
    background: var(--bg-soft);
  }
  .hero__photo img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  .hero__badge {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    margin-top: -1.25rem;
    padding: 0.5rem 1rem;
    background: rgba(10, 11, 18, 0.85);
    border: 1px solid var(--border-strong);
    border-radius: 999px;
    font-size: 0.85rem;
    color: var(--text-soft);
    backdrop-filter: blur(8px);
  }
  .hero__badge-dot {
    width: 0.55rem;
    height: 0.55rem;
    border-radius: 50%;
    background: #34d399;
    box-shadow: 0 0 0 4px rgba(52, 211, 153, 0.25);
  }

  /* Scroll cue */
  .hero__scroll {
    position: absolute;
    left: 50%;
    bottom: 1.75rem;
    transform: translateX(-50%);
    z-index: 1;
  }
  .hero__mouse {
    display: block;
    width: 1.5rem;
    height: 2.5rem;
    border: 2px solid var(--border-strong);
    border-radius: 999px;
    position: relative;
  }
  .hero__wheel {
    position: absolute;
    top: 0.45rem;
    left: 50%;
    transform: translateX(-50%);
    width: 0.3rem;
    height: 0.5rem;
    background: var(--accent);
    border-radius: 999px;
    animation: wheel 1.6s ease-in-out infinite;
  }
  @keyframes wheel {
    0% {
      opacity: 0;
      transform: translate(-50%, 0);
    }
    40% {
      opacity: 1;
    }
    100% {
      opacity: 0;
      transform: translate(-50%, 0.7rem);
    }
  }

  @media (min-width: 960px) {
    .hero__inner {
      grid-template-columns: 1.1fr 0.9fr;
    }
    .hero__visual {
      justify-self: end;
    }
  }
</style>

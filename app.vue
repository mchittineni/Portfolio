<template>
  <div class="app-root">
    <!-- Skip link for keyboard / screen-reader users -->
    <a href="#about" class="skip-link">Skip to content</a>

    <header :class="['nav', { 'nav--scrolled': scrolled }]">
      <div class="wrap nav__inner">
        <a href="#about" class="nav__brand" @click="closeMenu">
          <span class="nav__brand-mark">MC</span>
          <span class="nav__brand-text"
            >Manideep<span class="text-gradient"> Chittineni</span></span
          >
        </a>

        <nav class="nav__links" aria-label="Primary">
          <a v-for="item in navItems" :key="item.href" :href="item.href" class="nav__link">
            {{ item.label }}
          </a>
          <a href="/Manideep_Chittineni_Resume.pdf" download class="btn btn-primary nav__cta">
            Resume
          </a>
        </nav>

        <button
          class="nav__toggle"
          :aria-expanded="menuOpen"
          aria-controls="mobile-menu"
          aria-label="Toggle navigation menu"
          @click="menuOpen = !menuOpen"
        >
          <span :class="['nav__toggle-bar', { open: menuOpen }]"></span>
          <span :class="['nav__toggle-bar', { open: menuOpen }]"></span>
          <span :class="['nav__toggle-bar', { open: menuOpen }]"></span>
        </button>
      </div>

      <!-- Mobile menu -->
      <transition name="slide">
        <nav v-show="menuOpen" id="mobile-menu" class="nav__mobile" aria-label="Mobile">
          <a
            v-for="item in navItems"
            :key="item.href"
            :href="item.href"
            class="nav__mobile-link"
            @click="closeMenu"
          >
            {{ item.label }}
          </a>
          <a
            href="/Manideep_Chittineni_Resume.pdf"
            download
            class="btn btn-primary nav__mobile-cta"
            @click="closeMenu"
          >
            Download Resume
          </a>
        </nav>
      </transition>
    </header>

    <main>
      <AboutSection />
      <SkillsSection />
      <ExperienceSection />
      <ContactSection />
    </main>

    <footer class="footer">
      <div class="wrap footer__inner">
        <div>
          <a href="#about" class="footer__brand"
            >Manideep<span class="text-gradient"> Chittineni</span></a
          >
          <p class="footer__tag">Cloud &amp; DevOps Architect</p>
        </div>

        <div class="footer__social">
          <a
            v-for="s in socials"
            :key="s.label"
            :href="s.href"
            target="_blank"
            rel="noopener noreferrer"
            :aria-label="s.label"
            class="footer__social-link"
          >
            <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
              <path :d="s.path" />
            </svg>
          </a>
        </div>
      </div>
      <div class="wrap footer__bottom">
        <p>&copy; {{ year }} Manideep Chittineni. All rights reserved.</p>
        <a href="#about" class="footer__top">Back to top ↑</a>
      </div>
    </footer>
  </div>
</template>

<script setup>
  import { ref, onMounted, onUnmounted } from 'vue'
  import AboutSection from '~/components/AboutSection.vue'
  import SkillsSection from '~/components/SkillsSection.vue'
  import ExperienceSection from '~/components/ExperienceSection.vue'
  import ContactSection from '~/components/ContactSection.vue'

  const navItems = [
    { label: 'About', href: '#about' },
    { label: 'Skills', href: '#skills' },
    { label: 'Experience', href: '#experience' },
    { label: 'Contact', href: '#contact' },
  ]

  const socials = [
    {
      label: 'LinkedIn',
      href: 'https://www.linkedin.com/in/manideepchittineni',
      path: 'M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z',
    },
    {
      label: 'GitHub',
      href: 'https://github.com/mchittineni',
      path: 'M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z',
    },
    {
      label: 'Twitter',
      href: 'https://twitter.com/mchittineni21',
      path: 'M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z',
    },
  ]

  const year = new Date().getFullYear()
  const menuOpen = ref(false)
  const scrolled = ref(false)
  const closeMenu = () => (menuOpen.value = false)

  const onScroll = () => {
    scrolled.value = window.scrollY > 12
  }

  onMounted(() => {
    onScroll()
    window.addEventListener('scroll', onScroll, { passive: true })
  })
  onUnmounted(() => window.removeEventListener('scroll', onScroll))
</script>

<style scoped>
  .app-root {
    min-height: 100vh;
  }

  .skip-link {
    position: absolute;
    left: -999px;
    top: 0;
    z-index: 100;
    background: var(--accent);
    color: #0a0b12;
    padding: 0.6rem 1rem;
    border-radius: 0 0 0.5rem 0;
    font-weight: 600;
  }
  .skip-link:focus {
    left: 0;
  }

  /* ---------- Nav ---------- */
  .nav {
    position: fixed;
    inset: 0 0 auto 0;
    z-index: 50;
    transition:
      background 0.3s ease,
      border-color 0.3s ease,
      backdrop-filter 0.3s ease;
    border-bottom: 1px solid transparent;
  }
  .nav--scrolled {
    background: rgba(10, 11, 18, 0.72);
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);
    border-bottom-color: var(--border);
  }
  .nav__inner {
    height: var(--nav-h);
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .nav__brand {
    display: flex;
    align-items: center;
    gap: 0.65rem;
    text-decoration: none;
    color: var(--text);
    font-weight: 700;
  }
  .nav__brand-mark {
    display: grid;
    place-items: center;
    width: 2.4rem;
    height: 2.4rem;
    border-radius: 0.7rem;
    background: var(--accent-grad);
    color: #0a0b12;
    font-weight: 800;
    font-size: 0.95rem;
  }
  .nav__brand-text {
    font-size: 1.05rem;
  }

  .nav__links {
    display: none;
    align-items: center;
    gap: 2rem;
  }
  .nav__link {
    position: relative;
    color: var(--text-soft);
    text-decoration: none;
    font-size: 0.95rem;
    font-weight: 500;
    transition: color 0.2s ease;
  }
  .nav__link::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: -6px;
    width: 0;
    height: 2px;
    background: var(--accent-grad);
    border-radius: 2px;
    transition: width 0.25s ease;
  }
  .nav__link:hover {
    color: var(--text);
  }
  .nav__link:hover::after {
    width: 100%;
  }
  .nav__cta {
    padding: 0.55rem 1.1rem;
  }

  .nav__toggle {
    display: inline-flex;
    flex-direction: column;
    justify-content: center;
    gap: 5px;
    width: 2.6rem;
    height: 2.6rem;
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 0.6rem;
    cursor: pointer;
  }
  .nav__toggle-bar {
    display: block;
    width: 18px;
    height: 2px;
    margin-inline: auto;
    background: var(--text);
    border-radius: 2px;
    transition:
      transform 0.25s ease,
      opacity 0.2s ease;
  }
  .nav__toggle-bar.open:nth-child(1) {
    transform: translateY(7px) rotate(45deg);
  }
  .nav__toggle-bar.open:nth-child(2) {
    opacity: 0;
  }
  .nav__toggle-bar.open:nth-child(3) {
    transform: translateY(-7px) rotate(-45deg);
  }

  .nav__mobile {
    display: flex;
    flex-direction: column;
    gap: 0.35rem;
    padding: 1rem 1.5rem 1.5rem;
    background: rgba(10, 11, 18, 0.95);
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);
    border-bottom: 1px solid var(--border);
  }
  .nav__mobile-link {
    color: var(--text-soft);
    text-decoration: none;
    font-weight: 500;
    padding: 0.7rem 0.5rem;
    border-radius: 0.5rem;
    transition:
      background 0.2s ease,
      color 0.2s ease;
  }
  .nav__mobile-link:hover {
    background: var(--surface);
    color: var(--text);
  }
  .nav__mobile-cta {
    margin-top: 0.5rem;
  }

  .slide-enter-active,
  .slide-leave-active {
    transition:
      opacity 0.25s ease,
      transform 0.25s ease;
  }
  .slide-enter-from,
  .slide-leave-to {
    opacity: 0;
    transform: translateY(-10px);
  }

  @media (min-width: 860px) {
    .nav__links {
      display: flex;
    }
    .nav__toggle {
      display: none;
    }
  }

  /* ---------- Footer ---------- */
  .footer {
    border-top: 1px solid var(--border);
    background: rgba(255, 255, 255, 0.02);
    padding-block: 3rem 2rem;
    margin-top: 2rem;
  }
  .footer__inner {
    display: flex;
    flex-wrap: wrap;
    gap: 1.5rem;
    align-items: center;
    justify-content: space-between;
    padding-bottom: 2rem;
    border-bottom: 1px solid var(--border);
  }
  .footer__brand {
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--text);
    text-decoration: none;
  }
  .footer__tag {
    color: var(--text-dim);
    margin: 0.25rem 0 0;
    font-size: 0.9rem;
  }
  .footer__social {
    display: flex;
    gap: 0.65rem;
  }
  .footer__social-link {
    display: grid;
    place-items: center;
    width: 2.6rem;
    height: 2.6rem;
    border-radius: 0.7rem;
    background: var(--surface);
    border: 1px solid var(--border);
    color: var(--text-soft);
    transition: all 0.25s ease;
  }
  .footer__social-link svg {
    width: 1.2rem;
    height: 1.2rem;
  }
  .footer__social-link:hover {
    color: #fff;
    border-color: var(--accent);
    transform: translateY(-3px);
  }
  .footer__bottom {
    display: flex;
    flex-wrap: wrap;
    gap: 0.75rem;
    justify-content: space-between;
    align-items: center;
    padding-top: 1.5rem;
    color: var(--text-dim);
    font-size: 0.9rem;
  }
  .footer__bottom p {
    margin: 0;
  }
  .footer__top {
    color: var(--text-soft);
    text-decoration: none;
    transition: color 0.2s ease;
  }
  .footer__top:hover {
    color: var(--accent);
  }
</style>

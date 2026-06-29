<template>
  <section id="contact" class="section contact">
    <div class="wrap">
      <header class="section-head center" data-reveal>
        <p class="eyebrow">Let's talk</p>
        <h2 class="section-title">Get In <span class="text-gradient">Touch</span></h2>
        <p class="section-sub">
          Have an opportunity or just want to connect? Drop a message and I'll get back to you.
        </p>
      </header>

      <div class="contact__grid">
        <!-- Form -->
        <div class="card contact__card" data-reveal>
          <form class="contact__form" @submit.prevent="handleSubmit">
            <div class="field-group">
              <label for="name">Name</label>
              <input id="name" v-model="form.name" type="text" class="field" required />
            </div>
            <div class="field-group">
              <label for="email">Email</label>
              <input id="email" v-model="form.email" type="email" class="field" required />
            </div>
            <div class="field-group">
              <label for="message">Message</label>
              <textarea
                id="message"
                v-model="form.message"
                rows="5"
                class="field"
                required
              ></textarea>
            </div>
            <button type="submit" class="btn btn-primary contact__submit">Send Message</button>
          </form>
        </div>

        <!-- Info -->
        <div class="contact__info" data-reveal style="transition-delay: 90ms">
          <div class="card contact__detail" v-for="detail in details" :key="detail.label">
            <component
              :is="detail.href ? 'a' : 'div'"
              :href="detail.href"
              :target="detail.href ? '_blank' : null"
              :rel="detail.href ? 'noopener noreferrer' : null"
              class="contact__detail-inner"
            >
              <span class="contact__detail-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" aria-hidden="true">
                  <path
                    v-for="(d, i) in detail.paths"
                    :key="i"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    :d="d"
                  />
                </svg>
              </span>
              <div>
                <p class="contact__detail-label">{{ detail.label }}</p>
                <p class="contact__detail-value">{{ detail.value }}</p>
              </div>
            </component>
          </div>

          <div class="card contact__connect">
            <h3 class="contact__connect-title">Connect with me</h3>
            <div class="contact__socials">
              <a
                v-for="s in socials"
                :key="s.label"
                :href="s.href"
                target="_blank"
                rel="noopener noreferrer"
                :aria-label="s.label"
                class="contact__social"
              >
                <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                  <path :d="s.path" />
                </svg>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
  import { ref } from 'vue'

  const form = ref({ name: '', email: '', message: '' })

  const details = [
    {
      label: 'Email',
      value: 'manideep.chittineni@hotmail.com',
      href: 'mailto:manideep.chittineni@hotmail.com',
      paths: [
        'M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z',
      ],
    },
    {
      label: 'Location',
      value: 'London, United Kingdom',
      href: 'https://www.google.com/maps?q=London,+United+Kingdom',
      paths: [
        'M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z',
        'M15 11a3 3 0 11-6 0 3 3 0 016 0z',
      ],
    },
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

  const handleSubmit = () => {
    const mailto = `mailto:manideep.chittineni@hotmail.com?subject=Message from ${encodeURIComponent(
      form.value.name
    )}&body=From: ${encodeURIComponent(form.value.email)}%0D%0A%0D%0A${encodeURIComponent(
      form.value.message
    )}`

    window.location.href = mailto

    form.value = { name: '', email: '', message: '' }
  }
</script>

<style scoped>
  .contact__grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 1.5rem;
    max-width: 64rem;
    margin-inline: auto;
  }

  .contact__card {
    padding: 2rem;
  }
  .contact__form {
    display: flex;
    flex-direction: column;
    gap: 1.25rem;
  }
  .field-group {
    display: flex;
    flex-direction: column;
    gap: 0.45rem;
  }
  .field-group label {
    font-size: 0.85rem;
    font-weight: 600;
    color: var(--text-soft);
  }
  textarea.field {
    resize: vertical;
    min-height: 7rem;
  }
  .contact__submit {
    margin-top: 0.25rem;
  }

  .contact__info {
    display: flex;
    flex-direction: column;
    gap: 1.25rem;
  }
  .contact__detail {
    padding: 0;
    overflow: hidden;
  }
  .contact__detail-inner {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 1.25rem;
    text-decoration: none;
    color: var(--text);
    transition: background 0.2s ease;
  }
  a.contact__detail-inner:hover {
    background: var(--surface-2);
  }
  .contact__detail-icon {
    display: grid;
    place-items: center;
    width: 2.8rem;
    height: 2.8rem;
    flex-shrink: 0;
    border-radius: 0.7rem;
    background: rgba(129, 140, 248, 0.12);
    border: 1px solid rgba(129, 140, 248, 0.25);
    color: var(--accent);
  }
  .contact__detail-icon svg {
    width: 1.4rem;
    height: 1.4rem;
  }
  .contact__detail-label {
    margin: 0;
    font-size: 0.78rem;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: var(--text-dim);
  }
  .contact__detail-value {
    margin: 0.2rem 0 0;
    font-size: 0.95rem;
    color: var(--text);
    word-break: break-word;
  }

  .contact__connect {
    padding: 1.5rem;
  }
  .contact__connect-title {
    font-size: 1rem;
    font-weight: 700;
    margin: 0 0 1rem;
  }
  .contact__socials {
    display: flex;
    gap: 0.75rem;
  }
  .contact__social {
    display: grid;
    place-items: center;
    width: 2.8rem;
    height: 2.8rem;
    border-radius: 0.7rem;
    background: var(--surface);
    border: 1px solid var(--border);
    color: var(--text-soft);
    transition: all 0.25s ease;
  }
  .contact__social svg {
    width: 1.25rem;
    height: 1.25rem;
  }
  .contact__social:hover {
    color: #fff;
    border-color: var(--accent);
    transform: translateY(-3px);
  }

  @media (min-width: 820px) {
    .contact__grid {
      grid-template-columns: 1.1fr 0.9fr;
      align-items: start;
    }
  }
</style>

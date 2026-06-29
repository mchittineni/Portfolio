# Manideep Chittineni — Portfolio

A fast, statically-generated personal portfolio for a Cloud & DevOps engineer,
built with **Nuxt 3** and **Tailwind CSS v4** and deployed to **AWS** (private
S3 origin behind CloudFront) via a least-privilege **GitHub Actions** pipeline.

![Nuxt](https://img.shields.io/badge/Nuxt-3-00DC82?logo=nuxt.js&logoColor=white)
![Vue](https://img.shields.io/badge/Vue-3-4FC08D?logo=vue.js&logoColor=white)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-4-38BDF8?logo=tailwindcss&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-S3_%2B_CloudFront-FF9900?logo=amazonaws&logoColor=white)

> **Single source of truth: npm.** Use `package-lock.json` only — do not add
> other lockfiles (`pnpm-lock.yaml` / `yarn.lock`).

---

## Table of contents

- [Overview](#overview)
- [Tech stack](#tech-stack)
- [Architecture](#architecture)
- [Project structure](#project-structure)
- [Getting started](#getting-started)
- [Available scripts](#available-scripts)
- [Editing content](#editing-content)
- [Code style & quality](#code-style--quality)
- [Building for production](#building-for-production)
- [Deployment](#deployment)
- [Accessibility, SEO & performance](#accessibility-seo--performance)
- [Roadmap](#roadmap)

---

## Overview

This is a single-page site with anchor-navigated sections — **About / Hero**,
**Skills**, **Experience**, and **Contact**. It is rendered ahead of time with
Nuxt's static generation (`nuxt generate`), so the deployed artifact is plain
HTML/CSS/JS with no server runtime. The design is a dark, glassmorphism theme
with a single indigo→cyan accent, lightweight scroll-reveal animations
(progressive enhancement — content remains fully visible without JavaScript),
and a responsive nav with a mobile menu.

## Tech stack

| Layer         | Choice                                                                                                                    |
| ------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Framework     | [Nuxt 3](https://nuxt.com) (Vue 3, `<script setup>`)                                                                      |
| Rendering     | Static Site Generation (Nitro `static` preset, all routes prerendered)                                                    |
| Styling       | [Tailwind CSS v4](https://tailwindcss.com) via `@nuxtjs/tailwindcss` + a plain-CSS design system in `assets/css/main.css` |
| Fonts         | Inter (Google Fonts, preconnected)                                                                                        |
| Hosting       | Private **S3** bucket (origin) behind **CloudFront** (Origin Access Control)                                              |
| Edge security | **AWS WAFv2**, TLS 1.2+, security response headers, KMS-encrypted secret                                                  |
| CI/CD         | **GitHub Actions** with OIDC (no long-lived AWS keys)                                                                     |
| IaC           | **CloudFormation** _or_ **Terraform** (equivalent; see [`infra/`](infra/))                                                |
| Tooling       | Prettier, PostCSS, Autoprefixer                                                                                           |

## Architecture

```mermaid
flowchart LR
  Dev[Local dev<br/>nuxt dev] --> Repo[(GitHub repo)]
  Repo -->|workflow_dispatch| GHA[GitHub Actions<br/>deploy_prod.yml]
  GHA -->|OIDC AssumeRole| Role[IAM role<br/>least-privilege]
  GHA -->|read| SM[Secrets Manager<br/>+ KMS]
  GHA -->|nuxt generate| Build[.output/public]
  Build -->|s3 sync --delete| S3[(Private S3 bucket)]
  GHA -->|invalidate| CF[CloudFront + WAF]
  CF -->|OAC GetObject| S3
  User([Visitor]) -->|HTTPS| CF
```

The deploy job builds the static site, syncs it to the private S3 bucket, and
invalidates the CloudFront cache. CloudFront reads from S3 using Origin Access
Control (OAC); the bucket itself blocks all public access. Full infrastructure
details — parameters, deploy order, and security posture — are in
[`infra/README.md`](infra/README.md).

## Project structure

```
.
├── app.vue                     # App shell: nav (+ mobile menu), <main>, footer
├── nuxt.config.ts              # SSG config, <head> (SEO/OG/Twitter), fonts
├── tailwind.config.js          # Tailwind theme extensions
├── assets/css/main.css         # Design system: tokens, components, animations
├── components/
│   ├── AboutSection.vue        # Hero (id="about")
│   ├── SkillsSection.vue       # Skills, proficiency, certifications (data-driven)
│   ├── ExperienceSection.vue   # Work timeline (data-driven)
│   └── ContactSection.vue      # Contact form (mailto) + info + socials
├── plugins/
│   └── reveal.client.ts        # IntersectionObserver scroll-reveal (client-only)
├── public/                     # Served as-is: profile.jpg, resume PDF, robots.txt, favicon
├── infra/                      # IaC: CloudFormation (*.yml) + Terraform (terraform/)
├── wrangler.toml               # Cloudflare Workers Static Assets config (alt hosting)
└── .github/workflows/
    └── deploy_prod.yml         # Manual (workflow_dispatch) deploy to AWS
```

## Getting started

### Prerequisites

- **Node.js 22.x** (matches the CI runner)
- **npm** (ships with Node)

### Install & run

```bash
npm ci          # install exact, locked dependencies
npm run dev     # start the dev server at http://localhost:3000
```

## Available scripts

| Script                 | Description                                                      |
| ---------------------- | ---------------------------------------------------------------- |
| `npm run dev`          | Start the Nuxt dev server with HMR on `:3000`                    |
| `npm run build`        | Build the app (server + client bundles)                          |
| `npm run generate`     | **Prerender the static site** into `.output/public` (used by CI) |
| `npm run preview`      | Locally preview the built output                                 |
| `npm run format`       | Format the codebase with Prettier                                |
| `npm run format:check` | Verify formatting (CI gate; non-zero on drift)                   |

## Editing content

Section content is **data-driven** — edit the arrays in `<script setup>` rather
than the markup:

| To change…                                   | Edit                                                                                                                         |
| -------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| Name, hero tagline, headline stats           | [`components/AboutSection.vue`](components/AboutSection.vue)                                                                 |
| Skills, proficiency bars, certifications     | the `categories` / `proficiency` / `certifications` arrays in [`components/SkillsSection.vue`](components/SkillsSection.vue) |
| Roles, dates, metrics, bullet points         | the `jobs` array in [`components/ExperienceSection.vue`](components/ExperienceSection.vue)                                   |
| Email, location, social links                | the `details` / `socials` arrays in [`components/ContactSection.vue`](components/ContactSection.vue) and `app.vue`           |
| Page `<title>`, description, OG/Twitter tags | [`nuxt.config.ts`](nuxt.config.ts)                                                                                           |
| Résumé PDF / profile photo                   | replace files in [`public/`](public/) (keep the same filenames)                                                              |

## Code style & quality

Formatting is enforced with **Prettier** (config in `.prettierrc`,
`.prettierignore`). Run `npm run format` before committing; CI runs
`npm run format:check` and fails the deploy on any unformatted file.

## Building for production

```bash
npm run generate      # outputs static files to .output/public
npm run preview       # serve the production build locally to verify
```

The `.output/public` directory is what gets synced to S3. It includes
`index.html`, a prerendered `404.html`, hashed `_nuxt/` assets, and everything
under `public/`.

## Deployment

Two independent hosting paths are configured — use whichever you prefer (don't
run both against the same domain).

### AWS — S3 + CloudFront (primary)

Deployment is a manual **`workflow_dispatch`** run of
[`.github/workflows/deploy_prod.yml`](.github/workflows/deploy_prod.yml). The
job authenticates to AWS via GitHub OIDC (no stored keys), reads the target
bucket/distribution from Secrets Manager, builds the site, runs
`aws s3 sync … --delete`, and invalidates CloudFront. A `concurrency` group
serializes deploys so two runs can't interleave.

**Required GitHub repository secrets:**

| Secret                | Value                                                            |
| --------------------- | ---------------------------------------------------------------- |
| `AWS_DEPLOY_ARN`      | ARN of the GitHub Actions IAM role (`IAMRoleArn` output)         |
| `AWS_DEPLOY_REGION`   | Region the infra lives in (`us-east-1` when WAF/ACM are enabled) |
| `SECRETS_MANAGER_ARN` | ARN of the deploy secret (`SecretArn` output)                    |

The repo must also define a **`Prod`** GitHub environment (the workflow runs in
it, and the IAM trust policy is scoped to `environment:Prod` by default).

➡️ **Infrastructure provisioning, stack parameters, deploy order, and the
security model are documented in [`infra/README.md`](infra/README.md).**

### Cloudflare (Workers Static Assets)

The site can also be hosted on **Cloudflare** via [`wrangler.toml`](wrangler.toml),
which configures an **assets-only Worker** (Workers Static Assets) that serves the
prerendered output (`.output/public`) directly — no server code. This is the modern
replacement for legacy "Workers Sites", so it avoids the
`No such module "__STATIC_CONTENT_MANIFEST"` error, and it works with the
`wrangler deploy` / `wrangler versions upload` commands a Cloudflare Build runs.
Security headers come from [`public/_headers`](public/_headers); unknown paths
serve the prerendered `404.html` (`not_found_handling = "404-page"`).

Set the project's **build command** to `npm run generate` (the output directory is
wired via `[assets] directory` in `wrangler.toml`). Deploy via the Git integration,
or manually:

```bash
npm run generate
npx wrangler deploy          # or: npx wrangler versions upload
```

## Accessibility, SEO & performance

- **A11y:** skip link, semantic landmarks, ARIA on the mobile-menu toggle,
  visible focus states, and a `prefers-reduced-motion` block that disables
  animations and reveals.
- **SEO:** `<html lang="en">`, meta description, Open Graph and Twitter Card
  tags, and a `robots.txt`. _(Set `og:image`/`twitter:image` to an absolute URL
  once a production domain is configured — social crawlers don't resolve
  relative paths.)_
- **Performance:** static prerender, CloudFront compression + caching,
  preconnected fonts, lazy-loaded brand icons, and a JS-light reveal mechanism.

## Roadmap

- [ ] Configure a custom domain + ACM certificate (enables the TLS 1.2+ floor and absolute OG image URLs)
- [ ] Optional migration to Nuxt 4 / vue-router 5
- [ ] Replace the `mailto:` contact form with a real form backend (e.g. an API endpoint) so messages aren't lost when no mail client is configured
- [ ] Drop unused `@headlessui/vue` / `@heroicons/vue` dependencies if they stay unused

---

© Manideep Chittineni. All rights reserved.

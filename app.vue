<template>
  <div class="min-h-screen bg-white dark:bg-gray-900 transition-colors duration-300">
    <nav class="fixed w-full bg-white/80 dark:bg-gray-900/80 backdrop-blur-sm z-50 shadow-sm">
      <div class="container mx-auto px-6 py-4">
        <div class="flex items-center justify-between">
          <!-- Logo -->
          <a href="#" class="text-2xl font-bold text-gray-800 dark:text-white">MC</a>

          <!-- Navigation Links -->
          <div class="hidden md:flex space-x-8 justify-center flex-1">
            <a href="#about" class="text-gray-600 dark:text-gray-300 hover:text-blue-600 dark:hover:text-blue-400 transition-colors">About</a>
            <a href="#skills" class="text-gray-600 dark:text-gray-300 hover:text-blue-600 dark:hover:text-blue-400 transition-colors">Skills</a>
            <a href="#experience" class="text-gray-600 dark:text-gray-300 hover:text-blue-600 dark:hover:text-blue-400 transition-colors">Experience</a>
            <a href="#contact" class="text-gray-600 dark:text-gray-300 hover:text-blue-600 dark:hover:text-blue-400 transition-colors">Contact</a>
          </div>

          <!-- Theme Switcher -->
          <div class="ml-4">
            <select v-model="theme" @change="applyTheme" class="bg-transparent text-gray-800 dark:text-white border border-gray-300 dark:border-gray-600 rounded px-2 py-1 text-sm focus:outline-none">
              <option value="light">Light</option>
              <option value="dark">Dark</option>
              <option value="system">System</option>
            </select>
          </div>
        </div>
      </div>
    </nav>

    <!-- Profile & Resume -->
<div class="flex items-center space-x-4 ml-4">
  <!-- Profile Image -->
  <!-- <img
    src="/profile.jpg"
    alt="Profile"
    class="w-10 h-10 rounded-full border border-gray-300 dark:border-gray-600 object-cover"
  /> -->
  <img
    src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/kubernetes/kubernetes-original.svg"
    alt="Profile"
    class="w-10 h-10 rounded-full border border-gray-300 dark:border-gray-600 object-cover"
  />

  <!-- Download Resume Button -->
  <a
    href="/Manideep_Chittineni_Resume.pdf"
    download
    class="text-sm bg-blue-600 hover:bg-blue-700 text-white px-3 py-1.5 rounded transition-colors"
  >
    Download Resume
  </a>
</div>

    <main>
      <HeroSection />
      <SkillsSection />
      <ExperienceSection />
      <ContactSection />
    </main>

    <footer class="bg-gray-900 text-white py-8">
      <div class="container mx-auto px-6 text-center">
        <p>&copy; 2025 Manideep Chittineni. All rights reserved.</p>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue'
import HeroSection from '~/components/HeroSection.vue'
import SkillsSection from '~/components/SkillsSection.vue'
import ExperienceSection from '~/components/ExperienceSection.vue'
import ContactSection from '~/components/ContactSection.vue'

const theme = ref('system')

const applyTheme = () => {
  if (theme.value === 'light') {
    document.documentElement.classList.remove('dark')
  } else if (theme.value === 'dark') {
    document.documentElement.classList.add('dark')
  } else if (theme.value === 'system') {
    // System preference
    if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
      document.documentElement.classList.add('dark')
    } else {
      document.documentElement.classList.remove('dark')
    }
  }
}

// Apply theme on mount and when preference changes
onMounted(() => {
  applyTheme()
  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
    if (theme.value === 'system') applyTheme()
  })
})

watch(theme, applyTheme)
</script>
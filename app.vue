<template>
  <div class="min-h-screen bg-white">
    <nav class="fixed w-full bg-white/80 backdrop-blur-sm z-50 shadow-sm">
      <div class="container mx-auto px-6 py-4">
        <div class="flex items-center justify-between">
          <a href="#" class="text-2xl font-bold text-gray-800">MC</a>
          <div class="hidden md:flex space-x-8">
            <a href="#about" class="text-gray-600 hover:text-blue-600 transition-colors">About</a>
            <a href="#skills" class="text-gray-600 hover:text-blue-600 transition-colors">Skills</a>
            <a href="#experience" class="text-gray-600 hover:text-blue-600 transition-colors">Experience</a>
            <a href="#contact" class="text-gray-600 hover:text-blue-600 transition-colors">Contact</a>
          </div>
        </div>
      </div>
    </nav>

    <main>
      <AboutSection />
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
import AboutSection from '~/components/AboutSection.vue'
import SkillsSection from '~/components/SkillsSection.vue'
import ExperienceSection from '~/components/ExperienceSection.vue'
import ContactSection from '~/components/ContactSection.vue'
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

html {
  scroll-behavior: smooth;
}

body {
  font-family: 'Inter', sans-serif;
}

.container {
  max-width: 1280px;
}
</style>
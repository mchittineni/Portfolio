<template>
  <section id="hero" class="py-20 bg-gradient-to-br from-gray-50 to-gray-100"></section>
  <section class="relative min-h-screen flex items-center justify-center overflow-hidden bg-gradient-to-br from-slate-50 to-slate-100 dark:from-slate-900 dark:to-slate-800">
    <!-- Animated background shapes -->
    <div class="absolute inset-0 overflow-hidden">
      <div class="absolute -top-40 -right-40 w-80 h-80 bg-emerald-200 dark:bg-emerald-800 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob"></div>
      <div class="absolute -bottom-40 -left-40 w-80 h-80 bg-emerald-300 dark:bg-emerald-700 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-2000"></div>
      <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-80 h-80 bg-emerald-400 dark:bg-emerald-600 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-4000"></div>
    </div>

    <div class="container mx-auto px-6 relative z-10">
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
        <!-- Profile Image -->
        <div class="flex justify-center lg:justify-end">
          <div class="relative w-64 h-64 rounded-full overflow-hidden border-4 border-emerald-500 shadow-lg">
            <img
              src="/profile.jpg"
              alt="Profile"
              class="w-full h-full object-cover"
            />
          </div>
        </div>

        <!-- Content -->
        <div class="text-2xl font-semibold text-slate-700 dark:text-slate-300 mb-4">
          <h1 class="heading-1 mb-6">
            <span class="bg-gradient-to-r from-emerald-600 to-emerald-400 bg-clip-text text-transparent">
              Manideep Chittineni
            </span>
          </h1>
          <h2 class="text-2xl font-semibold text-slate-700 dark:text-slate-300 mb-4">
            Cloud & DevOps Architect
          </h2>
          <p class="text-lg text-slate-600 dark:text-slate-400 mb-8 max-w-2xl">
            Specializing in enterprise-scale migrations and cloud infrastructure optimization.
            Transforming complex systems into efficient, scalable, secure, cost-efficient, highly reliable solutions.
          </p>
          <div class="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
            <a href="#contact" class="btn-emerald">
              Get in Touch
            </a>
            <a
              href="/Manideep_Chittineni_Resume.pdf"
              download
              class="inline-flex items-center px-4 py-2 border border-emerald-600 text-sm font-medium rounded-md text-emerald-600 hover:bg-emerald-50 dark:text-emerald-400 dark:hover:bg-emerald-900/30 transition-colors duration-200"
            >
              <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
              </svg>
              Download Resume
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.animate-blob {
  animation: blob 7s infinite;
}

.animation-delay-2000 {
  animation-delay: 2s;
}

.animation-delay-4000 {
  animation-delay: 4s;
}

@keyframes blob {
  0% {
    transform: translate(0px, 0px) scale(1);
  }
  33% {
    transform: translate(30px, -50px) scale(1.1);
  }
  66% {
    transform: translate(-20px, 20px) scale(0.9);
  }
  100% {
    transform: translate(0px, 0px) scale(1);
  }
}
</style>
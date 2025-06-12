<template>
  <section class="hero min-h-screen relative overflow-hidden">
    <!-- Background gradient -->
    <div class="absolute inset-0 bg-gradient-to-br from-purple-600 via-pink-500 to-red-500 opacity-90"></div>
    
    <!-- Animated background shapes -->
    <div class="absolute inset-0">
      <div class="absolute top-0 -left-4 w-72 h-72 bg-purple-300 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob"></div>
      <div class="absolute top-0 -right-4 w-72 h-72 bg-yellow-300 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-2000"></div>
      <div class="absolute -bottom-8 left-20 w-72 h-72 bg-pink-300 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-4000"></div>
    </div>

    <!-- Content -->
    <div class="container mx-auto px-6 py-24 relative z-10">
      <div class="flex flex-col items-center justify-center text-center">
        <h1 class="text-5xl md:text-7xl font-bold mb-6 text-white">
          Manideep Chittineni
        </h1>
        <h2 class="text-2xl md:text-3xl text-white/90 mb-8">
          DevOps Engineer
        </h2>
        <p class="text-xl text-white/80 max-w-3xl mb-12">
          A driven and proactive DevOps Engineer with over four years of experience in cloud services (AWS, Azure, GCP). 
          Expert in CI/CD, infrastructure automation, and cloud architecture. Certified in AWS, Azure, and GCP platforms.
        </p>
        <div class="flex gap-4">
          <a href="#contact" class="btn-primary">
            Contact Me
          </a>
          <a href="#experience" class="btn-secondary">
            View Experience
          </a>
        </div>
      </div>
    </div>
  </section>
</template>

<style lang="postcss">
.hero {
  background-size: 400% 400%;
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

.animate-blob {
  animation: blob 7s infinite;
}

.animation-delay-2000 {
  animation-delay: 2s;
}

.animation-delay-4000 {
  animation-delay: 4s;
}

.btn-primary {
  @apply px-8 py-4 bg-white text-purple-600 rounded-full font-semibold hover:bg-opacity-90 transition-all duration-300 transform hover:scale-105 shadow-lg;
}

.btn-secondary {
  @apply px-8 py-4 bg-transparent border-2 border-white text-white rounded-full font-semibold hover:bg-white hover:text-purple-600 transition-all duration-300 transform hover:scale-105;
}
</style>
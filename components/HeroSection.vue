<template>
  <section class="hero min-h-screen relative overflow-hidden">
    <!-- Background gradient -->
    <div class="absolute inset-0 bg-gradient-to-br from-emerald-600 via-emerald-500 to-emerald-400 opacity-90"></div>
    
    <!-- Animated background shapes -->
    <div class="absolute inset-0">
      <div class="absolute top-0 -left-4 w-72 h-72 bg-emerald-300 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob"></div>
      <div class="absolute top-0 -right-4 w-72 h-72 bg-emerald-200 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-2000"></div>
      <div class="absolute -bottom-8 left-20 w-72 h-72 bg-emerald-100 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-4000"></div>
    </div>

    <!-- Content -->
    <div class="container mx-auto px-6 py-24 relative z-10">
      <div class="flex flex-col items-center justify-center text-center">
        <h1 class="heading-1 text-white mb-6">
          Manideep Chittineni
        </h1>
        <h2 class="heading-3 text-white/90 mb-8">
          DevOps Engineer
        </h2>
        <p class="text-xl text-white/80 max-w-3xl mb-12 leading-relaxed">
          A driven and proactive DevOps Engineer with over four years of experience adept at deploying, managing, and enhancing a range of cloud services across Google Cloud, Amazon Web Services, and Azure platforms. Demonstrates a solid grasp of the software development life cycle and a keen enthusiasm for leveraging technology to foster innovation and ongoing enhancements. Recognized for the ability to architect, implement, and oversee cloud infrastructure through automation methodologies, enhancing operational efficiency, dependability, and scalability.
        </p>
        <div class="flex gap-4">
          <a href="#contact" class="btn-emerald">
            Contact Me
          </a>
          <a href="#experience" class="px-8 py-4 bg-transparent border-2 border-white text-white rounded-md font-semibold hover:bg-white hover:text-emerald-600 transition-all duration-300 transform hover:scale-105">
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
</style>
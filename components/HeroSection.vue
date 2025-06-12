<template>
  <section class="hero min-h-screen bg-gradient-to-br from-gray-900 to-gray-800 text-white">
    <div class="container mx-auto px-6 py-24">
      <div class="flex flex-col items-center justify-center text-center">
        <h1 class="text-5xl md:text-6xl font-bold mb-6">
          Manideep Chittineni
        </h1>
        <h2 class="text-2xl md:text-3xl text-gray-300 mb-8">
          Full Stack Developer
        </h2>
        <p class="text-xl text-gray-400 max-w-2xl mb-12">
          Passionate about creating elegant solutions to complex problems. 
          Experienced in modern web technologies and committed to delivering 
          high-quality, scalable applications.
        </p>
        <div class="flex gap-4">
          <a href="#contact" class="btn-primary">
            Contact Me
          </a>
          <a href="#projects" class="btn-secondary">
            View Projects
          </a>
        </div>
      </div>
    </div>
  </section>
</template>

<style lang="postcss">
.hero {
  background-size: 400% 400%;
  animation: gradient 15s ease infinite;
}

.btn-primary {
  @apply px-6 py-3 bg-blue-600 hover:bg-blue-700 rounded-lg transition-colors duration-300;
}

.btn-secondary {
  @apply px-6 py-3 bg-gray-700 hover:bg-gray-600 rounded-lg transition-colors duration-300;
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}
</style>
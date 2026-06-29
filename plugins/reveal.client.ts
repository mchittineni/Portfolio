// Lightweight scroll-reveal via IntersectionObserver.
// Adds `js` to <html> (so CSS only hides elements when JS is present), then:
//  - reveals any element already in the viewport SYNCHRONOUSLY (same task as
//    adding `js`) so above-the-fold content never flashes/blinks on load, and
//  - observes the rest, revealing them as they scroll into view.
export default defineNuxtPlugin(() => {
  const root = document.documentElement
  root.classList.add('js')

  const els = Array.from(document.querySelectorAll<HTMLElement>('[data-reveal]'))
  if (!els.length) return

  const vh = () => window.innerHeight || document.documentElement.clientHeight
  const inViewport = (el: HTMLElement) => {
    const r = el.getBoundingClientRect()
    return r.top < vh() && r.bottom > 0
  }

  // Reveal already-visible elements before the next paint -> no FOUC.
  const rest: HTMLElement[] = []
  for (const el of els) {
    if (inViewport(el)) el.classList.add('reveal-in')
    else rest.push(el)
  }
  if (!rest.length) return

  if (!('IntersectionObserver' in window)) {
    rest.forEach(el => el.classList.add('reveal-in'))
    return
  }

  const io = new IntersectionObserver(
    (entries, obs) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('reveal-in')
          obs.unobserve(entry.target)
        }
      })
    },
    { rootMargin: '0px 0px -10% 0px', threshold: 0.12 }
  )
  rest.forEach(el => io.observe(el))
})

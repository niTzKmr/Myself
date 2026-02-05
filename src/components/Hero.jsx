import { useEffect, useState } from 'react'
import CardContainer from './CardContainer'
import TextArea from './TextArea'
import '../styles/Hero.css'

function Hero() {
  useEffect(() => {
    const isInViewport = (element) => {
      const rect = element.getBoundingClientRect()
      return (
        rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
        rect.right <= (window.innerWidth || document.documentElement.clientWidth)
      )
    }

    const fadeInOnScroll = () => {
      const elements = document.querySelectorAll('.fade-in')
      elements.forEach(element => {
        if (isInViewport(element)) {
          element.classList.add('visible')
        }
      })
    }

    window.addEventListener('scroll', fadeInOnScroll)
    document.addEventListener('DOMContentLoaded', fadeInOnScroll)
    fadeInOnScroll()

    return () => {
      window.removeEventListener('scroll', fadeInOnScroll)
      document.removeEventListener('DOMContentLoaded', fadeInOnScroll)
    }
  }, [])

  return (
    <section className="hero">
      <CardContainer />
      <TextArea />
    </section>
  )
}

export default Hero

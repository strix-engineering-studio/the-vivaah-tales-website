# ============================================================
# THE VIVAAH TALES - PREMIUM PHOTOGRAPHY WEBSITE GENERATOR
# Run from: P:\project\the-vivaah-tales
#
# Before running:
#   pnpm add motion
#
# This script creates/replaces the website components and page.
# It preserves app/layout.tsx, app/globals.css, next.config.ts,
# components.json and your existing shadcn/ui components.
# ============================================================

$ErrorActionPreference = "Stop"

$directories = @(
  "components/layout",
  "components/sections",
  "components/motion",
  "lib"
)

foreach ($directory in $directories) {
  New-Item -ItemType Directory -Force -Path $directory | Out-Null
}

Write-Host "Building The Vivaah Tales premium photography website..." -ForegroundColor Cyan

# ------------------------------------------------------------
# SITE CONFIGURATION
# ------------------------------------------------------------

@'
export const siteConfig = {
  name: "The Vivaah Tales",
  description:
    "Thoughtful wedding photography and films for celebrations in Pune, across India and beyond.",
  instagramUrl: "https://www.instagram.com/the_vivaah_tales/",
  location: "Pune, Maharashtra, India",
  email: process.env.NEXT_PUBLIC_CONTACT_EMAIL ?? "",
  phoneDisplay: process.env.NEXT_PUBLIC_CONTACT_PHONE_DISPLAY ?? "",
  phoneLink: process.env.NEXT_PUBLIC_CONTACT_PHONE ?? "",
  whatsappNumber: (process.env.NEXT_PUBLIC_WHATSAPP_NUMBER ?? "").replace(/\D/g, ""),
  strixUrl: "https://strix.website",
};

export const gallery = [
  {
    src: "https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=1800&q=90",
    alt: "An intimate wedding ceremony",
    category: "The celebration",
    title: "A day to remember",
    shape: "portrait",
  },
  {
    src: "https://images.unsplash.com/photo-1537633552985-df8429e8048b?auto=format&fit=crop&w=1400&q=90",
    alt: "Bride and groom sharing a quiet moment",
    category: "The two of you",
    title: "A quiet kind of forever",
    shape: "landscape",
  },
  {
    src: "https://images.unsplash.com/photo-1583939003579-730e3918a45a?auto=format&fit=crop&w=1400&q=90",
    alt: "Elegant bridal portrait",
    category: "The details",
    title: "Every little detail",
    shape: "portrait",
  },
  {
    src: "https://images.unsplash.com/photo-1591604466107-ec97de577_aff?auto=format&fit=crop&w=1400&q=90",
    alt: "Wedding celebration with family",
    category: "The people",
    title: "All the people you love",
    shape: "portrait",
  },
  {
    src: "https://images.unsplash.com/photo-1511285560929-80b456fea0bc?auto=format&fit=crop&w=1600&q=90",
    alt: "Wedding couple celebrating",
    category: "The feeling",
    title: "The feeling of it all",
    shape: "landscape",
  },
  {
    src: "https://images.unsplash.com/photo-1465495976277-4387d4b0e4a6?auto=format&fit=crop&w=1400&q=90",
    alt: "Wedding table and floral details",
    category: "The atmosphere",
    title: "A beautiful atmosphere",
    shape: "portrait",
  },
];
'@ | Set-Content "lib/site-config.ts" -Encoding utf8

# ------------------------------------------------------------
# INSTAGRAM POSTS
# ------------------------------------------------------------

@'
export interface InstagramPost {
  id: string;
  url: string;
  caption: string;
}

export const instagramPosts: InstagramPost[] = [
  {
    id: "DZXT26Sk0fd",
    url: "https://www.instagram.com/p/DZXT26Sk0fd/",
    caption: "Wedding moments",
  },
  {
    id: "DP8QhBLj1xr",
    url: "https://www.instagram.com/p/DP8QhBLj1xr/",
    caption: "Couple portraits",
  },
  {
    id: "DZ9gBDHk7Aw",
    url: "https://www.instagram.com/p/DZ9gBDHk7Aw/",
    caption: "Wedding stories",
  },
  {
    id: "DVGmG8eDLeT",
    url: "https://www.instagram.com/p/DVGmG8eDLeT/",
    caption: "Behind the scenes",
  },
];
'@ | Set-Content "lib/instagram-posts.ts" -Encoding utf8

# ------------------------------------------------------------
# REVEAL ANIMATION
# ------------------------------------------------------------

@'
"use client";

import { motion, useReducedMotion } from "motion/react";
import type { ReactNode } from "react";

interface RevealProps {
  children: ReactNode;
  className?: string;
  delay?: number;
  distance?: number;
}

export function Reveal({
  children,
  className,
  delay = 0,
  distance = 24,
}: RevealProps) {
  const reduceMotion = useReducedMotion();

  return (
    <motion.div
      className={className}
      initial={reduceMotion ? false : { opacity: 0, y: distance }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true, amount: 0.12 }}
      transition={{
        duration: reduceMotion ? 0 : 0.75,
        delay: reduceMotion ? 0 : delay,
        ease: [0.22, 1, 0.36, 1],
      }}
    >
      {children}
    </motion.div>
  );
}
'@ | Set-Content "components/motion/reveal.tsx" -Encoding utf8

# ------------------------------------------------------------
# THEME PROVIDER
# ------------------------------------------------------------

@'
"use client";

import * as React from "react";
import { ThemeProvider as NextThemesProvider } from "next-themes";

export function ThemeProvider({
  children,
  ...props
}: React.ComponentProps<typeof NextThemesProvider>) {
  return (
    <NextThemesProvider {...props}>
      {children}
    </NextThemesProvider>
  );
}
'@ | Set-Content "components/theme-provider.tsx" -Encoding utf8

# ------------------------------------------------------------
# THEME TOGGLE
# ------------------------------------------------------------

@'
"use client";

import { useEffect, useState } from "react";
import { useTheme } from "next-themes";
import { Moon, Sun } from "lucide-react";
import { Button } from "@/components/ui/button";

export function ThemeToggle() {
  const { resolvedTheme, setTheme } = useTheme();
  const [mounted, setMounted] = useState(false);

  useEffect(() => setMounted(true), []);

  if (!mounted) {
    return (
      <Button variant="ghost" size="icon" aria-label="Change theme" disabled>
        <Sun className="size-4" />
      </Button>
    );
  }

  const isDark = resolvedTheme === "dark";

  return (
    <Button
      variant="ghost"
      size="icon"
      className="rounded-full"
      aria-label={`Switch to ${isDark ? "light" : "dark"} mode`}
      onClick={() => setTheme(isDark ? "light" : "dark")}
    >
      {isDark ? <Sun className="size-4" /> : <Moon className="size-4" />}
    </Button>
  );
}
'@ | Set-Content "components/theme-toggle.tsx" -Encoding utf8

# ------------------------------------------------------------
# MOBILE NAVIGATION
# ------------------------------------------------------------

@'
"use client";

import Link from "next/link";
import { useState } from "react";
import { Menu, X } from "lucide-react";
import { Button } from "@/components/ui/button";

const links = [
  { label: "Home", href: "#home" },
  { label: "Our approach", href: "#about" },
  { label: "Stories", href: "#stories" },
  { label: "Instagram", href: "#instagram" },
  { label: "Enquire", href: "#contact" },
];

export function MobileNavigation() {
  const [open, setOpen] = useState(false);

  return (
    <div className="relative md:hidden">
      <Button
        variant="ghost"
        size="icon"
        className="rounded-full"
        aria-label={open ? "Close navigation" : "Open navigation"}
        aria-expanded={open}
        onClick={() => setOpen((value) => !value)}
      >
        {open ? <X /> : <Menu />}
      </Button>

      {open && (
        <nav className="absolute right-0 top-[calc(100%+1rem)] z-50 w-64 rounded-2xl border border-border/70 bg-background/95 p-5 shadow-2xl backdrop-blur-xl">
          <div className="flex flex-col gap-1">
            {links.map((link) => (
              <Link
                key={link.href}
                href={link.href}
                onClick={() => setOpen(false)}
                className="rounded-xl px-4 py-3 text-sm text-foreground transition-colors hover:bg-muted"
              >
                {link.label}
              </Link>
            ))}
          </div>
        </nav>
      )}
    </div>
  );
}
'@ | Set-Content "components/layout/mobile-navigation.tsx" -Encoding utf8

# ------------------------------------------------------------
# SITE HEADER
# ------------------------------------------------------------

@'
import Link from "next/link";
import { ArrowUpRight } from "lucide-react";
import { ThemeToggle } from "@/components/theme-toggle";
import { MobileNavigation } from "@/components/layout/mobile-navigation";

const links = [
  { label: "Home", href: "#home" },
  { label: "The approach", href: "#about" },
  { label: "Stories", href: "#stories" },
  { label: "Instagram", href: "#instagram" },
];

export function SiteHeader() {
  return (
    <header className="absolute inset-x-0 top-0 z-50 px-4 pt-4 sm:px-6 lg:px-10">
      <div className="mx-auto flex h-[4.5rem] max-w-[1440px] items-center justify-between rounded-full border border-white/20 bg-[#171512]/35 px-5 text-white shadow-lg shadow-black/5 backdrop-blur-xl sm:px-7">
        <Link href="#home" className="group flex items-center gap-3">
          <span className="font-[var(--font-editorial)] text-4xl leading-none text-[#d8bd91]">
            v.
          </span>
          <span className="font-[var(--font-editorial)] text-xl leading-none tracking-wide sm:text-2xl">
            the vivaah tales
            <span className="mt-1.5 block font-sans text-[8px] tracking-[0.28em] text-white/65">
              WEDDING PHOTOGRAPHY & FILMS
            </span>
          </span>
        </Link>

        <nav className="hidden items-center gap-8 lg:flex">
          {links.map((link) => (
            <Link
              key={link.href}
              href={link.href}
              className="text-[11px] tracking-[0.12em] text-white/75 transition-colors hover:text-[#e4c99d]"
            >
              {link.label}
            </Link>
          ))}
        </nav>

        <div className="flex items-center gap-2 sm:gap-3">
          <ThemeToggle />
          <Link
            href="#contact"
            className="hidden items-center gap-2 rounded-full bg-[#e8d7bc] px-5 py-3 text-[10px] font-medium uppercase tracking-[0.16em] text-[#30251f] transition-all hover:bg-white sm:inline-flex"
          >
            Check your date <ArrowUpRight className="size-3.5" />
          </Link>
          <MobileNavigation />
        </div>
      </div>
    </header>
  );
}
'@ | Set-Content "components/layout/site-header.tsx" -Encoding utf8

# ------------------------------------------------------------
# HERO
# ------------------------------------------------------------

@'
import Image from "next/image";
import Link from "next/link";
import { ArrowDown, ArrowUpRight } from "lucide-react";

export function HeroSection() {
  return (
    <section
      id="home"
      className="relative isolate flex min-h-[760px] items-end overflow-hidden bg-[#201b17] text-white sm:min-h-[850px] lg:min-h-[940px]"
    >
      <Image
        src="https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=2600&q=90"
        alt="Romantic wedding celebration captured in warm evening light"
        fill
        priority
        sizes="100vw"
        className="-z-30 object-cover object-center"
      />
      <div className="absolute inset-0 -z-20 bg-gradient-to-t from-[#17130f]/90 via-[#17130f]/35 to-black/20" />
      <div className="absolute inset-0 -z-10 bg-gradient-to-r from-black/35 via-transparent to-transparent" />

      <div className="mx-auto w-full max-w-[1440px] px-6 pb-24 pt-44 sm:px-10 sm:pb-28 lg:px-16">
        <div className="max-w-5xl">
          <p className="mb-8 flex items-center gap-3 text-[9px] uppercase tracking-[0.34em] text-[#e5c99c] sm:text-[10px]">
            <span className="h-px w-8 bg-[#d4b88d]" />
            Pune · India · Available worldwide
          </p>

          <h1 className="max-w-5xl font-[var(--font-editorial)] text-[clamp(4rem,10vw,9.5rem)] font-normal leading-[0.88] tracking-[-0.045em]">
            The beauty
            <br />
            of being
            <br />
            <span className="pl-[0.55em] italic text-[#e4c99d]">together.</span>
          </h1>

          <div className="mt-10 flex flex-col gap-8 sm:ml-[15%] sm:mt-12 sm:flex-row sm:items-end sm:justify-between">
            <p className="max-w-md text-sm leading-7 text-white/75 sm:text-[15px]">
              Honest moments, heartfelt celebrations and the in-between
              details. Wedding photography that lets you return to how it all
              felt.
            </p>

            <div className="flex flex-wrap items-center gap-5">
              <Link
                href="#stories"
                className="inline-flex items-center gap-3 rounded-full bg-[#eee1cd] px-6 py-4 text-[10px] uppercase tracking-[0.17em] text-[#30251f] transition-transform hover:-translate-y-1"
              >
                Explore the stories <ArrowDown className="size-4" />
              </Link>
              <Link
                href="#contact"
                className="inline-flex items-center gap-2 text-xs text-white/85 transition-colors hover:text-[#e4c99d]"
              >
                Tell us about your day <ArrowUpRight className="size-4" />
              </Link>
            </div>
          </div>
        </div>

        <div className="mt-20 flex items-center justify-between border-t border-white/25 pt-5 text-[9px] uppercase tracking-[0.22em] text-white/55">
          <span>Wedding stories, thoughtfully told</span>
          <span className="hidden sm:block">01 / 05</span>
          <span>Scroll to explore ↓</span>
        </div>
      </div>
    </section>
  );
}
'@ | Set-Content "components/sections/hero-section.tsx" -Encoding utf8

# ------------------------------------------------------------
# INTRODUCTION
# ------------------------------------------------------------

@'
import Image from "next/image";
import Link from "next/link";
import { ArrowUpRight } from "lucide-react";

export function IntroductionSection() {
  return (
    <section id="about" className="bg-background px-5 py-24 sm:px-8 lg:py-36">
      <div className="mx-auto grid max-w-[1320px] items-center gap-14 lg:grid-cols-[1.05fr_0.95fr] lg:gap-24">
        <div className="relative mx-auto w-full max-w-[590px]">
          <div className="relative aspect-[4/5] overflow-hidden rounded-[2rem]">
            <Image
              src="https://images.unsplash.com/photo-1537633552985-df8429e8048b?auto=format&fit=crop&w=1400&q=90"
              alt="A couple sharing a quiet wedding day moment"
              fill
              sizes="(max-width: 1024px) 90vw, 50vw"
              className="object-cover"
            />
          </div>
          <div className="absolute -bottom-7 -right-3 rounded-2xl border border-border/60 bg-card/95 px-6 py-5 shadow-xl backdrop-blur sm:-right-8">
            <p className="font-[var(--font-editorial)] text-3xl italic text-primary">
              The in-between
            </p>
            <p className="mt-1 text-[9px] uppercase tracking-[0.2em] text-muted-foreground">
              Is where the magic lives
            </p>
          </div>
        </div>

        <div className="lg:py-12">
          <p className="mb-7 text-[10px] uppercase tracking-[0.3em] text-primary">
            A little about how we see it
          </p>
          <h2 className="font-[var(--font-editorial)] text-5xl font-normal leading-[1.02] tracking-tight sm:text-6xl lg:text-7xl">
            Not just how
            <br />
            it <em className="text-primary">looked.</em>
            <br />
            How it felt.
          </h2>

          <div className="mt-9 max-w-xl space-y-5 text-sm leading-8 text-muted-foreground">
            <p>
              A wedding day is made up of a thousand little things. The deep
              breath before walking in, the hands that find yours, the people
              who have known your story long before this day.
            </p>
            <p>
              We photograph with feeling and intention. We make space for the
              real moments to happen, noticing the grand gestures and the
              beautifully ordinary ones in between.
            </p>
          </div>

          <Link
            href="#contact"
            className="mt-9 inline-flex items-center gap-3 rounded-full border border-border px-6 py-3.5 text-[10px] uppercase tracking-[0.16em] transition-all hover:border-primary hover:bg-primary hover:text-primary-foreground"
          >
            Get to know our approach <ArrowUpRight className="size-4" />
          </Link>
        </div>
      </div>
    </section>
  );
}
'@ | Set-Content "components/sections/introduction-section.tsx" -Encoding utf8

# ------------------------------------------------------------
# PORTFOLIO
# ------------------------------------------------------------

@'
import Image from "next/image";
import Link from "next/link";
import { ArrowUpRight } from "lucide-react";
import { gallery } from "@/lib/site-config";

export function PortfolioSection() {
  return (
    <section id="stories" className="bg-[#eee9e1] px-5 py-24 text-[#30251f] sm:px-8 lg:py-36 dark:bg-[#211d19] dark:text-[#f4eee6]">
      <div className="mx-auto max-w-[1440px]">
        <div className="mb-16 flex flex-col justify-between gap-8 md:flex-row md:items-end">
          <div>
            <p className="mb-6 text-[10px] uppercase tracking-[0.3em] text-[#98774e]">
              A collection of moments
            </p>
            <h2 className="font-[var(--font-editorial)] text-5xl leading-[0.98] tracking-tight sm:text-7xl lg:text-8xl">
              Stories worth
              <br />
              <em>coming back to.</em>
            </h2>
          </div>
          <p className="max-w-xs text-sm leading-7 text-current/65">
            Every celebration has its own rhythm. Here are a few moments
            through our lens.
          </p>
        </div>

        <div className="grid grid-cols-1 gap-x-6 gap-y-12 sm:grid-cols-2 lg:grid-cols-12 lg:gap-x-8">
          {gallery.map((item, index) => {
            const layouts = [
              "lg:col-span-7 lg:mt-0",
              "lg:col-span-4 lg:col-start-9 lg:mt-32",
              "lg:col-span-4 lg:col-start-2 lg:-mt-8",
              "lg:col-span-5 lg:col-start-7 lg:mt-20",
              "lg:col-span-6 lg:col-start-1 lg:mt-12",
              "lg:col-span-4 lg:col-start-9 lg:-mt-12",
            ];

            return (
              <Link
                key={item.src}
                href="#contact"
                className={`group block ${layouts[index % layouts.length]}`}
              >
                <div className={`relative overflow-hidden rounded-[1.5rem] bg-[#d8d0c5] ${index % 3 === 0 ? "aspect-[5/4]" : "aspect-[4/5]"}`}>
                  <Image
                    src={item.src}
                    alt={item.alt}
                    fill
                    sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 60vw"
                    className="object-cover transition-transform duration-1000 ease-out group-hover:scale-[1.045]"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/45 via-transparent to-transparent opacity-70 transition-opacity duration-500 group-hover:opacity-100" />
                  <span className="absolute bottom-5 left-5 rounded-full border border-white/40 bg-black/15 px-4 py-2 text-[9px] uppercase tracking-[0.2em] text-white backdrop-blur-md">
                    {item.category}
                  </span>
                  <span className="absolute bottom-5 right-5 flex size-10 translate-y-2 items-center justify-center rounded-full bg-white/90 text-[#30251f] opacity-0 transition-all duration-500 group-hover:translate-y-0 group-hover:opacity-100">
                    <ArrowUpRight className="size-4" />
                  </span>
                </div>
                <div className="mt-4 flex items-center justify-between gap-4">
                  <h3 className="font-[var(--font-editorial)] text-2xl sm:text-3xl">
                    {item.title}
                  </h3>
                  <span className="text-[10px] tracking-[0.16em] text-current/50">
                    {String(index + 1).padStart(2, "0")}
                  </span>
                </div>
              </Link>
            );
          })}
        </div>

        <div className="mt-20 flex justify-center">
          <Link
            href="https://www.instagram.com/the_vivaah_tales/"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-3 rounded-full border border-current/20 px-7 py-4 text-[10px] uppercase tracking-[0.18em] transition-colors hover:bg-[#30251f] hover:text-white dark:hover:bg-white dark:hover:text-[#30251f]"
          >
            More stories on Instagram <ArrowUpRight className="size-4" />
          </Link>
        </div>
      </div>
    </section>
  );
}
'@ | Set-Content "components/sections/portfolio-section.tsx" -Encoding utf8

# ------------------------------------------------------------
# QUOTE / INTERLUDE
# ------------------------------------------------------------

@'
export function QuoteSection() {
  return (
    <section className="relative overflow-hidden bg-[#30251f] px-5 py-28 text-center text-[#f4eee6] sm:px-8 lg:py-40">
      <div className="pointer-events-none absolute left-1/2 top-1/2 size-[34rem] -translate-x-1/2 -translate-y-1/2 rounded-full border border-white/[0.07]" />
      <div className="pointer-events-none absolute left-1/2 top-1/2 size-[25rem] -translate-x-1/2 -translate-y-1/2 rounded-full border border-white/[0.07]" />
      <div className="relative mx-auto max-w-5xl">
        <p className="mb-8 text-[9px] uppercase tracking-[0.35em] text-[#d7bd95]">
          A note to remember
        </p>
        <blockquote className="font-[var(--font-editorial)] text-4xl leading-[1.12] sm:text-6xl lg:text-7xl">
          One day, these will be the days
          <br className="hidden sm:block" />
          <em className="text-[#d7bd95]">you wish you could relive.</em>
        </blockquote>
        <p className="mt-9 text-[9px] uppercase tracking-[0.28em] text-white/50">
          Let’s make sure you can.
        </p>
      </div>
    </section>
  );
}
'@ | Set-Content "components/sections/quote-section.tsx" -Encoding utf8

# ------------------------------------------------------------
# INSTAGRAM
# ------------------------------------------------------------

@'
"use client";

import Script from "next/script";
import Link from "next/link";
import { ArrowUpRight, Instagram } from "lucide-react";
import { instagramPosts } from "@/lib/instagram-posts";

declare global {
  interface Window {
    instgrm?: {
      Embeds?: {
        process: () => void;
      };
    };
  }
}

export function InstagramSection() {
  function processEmbeds() {
    window.instgrm?.Embeds?.process();
  }

  return (
    <section id="instagram" className="bg-background px-5 py-24 sm:px-8 lg:py-36">
      <div className="mx-auto max-w-[1440px]">
        <div className="mb-14 flex flex-col justify-between gap-7 md:flex-row md:items-end">
          <div>
            <p className="mb-5 text-[10px] uppercase tracking-[0.3em] text-primary">
              Little glimpses, in between
            </p>
            <h2 className="font-[var(--font-editorial)] text-5xl leading-none sm:text-7xl">
              From our <em>journal.</em>
            </h2>
          </div>
          <Link
            href="https://www.instagram.com/the_vivaah_tales/"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex w-fit items-center gap-3 rounded-full border border-border px-5 py-3 text-[10px] uppercase tracking-[0.15em] transition-colors hover:border-primary hover:text-primary"
          >
            <Instagram className="size-4" />
            @the_vivaah_tales
            <ArrowUpRight className="size-3.5" />
          </Link>
        </div>

        <div className="grid grid-cols-1 items-start gap-5 sm:grid-cols-2 xl:grid-cols-4">
          {instagramPosts.map((post) => (
            <article
              key={post.id}
              className="min-w-0 overflow-hidden rounded-[1.25rem] border border-border/60 bg-card p-2 shadow-sm"
            >
              <blockquote
                className="instagram-media !m-0 !w-full !min-w-0"
                data-instgrm-permalink={post.url}
                data-instgrm-version="14"
                style={{
                  background: "#fff",
                  border: 0,
                  borderRadius: "0.75rem",
                  boxShadow: "none",
                  margin: 0,
                  maxWidth: "100%",
                  minWidth: 0,
                  padding: 0,
                  width: "100%",
                }}
              >
                <a href={post.url} target="_blank" rel="noopener noreferrer">
                  View {post.caption} on Instagram
                </a>
              </blockquote>
            </article>
          ))}
        </div>

        <div className="mt-12 text-center">
          <p className="text-sm text-muted-foreground">
            More of the moments, people and celebrations we get to be part of.
          </p>
          <Link
            href="https://www.instagram.com/the_vivaah_tales/"
            target="_blank"
            rel="noopener noreferrer"
            className="mt-5 inline-flex items-center gap-2 text-xs uppercase tracking-[0.18em] text-primary"
          >
            Visit our Instagram <ArrowUpRight className="size-4" />
          </Link>
        </div>
      </div>

      <Script
        src="https://www.instagram.com/embed.js"
        strategy="lazyOnload"
        onLoad={processEmbeds}
      />
    </section>
  );
}
'@ | Set-Content "components/sections/instagram-section.tsx" -Encoding utf8

# ------------------------------------------------------------
# CONTACT SECTION
# ------------------------------------------------------------

@'
"use client";

import { useState, type FormEvent } from "react";
import { ArrowUpRight, MessageCircle } from "lucide-react";
import { siteConfig } from "@/lib/site-config";

export function ContactSection() {
  const [form, setForm] = useState({
    name: "",
    phone: "",
    eventType: "Wedding",
    eventDate: "",
    location: "",
    message: "",
  });

  function update<K extends keyof typeof form>(key: K, value: (typeof form)[K]) {
    setForm((current) => ({ ...current, [key]: value }));
  }

  function submitEnquiry(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();

    if (!siteConfig.whatsappNumber) {
      window.alert("WhatsApp is not configured yet. Please contact the studio directly.");
      return;
    }

    const message = [
      "Hello The Vivaah Tales,",
      "",
      "I would love to enquire about your photography services.",
      "",
      `Name: ${form.name}`,
      `Phone: ${form.phone}`,
      `Event: ${form.eventType}`,
      `Event date: ${form.eventDate || "To be decided"}`,
      `Location: ${form.location || "To be decided"}`,
      `A little about our plans: ${form.message || "I'd love to know more about your services."}`,
    ].join("\n");

    const url = `https://wa.me/${siteConfig.whatsappNumber}?text=${encodeURIComponent(message)}`;
    window.open(url, "_blank", "noopener,noreferrer");
  }

  const inputClass =
    "h-12 w-full rounded-xl border border-border/80 bg-background/75 px-4 text-sm outline-none transition placeholder:text-muted-foreground/65 focus:border-primary focus:ring-2 focus:ring-primary/10";

  return (
    <section id="contact" className="bg-[#eae3d9] px-5 py-24 text-[#30251f] sm:px-8 lg:py-36 dark:bg-[#211d19] dark:text-[#f4eee6]">
      <div className="mx-auto grid max-w-[1320px] gap-14 lg:grid-cols-[0.85fr_1.15fr] lg:gap-24">
        <div className="flex flex-col justify-between">
          <div>
            <p className="mb-6 text-[10px] uppercase tracking-[0.3em] text-[#98774e]">
              Your story starts here
            </p>
            <h2 className="font-[var(--font-editorial)] text-5xl leading-[0.98] sm:text-6xl lg:text-7xl">
              Tell us what
              <br />
              you’re <em>dreaming of.</em>
            </h2>
            <p className="mt-8 max-w-md text-sm leading-8 text-current/65">
              Dates, places, the people you love and all the little details.
              We’d love to hear what you’re planning and what matters most to
              you.
            </p>
          </div>

          <div className="mt-14 border-t border-current/15 pt-6">
            <p className="text-[9px] uppercase tracking-[0.25em] text-[#98774e]">
              Based in
            </p>
            <p className="mt-2 font-[var(--font-editorial)] text-2xl">
              {siteConfig.location}
            </p>
            <p className="mt-2 text-xs text-current/55">
              Photographing celebrations across India and beyond.
            </p>
            {siteConfig.email && (
              <a
                href={`mailto:${siteConfig.email}`}
                className="mt-5 inline-flex text-sm underline decoration-current/30 underline-offset-4 hover:decoration-current"
              >
                {siteConfig.email}
              </a>
            )}
          </div>
        </div>

        <div className="rounded-[2rem] border border-white/60 bg-[#f8f5f0] p-6 shadow-[0_24px_80px_rgba(48,37,31,0.08)] sm:p-9 dark:border-white/10 dark:bg-[#2b2520]">
          <div className="mb-8">
            <p className="text-[9px] uppercase tracking-[0.25em] text-[#98774e]">
              A few details
            </p>
            <h3 className="mt-3 font-[var(--font-editorial)] text-3xl sm:text-4xl">
              Let’s make something beautiful.
            </h3>
            <p className="mt-2 text-xs leading-6 text-[#766b61] dark:text-white/55">
              Fill this in and we’ll continue the conversation on WhatsApp.
            </p>
          </div>

          <form onSubmit={submitEnquiry} className="space-y-5">
            <div className="grid gap-5 sm:grid-cols-2">
              <label className="block space-y-2">
                <span className="text-[10px] uppercase tracking-[0.15em] text-[#766b61] dark:text-white/65">Your name *</span>
                <input
                  required
                  autoComplete="name"
                  value={form.name}
                  onChange={(event) => update("name", event.target.value)}
                  placeholder="Your name"
                  className={inputClass}
                />
              </label>
              <label className="block space-y-2">
                <span className="text-[10px] uppercase tracking-[0.15em] text-[#766b61] dark:text-white/65">Phone number *</span>
                <input
                  required
                  type="tel"
                  autoComplete="tel"
                  value={form.phone}
                  onChange={(event) => update("phone", event.target.value)}
                  placeholder="+91"
                  className={inputClass}
                />
              </label>
            </div>

            <div className="grid gap-5 sm:grid-cols-2">
              <label className="block space-y-2">
                <span className="text-[10px] uppercase tracking-[0.15em] text-[#766b61] dark:text-white/65">Celebration *</span>
                <select
                  required
                  value={form.eventType}
                  onChange={(event) => update("eventType", event.target.value)}
                  className={inputClass}
                >
                  <option>Wedding</option>
                  <option>Engagement</option>
                  <option>Pre-wedding</option>
                  <option>Haldi / Mehendi</option>
                  <option>Couple portraits</option>
                  <option>Other celebration</option>
                </select>
              </label>
              <label className="block space-y-2">
                <span className="text-[10px] uppercase tracking-[0.15em] text-[#766b61] dark:text-white/65">Date of your event</span>
                <input
                  type="date"
                  value={form.eventDate}
                  onChange={(event) => update("eventDate", event.target.value)}
                  className={inputClass}
                />
              </label>
            </div>

            <label className="block space-y-2">
              <span className="text-[10px] uppercase tracking-[0.15em] text-[#766b61] dark:text-white/65">Where is it happening?</span>
              <input
                value={form.location}
                onChange={(event) => update("location", event.target.value)}
                placeholder="City or venue"
                className={inputClass}
              />
            </label>

            <label className="block space-y-2">
              <span className="text-[10px] uppercase tracking-[0.15em] text-[#766b61] dark:text-white/65">Tell us a little more</span>
              <textarea
                rows={4}
                value={form.message}
                onChange={(event) => update("message", event.target.value)}
                placeholder="How are you imagining your celebration?"
                className="w-full resize-y rounded-xl border border-border/80 bg-background/75 px-4 py-3 text-sm outline-none transition placeholder:text-muted-foreground/65 focus:border-primary focus:ring-2 focus:ring-primary/10"
              />
            </label>

            <button
              type="submit"
              className="inline-flex min-h-14 w-full items-center justify-center gap-3 rounded-full bg-[#30251f] px-7 py-4 text-[10px] font-medium uppercase tracking-[0.18em] text-white transition-all hover:-translate-y-0.5 hover:bg-[#594536] dark:bg-[#e8d7bc] dark:text-[#30251f] dark:hover:bg-white"
            >
              <MessageCircle className="size-4" />
              Send your enquiry
              <ArrowUpRight className="size-4" />
            </button>
            <p className="text-center text-[10px] leading-5 text-[#766b61] dark:text-white/45">
              WhatsApp will open with your details filled in. Your message is
              only sent when you press Send in WhatsApp.
            </p>
          </form>
        </div>
      </div>
    </section>
  );
}
'@ | Set-Content "components/sections/contact-section.tsx" -Encoding utf8

# ------------------------------------------------------------
# FLOATING WHATSAPP BUTTON
# ------------------------------------------------------------

@'
import Link from "next/link";
import { MessageCircle } from "lucide-react";
import { siteConfig } from "@/lib/site-config";

export function ContactDock() {
  const message = encodeURIComponent(
    "Hello The Vivaah Tales! I would like to enquire about wedding photography."
  );

  const href = siteConfig.whatsappNumber
    ? `https://wa.me/${siteConfig.whatsappNumber}?text=${message}`
    : "#contact";

  return (
    <Link
      href={href}
      target={siteConfig.whatsappNumber ? "_blank" : undefined}
      rel={siteConfig.whatsappNumber ? "noopener noreferrer" : undefined}
      aria-label="Enquire with The Vivaah Tales on WhatsApp"
      className="fixed bottom-5 right-5 z-[60] inline-flex size-14 items-center justify-center rounded-full bg-[#25D366] text-white shadow-[0_12px_35px_rgba(37,211,102,0.32)] transition-all duration-300 hover:-translate-y-1 hover:scale-105 hover:shadow-[0_16px_40px_rgba(37,211,102,0.4)] sm:bottom-7 sm:right-7"
    >
      <MessageCircle className="size-6" />
      <span className="sr-only">WhatsApp</span>
    </Link>
  );
}
'@ | Set-Content "components/layout/contact-dock.tsx" -Encoding utf8

# ------------------------------------------------------------
# FOOTER
# ------------------------------------------------------------

@'
import Link from "next/link";
import { ArrowUpRight } from "lucide-react";
import { siteConfig } from "@/lib/site-config";

export function SiteFooter() {
  return (
    <footer className="bg-[#171411] px-5 pb-8 pt-20 text-[#f4eee6] sm:px-8 lg:pt-28">
      <div className="mx-auto max-w-[1440px]">
        <div className="grid gap-12 border-b border-white/15 pb-16 md:grid-cols-[1.4fr_0.6fr_0.7fr]">
          <div>
            <Link href="#home" className="inline-flex items-center gap-3">
              <span className="font-[var(--font-editorial)] text-5xl text-[#d8bd91]">v.</span>
              <span className="font-[var(--font-editorial)] text-2xl">
                the vivaah tales
                <span className="mt-1.5 block font-sans text-[8px] tracking-[0.28em] text-white/50">
                  WEDDING PHOTOGRAPHY & FILMS
                </span>
              </span>
            </Link>
            <p className="mt-7 max-w-sm text-sm leading-7 text-white/55">
              For the moments that happen once, and the feelings you’ll want
              to return to forever.
            </p>
            <p className="mt-5 text-[10px] uppercase tracking-[0.2em] text-[#d8bd91]">
              {siteConfig.location}
            </p>
          </div>

          <div className="flex flex-col gap-4 text-sm text-white/65">
            <p className="mb-2 text-[9px] uppercase tracking-[0.25em] text-[#d8bd91]">Explore</p>
            <Link href="#about" className="transition-colors hover:text-white">Our approach</Link>
            <Link href="#stories" className="transition-colors hover:text-white">Stories</Link>
            <Link href="#instagram" className="transition-colors hover:text-white">Instagram</Link>
            <Link href="#contact" className="transition-colors hover:text-white">Enquire</Link>
          </div>

          <div className="flex flex-col gap-4 text-sm text-white/65">
            <p className="mb-2 text-[9px] uppercase tracking-[0.25em] text-[#d8bd91]">Say hello</p>
            <Link href={siteConfig.instagramUrl} target="_blank" rel="noopener noreferrer" className="transition-colors hover:text-white">
              Instagram <ArrowUpRight className="inline size-3" />
            </Link>
            {siteConfig.email && <Link href={`mailto:${siteConfig.email}`} className="transition-colors hover:text-white">Email us</Link>}
            {siteConfig.phoneLink && <Link href={`tel:${siteConfig.phoneLink}`} className="transition-colors hover:text-white">Call us</Link>}
            <Link href="#contact" className="transition-colors hover:text-white">WhatsApp enquiry</Link>
          </div>
        </div>

        <div className="flex flex-col justify-between gap-4 pt-7 text-[10px] tracking-wide text-white/40 sm:flex-row sm:items-center">
          <p>© 2026 The Vivaah Tales. All rights reserved.</p>
          <p>
            Crafted with care by{" "}
            <Link href={siteConfig.strixUrl} target="_blank" rel="noopener noreferrer" className="text-[#d8bd91] transition-colors hover:text-white">
              STRIX Engineering Studio <ArrowUpRight className="inline size-3" />
            </Link>
          </p>
        </div>
      </div>
    </footer>
  );
}
'@ | Set-Content "components/layout/site-footer.tsx" -Encoding utf8

# ------------------------------------------------------------
# PAGE COMPOSITION
# ------------------------------------------------------------

@'
import { SiteHeader } from "@/components/layout/site-header";
import { SiteFooter } from "@/components/layout/site-footer";
import { ContactDock } from "@/components/layout/contact-dock";

import { HeroSection } from "@/components/sections/hero-section";
import { IntroductionSection } from "@/components/sections/introduction-section";
import { PortfolioSection } from "@/components/sections/portfolio-section";
import { QuoteSection } from "@/components/sections/quote-section";
import { InstagramSection } from "@/components/sections/instagram-section";
import { ContactSection } from "@/components/sections/contact-section";
import { Reveal } from "@/components/motion/reveal";

export default function Home() {
  return (
    <main className="min-h-screen overflow-x-clip bg-background">
      <SiteHeader />
      <HeroSection />

      <Reveal>
        <IntroductionSection />
      </Reveal>

      <Reveal>
        <PortfolioSection />
      </Reveal>

      <Reveal>
        <QuoteSection />
      </Reveal>

      <Reveal>
        <InstagramSection />
      </Reveal>

      <Reveal>
        <ContactSection />
      </Reveal>

      <SiteFooter />
      <ContactDock />
    </main>
  );
}
'@ | Set-Content "app/page.tsx" -Encoding utf8

Write-Host ""
Write-Host "The Vivaah Tales components have been generated." -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Install Motion: pnpm add motion"
Write-Host "2. Configure .env.local with NEXT_PUBLIC_WHATSAPP_NUMBER"
Write-Host "3. Verify app/globals.css font variables and theme tokens."
Write-Host "4. Run pnpm build"
Write-Host ""
Write-Host "Note: Replace the sample Unsplash photographs in lib/site-config.ts"
Write-Host "with The Vivaah Tales' own licensed wedding photographs before launch."

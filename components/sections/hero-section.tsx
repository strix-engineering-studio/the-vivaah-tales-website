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

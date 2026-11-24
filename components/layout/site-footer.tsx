import Link from "next/link";
import { ArrowUpRight } from "lucide-react";
import { siteConfig } from "@/lib/site-config";
import { ASSETS } from "@/lib/ASSETS";
import Image from "next/image";

export function SiteFooter() {
  return (
    <footer className="bg-[#171411] px-5 pb-8 pt-20 text-[#f4eee6] sm:px-8 lg:pt-28">
      <div className="mx-auto max-w-[1440px]">
        <div className="grid gap-12 border-b border-white/15 pb-16 md:grid-cols-[1.4fr_0.6fr_0.7fr]">
          <div>
            <Link href="#home" className="inline-flex items-center gap-3">
              <span className="font-[var(--font-editorial)] text-5xl text-[#d8bd91]">
                <Image
                  src={ASSETS.icons.android512}
                  alt=""
                  width={50}
                  height={50}
                />
              </span>
              <span className="font-[var(--font-editorial)] text-2xl">
                the vivaah tales
                <span className="mt-1.5 block font-sans text-[8px] tracking-[0.28em] text-white/50">
                  WEDDING PHOTOGRAPHY & FILMS
                </span>
              </span>
            </Link>
            <p className="mt-7 max-w-sm text-sm leading-7 text-white/55">
              For the moments that happen once, and the feelings you’ll want to
              return to forever.
            </p>
            <p className="mt-5 text-[10px] uppercase tracking-[0.2em] text-[#d8bd91]">
              {siteConfig.location}
            </p>
          </div>

          <div className="flex flex-col gap-4 text-sm text-white/65">
            <p className="mb-2 text-[9px] uppercase tracking-[0.25em] text-[#d8bd91]">
              Explore
            </p>
            <Link href="#about" className="transition-colors hover:text-white">
              Our approach
            </Link>
            <Link
              href="#stories"
              className="transition-colors hover:text-white"
            >
              Stories
            </Link>
            <Link
              href="#instagram"
              className="transition-colors hover:text-white"
            >
              Instagram
            </Link>
            <Link
              href="#contact"
              className="transition-colors hover:text-white"
            >
              Enquire
            </Link>
          </div>

          <div className="flex flex-col gap-4 text-sm text-white/65">
            <p className="mb-2 text-[9px] uppercase tracking-[0.25em] text-[#d8bd91]">
              Say hello
            </p>
            <Link
              href={siteConfig.instagramUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="transition-colors hover:text-white"
            >
              Instagram <ArrowUpRight className="inline size-3" />
            </Link>
            {siteConfig.email && (
              <Link
                href={`mailto:${siteConfig.email}`}
                className="transition-colors hover:text-white"
              >
                Email us
              </Link>
            )}
            {siteConfig.phoneLink && (
              <Link
                href={`tel:${siteConfig.phoneLink}`}
                className="transition-colors hover:text-white"
              >
                Call us
              </Link>
            )}
            <Link
              href="#contact"
              className="transition-colors hover:text-white"
            >
              WhatsApp enquiry
            </Link>
          </div>
        </div>

        <div className="flex flex-col justify-between gap-4 pt-7 text-[10px] tracking-wide text-white/40 sm:flex-row sm:items-center">
          <p>© 2026 The Vivaah Tales. All rights reserved.</p>
          <p>
            Crafted with care by{" "}
            <Link
              href={siteConfig.strixUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="text-[#d8bd91] transition-colors hover:text-white"
            >
              STRIX Engineering Studio{" "}
              <ArrowUpRight className="inline size-3" />
            </Link>
          </p>
        </div>
      </div>
    </footer>
  );
}

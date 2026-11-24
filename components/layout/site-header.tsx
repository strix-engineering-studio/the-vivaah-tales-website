import Link from "next/link";
import { ArrowUpRight } from "lucide-react";
import { ThemeToggle } from "@/components/theme-toggle";
import { MobileNavigation } from "@/components/layout/mobile-navigation";
import Image from "next/image";
import { ASSETS } from "@/lib/ASSETS";

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
            <Image
              src={ASSETS.icons.android512}
              alt=""
              width={50}
              height={50}
            />
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

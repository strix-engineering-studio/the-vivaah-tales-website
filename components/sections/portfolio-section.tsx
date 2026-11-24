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

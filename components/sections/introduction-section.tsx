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

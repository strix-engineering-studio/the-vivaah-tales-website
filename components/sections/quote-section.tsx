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

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

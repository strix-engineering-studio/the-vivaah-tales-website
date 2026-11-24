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

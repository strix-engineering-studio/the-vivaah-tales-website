"use client";

import Script from "next/script";
import Link from "next/link";
import { ArrowUpRight } from "lucide-react";
import { instagramPosts } from "@/lib/instagram-posts";
import { Instagram } from "@hugeicons/core-free-icons";

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
    <section
      id="instagram"
      className="bg-background px-5 py-24 sm:px-8 lg:py-36"
    >
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

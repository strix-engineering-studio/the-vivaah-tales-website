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

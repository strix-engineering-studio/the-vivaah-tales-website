import Link from "next/link";
import { MessageCircle } from "lucide-react";
import { siteConfig } from "@/lib/site-config";

export function ContactDock() {
  const message = encodeURIComponent(
    "Hello The Vivaah Tales! I would like to enquire about wedding photography."
  );

  const href = siteConfig.whatsappNumber
    ? `https://wa.me/${siteConfig.whatsappNumber}?text=${message}`
    : "#contact";

  return (
    <Link
      href={href}
      target={siteConfig.whatsappNumber ? "_blank" : undefined}
      rel={siteConfig.whatsappNumber ? "noopener noreferrer" : undefined}
      aria-label="Enquire with The Vivaah Tales on WhatsApp"
      className="fixed bottom-5 right-5 z-[60] inline-flex size-14 items-center justify-center rounded-full bg-[#25D366] text-white shadow-[0_12px_35px_rgba(37,211,102,0.32)] transition-all duration-300 hover:-translate-y-1 hover:scale-105 hover:shadow-[0_16px_40px_rgba(37,211,102,0.4)] sm:bottom-7 sm:right-7"
    >
      <MessageCircle className="size-6" />
      <span className="sr-only">WhatsApp</span>
    </Link>
  );
}

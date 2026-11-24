import type { Metadata, Viewport } from "next";
import { Inter, Geist_Mono, Cormorant_Garamond } from "next/font/google";

import "./globals.css";
import { cn } from "@/lib/utils";
import { ThemeProvider } from "@/components/theme-provider";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
  display: "swap",
});

const geistMono = Geist_Mono({
  subsets: ["latin"],
  variable: "--font-geist-mono",
  display: "swap",
});

const editorial = Cormorant_Garamond({
  subsets: ["latin"],
  variable: "--font-editorial",
  weight: ["400", "500", "600", "700"],
  display: "swap",
});

export const metadata: Metadata = {
  title: {
    default: "The Vivaah Tales | Wedding Photography",
    template: "%s | The Vivaah Tales",
  },
  description:
    "The Vivaah Tales — capturing timeless wedding stories, intimate celebrations and beautiful moments. Wedding photography in Pune, Maharashtra.",
  keywords: [
    "The Vivaah Tales",
    "Wedding Photography Pune",
    "Indian Wedding Photographer",
    "Candid Wedding Photography",
    "Wedding Stories",
  ],
  openGraph: {
    title: "The Vivaah Tales | Wedding Photography",
    description: "Every love story deserves to be remembered.",
    type: "website",
    locale: "en_IN",
  },
  robots: {
    index: true,
    follow: true,
  },
};

export const viewport: Viewport = {
  width: "device-width",
  initialScale: 1,
  themeColor: [
    { media: "(prefers-color-scheme: light)", color: "#faf7f2" },
    { media: "(prefers-color-scheme: dark)", color: "#191613" },
  ],
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="en"
      suppressHydrationWarning
      className={cn(
        inter.variable,
        geistMono.variable,
        editorial.variable,
        "h-full antialiased",
      )}
    >
      <body className="flex min-h-full flex-col">
        <ThemeProvider
          attribute="class"
          defaultTheme="system"
          enableSystem
          disableTransitionOnChange
        >
          {children}
        </ThemeProvider>
      </body>
    </html>
  );
}

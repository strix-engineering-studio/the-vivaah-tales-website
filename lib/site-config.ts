export const siteConfig = {
  name: "The Vivaah Tales",
  description:
    "Thoughtful wedding photography and films for celebrations in Pune, across India and beyond.",
  instagramUrl: "https://www.instagram.com/the_vivaah_tales/",
  location: "Pune, Maharashtra, India",
  email: process.env.NEXT_PUBLIC_CONTACT_EMAIL ?? "",
  phoneDisplay: process.env.NEXT_PUBLIC_CONTACT_PHONE_DISPLAY ?? "",
  phoneLink: process.env.NEXT_PUBLIC_CONTACT_PHONE ?? "",
  whatsappNumber: (process.env.NEXT_PUBLIC_WHATSAPP_NUMBER ?? "").replace(/\D/g, ""),
  strixUrl: "https://strix.website",
};

export const gallery = [
  {
    src: "https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=1800&q=90",
    alt: "An intimate wedding ceremony",
    category: "The celebration",
    title: "A day to remember",
    shape: "portrait",
  },
  {
    src: "https://images.unsplash.com/photo-1537633552985-df8429e8048b?auto=format&fit=crop&w=1400&q=90",
    alt: "Bride and groom sharing a quiet moment",
    category: "The two of you",
    title: "A quiet kind of forever",
    shape: "landscape",
  },
  {
    src: "https://images.unsplash.com/photo-1583939003579-730e3918a45a?auto=format&fit=crop&w=1400&q=90",
    alt: "Elegant bridal portrait",
    category: "The details",
    title: "Every little detail",
    shape: "portrait",
  },
  {
    src: "https://images.unsplash.com/photo-1591604466107-ec97de577_aff?auto=format&fit=crop&w=1400&q=90",
    alt: "Wedding celebration with family",
    category: "The people",
    title: "All the people you love",
    shape: "portrait",
  },
  {
    src: "https://images.unsplash.com/photo-1511285560929-80b456fea0bc?auto=format&fit=crop&w=1600&q=90",
    alt: "Wedding couple celebrating",
    category: "The feeling",
    title: "The feeling of it all",
    shape: "landscape",
  },
  {
    src: "https://images.unsplash.com/photo-1465495976277-4387d4b0e4a6?auto=format&fit=crop&w=1400&q=90",
    alt: "Wedding table and floral details",
    category: "The atmosphere",
    title: "A beautiful atmosphere",
    shape: "portrait",
  },
];

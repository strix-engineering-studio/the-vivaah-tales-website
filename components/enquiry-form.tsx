'use client';
import { useState } from 'react';
import { ArrowUpRight, CalendarDays, MapPin, MessageCircle } from 'lucide-react';
import { siteConfig } from '@/lib/site-config';

export function EnquiryForm() {
  const [name, setName] = useState('');
  const [date, setDate] = useState('');
  const [place, setPlace] = useState('');
  const [events, setEvents] = useState('Wedding photography');
  const [note, setNote] = useState('');
  function submit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const message = [
      'Hello The Vivaah Tales! I would like to enquire about photography.',
      `Name: ${name || 'Not provided'}`,
      `Wedding date: ${date || 'Not decided yet'}`,
      `Location: ${place || 'Not decided yet'}`,
      `Looking for: ${events}`,
      `A little more: ${note || 'No additional details'}`,
    ].join('\n');
    const url = siteConfig.whatsappNumber
      ? `https://wa.me/${siteConfig.whatsappNumber}?text=${encodeURIComponent(message)}`
      : `https://wa.me/?text=${encodeURIComponent(message)}`;
    window.open(url, '_blank', 'noopener,noreferrer');
  }
  return <form className="enquiry-form" onSubmit={submit}>
    <div className="form-row">
      <label>Your name<input value={name} onChange={e => setName(e.target.value)} placeholder="How should we call you?" autoComplete="name" /></label>
      <label>Wedding date<div className="input-with-icon"><CalendarDays size={16} /><input type="date" value={date} onChange={e => setDate(e.target.value)} /></div></label>
    </div>
    <div className="form-row">
      <label>Wedding location<div className="input-with-icon"><MapPin size={16} /><input value={place} onChange={e => setPlace(e.target.value)} placeholder="City or venue" /></div></label>
      <label>What are you looking for?<select value={events} onChange={e => setEvents(e.target.value)}><option>Wedding photography</option><option>Wedding films</option><option>Photography & films</option><option>Pre-wedding shoot</option><option>Engagement / couple shoot</option></select></label>
    </div>
    <label>Tell us a little more<textarea value={note} onChange={e => setNote(e.target.value)} placeholder="Events, number of days, the kind of memories you want to keep..." rows={3} /></label>
    <button className="button button-primary form-submit" type="submit"><MessageCircle size={17} /> Start a WhatsApp conversation <ArrowUpRight size={16} /></button>
    <p className="form-note">This opens WhatsApp with your enquiry pre-filled. No information is stored on this website.</p>
  </form>;
}

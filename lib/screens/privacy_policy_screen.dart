// In-app copy of the privacy policy, opened from Settings. Bundled as plain
// text (no network, no WebView) so it works offline and matches the app's own
// "no network access" claim. Keep the wording in sync with privacy_policy.html,
// the hosted copy that Play Console links to.

import 'package:flutter/material.dart';

const _sections = <(String, List<String>)>[
  (
    'The short version',
    [
      "PetSalud stores everything only on your own device. We don't collect it, transmit it, sell it, or see it — there's no server for it to go to.",
    ],
  ),
  (
    'What PetSalud stores, and where',
    [
      "PetSalud is a local-first pet health record keeper. When you add a pet, a vet visit, a vaccination, a medication, or any other record, it's written directly to a database file stored on your phone. That's the only place it lives.",
      'Depending on what you choose to enter, this can include:',
      '•  Pet profiles — name, species, breed, sex, date of birth, sterilization status, color/markings, life status',
      '•  Medical records — vet visits, vaccinations, hospitalizations, procedures/surgeries, illnesses and custom events, medications and dosing history, microchip numbers',
      "•  People you associate with a pet or record (e.g. a vet's name), and free-text notes you write",
      '•  Reminders you set for upcoming care',
      "None of this is information about you as a distinct user — PetSalud doesn't ask who you are. It's the information you choose to record about your pets.",
    ],
  ),
  (
    "What PetSalud doesn't do",
    [
      "•  No account or sign-in. There's nothing to register, and nothing tying your data to an identity.",
      '•  No network access. The app makes no internet requests. Nothing you enter is transmitted anywhere, by us or anyone else.',
      "•  No analytics or tracking. We don't use any analytics SDKs, crash reporters, or advertising networks.",
      "•  No ads. PetSalud doesn't show ads and has no ad SDKs integrated.",
      "•  No unnecessary permissions. The app doesn't request access to your contacts, location, camera, or microphone.",
    ],
  ),
  (
    'Your control over your data',
    [
      "Every record you add can be edited or deleted directly in the app. Because everything lives in a local database file rather than a remote account, uninstalling PetSalud removes that data from your device along with the app. There's no separate account to delete, because there was never an account to begin with.",
    ],
  ),
  (
    "Children's privacy",
    [
      "PetSalud is not directed at children and isn't designed to collect information from anyone, of any age — it simply has no mechanism to collect or transmit data at all.",
    ],
  ),
  (
    'Changes to this policy',
    [
      "If PetSalud's data handling ever changes — for example, if a future version adds an optional cloud-sync feature — this policy will be updated first, with a new effective date above, before that change ships.",
    ],
  ),
  (
    'Contact',
    ['Questions about this policy or the app can be sent to kjbrown.dev@gmail.com.'],
  ),
];

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Effective September 9, 2026 · PetSalud, developed by KJBrown', style: textTheme.bodySmall),
          const SizedBox(height: 16),
          for (final (heading, paragraphs) in _sections) ...[
            Text(heading, style: textTheme.titleMedium),
            const SizedBox(height: 8),
            for (final p in paragraphs) ...[
              Text(p),
              const SizedBox(height: 8),
            ],
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

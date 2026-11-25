// Product-level constants mirrored from the Karma web app.

const kAppName = 'Karma';
const kTagline = 'What you give is what you get.';

/// Kudos: max message length and how many a person can send per day.
const kKudosMaxLength = 280;
const kKudosPerDay = 5;

/// Office hours used by the attendance report (9–6 with a 45-minute buffer,
/// 8 hours expected per working day).
const kWorkMinutesPerDay = 8 * 60;

/// Leave balances are shown against these defaults when the API omits totals.
const kDefaultTotalLeaves = 16;
const kDefaultTotalWfh = 12;

/// Secure storage / shared-prefs keys.
abstract final class StorageKeys {
  static const token = 'Token';
  static const theme = 'theme';
}

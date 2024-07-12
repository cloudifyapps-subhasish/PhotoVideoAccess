import { registerPlugin } from '@capacitor/core';

import type { PhotoVideoAccessPlugin } from './definitions';

const PhotoVideoAccess = registerPlugin<PhotoVideoAccessPlugin>(
  'PhotoVideoAccess',
  {
    web: () => import('./web').then(m => new m.PhotoVideoAccessWeb()),
  },
);

export * from './definitions';
export { PhotoVideoAccess };

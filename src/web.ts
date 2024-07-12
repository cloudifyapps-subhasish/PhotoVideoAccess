import { WebPlugin } from '@capacitor/core';

import type { PhotoVideoAccessPlugin } from './definitions';

export class PhotoVideoAccessWeb
  extends WebPlugin
  implements PhotoVideoAccessPlugin
{
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}

export interface PhotoVideoAccessPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}

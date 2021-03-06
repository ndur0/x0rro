import { existsSync } from 'fs'

export function ensure_file_exists(filename: string): void {
  const res = filename && existsSync(filename)
  if (!res) {
    throw new Error(`Specified file doesn't exists: ${filename}`)
  }
}

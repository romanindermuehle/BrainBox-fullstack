import { UUID } from "crypto";

export interface Movie {
  id: UUID
  title: string
  release_year?: number
  production_costs?: string
  genre?: [string]
  director?: UUID
}

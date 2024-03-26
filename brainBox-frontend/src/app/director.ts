import { UUID } from "crypto";

export interface Director {
  id: UUID
  name:string
  age?: number
  residence?: string
  mail?: string
  movies?: [UUID]
}

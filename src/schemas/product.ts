import { z } from "zod"
import { Schemas } from "../interfaces/abstract/schemas"
import { SchemaType } from "../types/schema"

export class ProductSchemas extends Schemas {
    public response: SchemaType = z.object({})

    public listResponse: SchemaType = z.array(this.response)

    public create: SchemaType = z.object({})

    public update: SchemaType = z.object({})

    public idParams: SchemaType = z.object({
        id: z.string().min(1, "Product ID is required"),
    })
}

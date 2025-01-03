import { z } from "zod"
import { Schemas } from "../interfaces/abstract/schemas"
import { SchemaType } from "../types/schema"

export class ProductSchemas extends Schemas {
    public response: SchemaType = z.object({
        tag: z.string(),
        name: z.string(),
        description: z.string().optional(),
        fullDescription: z.string().optional(),
        price: z.number(),
        newPrice: z.number().optional(),
    })

    public listResponse: SchemaType = z.array(this.response)

    public create: SchemaType = z.object({
        tag: z.string(),
        name: z.string(),
        description: z.string().optional(),
        fullDescription: z.string().optional(),
        price: z.number().min(0),
        newPrice: z.number().min(0).optional(),
    })

    public update: SchemaType = z.object({
        tag: z.string().optional(),
        name: z.string().optional(),
        description: z.string().optional(),
        fullDescription: z.string().optional(),
        price: z.number().min(0).optional(),
        newPrice: z.number().min(0).optional(),
    })

    public idParams: SchemaType = z.object({
        id: z.string().min(1, "Product ID is required"),
    })
}

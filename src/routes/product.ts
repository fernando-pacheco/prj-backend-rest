import { FactoryRoute } from "../utils/factory-route"
import { ProductDocsSchemas } from "../docs/product"
import { ProductResources } from "../resources/product"
import { FastifyTypedInstance } from "../types/types"
import { Routes } from "../interfaces/abstract/routes"
import { RouteHandlerMethod } from "fastify"

export class ProductRoutes extends Routes {
    constructor(
        private resource: ProductResources = new ProductResources(),
        private docsSchema: ProductDocsSchemas = new ProductDocsSchemas()
    ) {
        super()
    }

    public registerRoutes(app: FastifyTypedInstance) {
        this.productRegistersRoutes(app)
        this.productHandlersRoutes(app)
    }

    private productRegistersRoutes(app: FastifyTypedInstance) {
        FactoryRoute({
            app,
            endpoint: "/product",
            method: "post",
            docs: this.docsSchema.create,
            resource: this.resource.create as RouteHandlerMethod,
        })

        FactoryRoute({
            app,
            endpoint: "/product",
            method: "get",
            docs: this.docsSchema.list,
            resource: this.resource.list as RouteHandlerMethod,
        })
    }

    private productHandlersRoutes(app: FastifyTypedInstance) {
        FactoryRoute({
            app,
            endpoint: "/product/:id",
            method: "get",
            docs: this.docsSchema.get,
            resource: this.resource.get as RouteHandlerMethod,
        })

        FactoryRoute({
            app,
            endpoint: "/product/:id",
            method: "put",
            docs: this.docsSchema.update,
            resource: this.resource.update as RouteHandlerMethod,
        })

        FactoryRoute({
            app,
            endpoint: "/product/:id",
            method: "delete",
            docs: this.docsSchema.delete,
            resource: this.resource.delete as RouteHandlerMethod,
        })
    }
}

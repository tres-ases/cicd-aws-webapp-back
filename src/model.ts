import {APIGatewayEventRequestContext, Callback} from "aws-lambda";

export type CustomHandler<E,R> = (event: E, context: APIGatewayEventRequestContext, callback: Callback<R>) => void;

export interface User {
  Id: number
  Name: string
  CreatedAt: string
}

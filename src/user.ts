import {DynamoDB} from "aws-sdk";
import {CustomHandler, User} from "./model";

const USERS_TABLE_NAME = process.env.USERS_TABLE_NAME as string;
const ddbClient = new DynamoDB.DocumentClient({region: process.env.AWS_REGION});

export const getAll: CustomHandler<{}, User[]> = (event, context, callback) => {
  const params: DynamoDB.DocumentClient.ScanInput = {
    TableName: USERS_TABLE_NAME
  };
  ddbClient.scan(params, (err, data) => {
    if (err) {
      callback({name: err.code, message: err.message});
    } else {
      callback(null, data.Items ? data.Items as User[] : []);
    }
  });
}

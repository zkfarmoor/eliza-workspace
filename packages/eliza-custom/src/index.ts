import { AgentRuntime } from "@workspace/eliza-stable/core/dist/core/runtime";
import BetterSqlite3 from "better-sqlite3";
import { ModelProvider } from "@workspace/eliza-stable/core/dist/core/types";
import { SqliteAdapter } from "./SqliteAdapter";

const db = new BetterSqlite3("eliza.db");

// Initialize the database tables
db.exec(`
  CREATE TABLE IF NOT EXISTS messages (id TEXT PRIMARY KEY, content TEXT, embedding BLOB);
  CREATE TABLE IF NOT EXISTS documents (id TEXT PRIMARY KEY, content TEXT, embedding BLOB);
  CREATE TABLE IF NOT EXISTS fragments (id TEXT PRIMARY KEY, content TEXT, embedding BLOB);
`);

const runtime = new AgentRuntime({
    modelProvider: ModelProvider.LLAMALOCAL,
    token: process.env.OPENAI_API_KEY || "",
    databaseAdapter: new SqliteAdapter(db)
});

export { runtime };
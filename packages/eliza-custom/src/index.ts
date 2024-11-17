import { AgentRuntime, SqliteDatabaseAdapter } from "eliza";
import Database from "better-sqlite3";

export async function createCustomAgent() {
  const db = new SqliteDatabaseAdapter(new Database(":memory:"));
  
  const runtime = new AgentRuntime({
    serverUrl: process.env.X_SERVER_URL || "",
    token: process.env.OPENAI_API_KEY || "",
    databaseAdapter: db,
    model: process.env.XAI_MODEL || "meta-llama/Llama-3.1-7b-instruct",
    embeddingModel: "text-embedding-3-small"
  });

  return runtime;
}
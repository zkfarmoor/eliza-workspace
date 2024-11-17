import { AgentRuntime } from "@ai16z/core";
import { SqliteDatabaseAdapter } from "@ai16z/adapters";
import Database from "better-sqlite3";

async function main() {
  const db = new SqliteDatabaseAdapter(new Database("./dev.db"));
  
  const runtime = new AgentRuntime({
    databaseAdapter: db,
    modelProvider: "OPENAI",
    character: require("./character.json")
  });

  await runtime.start();
}

main().catch(console.error);
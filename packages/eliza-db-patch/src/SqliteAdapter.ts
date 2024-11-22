import { Account, Actor, IDatabaseAdapter, Goal, GoalStatus, Memory, Participant, Relationship, UUID } from "@workspace/eliza-stable/core/dist/core/types";
import BetterSqlite3 from "better-sqlite3";

export class SqliteAdapter implements IDatabaseAdapter {
    constructor(public db: BetterSqlite3.Database) {}

    async getAccountById(userId: UUID): Promise<Account | null> {
        return null;
    }

    async createAccount(account: Account): Promise<boolean> {
        return true;
    }

    async getMemories(params: {
        roomId: UUID;
        count?: number;
        unique?: boolean;
        tableName: string;
    }): Promise<Memory[]> {
        return [];
    }

    async getMemoriesByRoomIds(params: {
        agentId?: UUID;
        roomIds: UUID[];
        tableName: string;
    }): Promise<Memory[]> {
        return [];
    }

    async getMemoryById(id: UUID): Promise<Memory | null> {
        return null;
    }

    async getCachedEmbeddings(params: {
        query_table_name: string;
        query_threshold: number;
        query_input: string;
        query_field_name: string;
        query_field_sub_name: string;
        query_match_count: number;
    }): Promise<{ embedding: number[]; levenshtein_score: number; }[]> {
        return [];
    }

    async log(params: { body: { [key: string]: unknown; }; userId: UUID; roomId: UUID; type: string; }): Promise<void> {}

    async getActorDetails(params: { roomId: UUID; }): Promise<Actor[]> {
        return [];
    }

    async searchMemories(params: {
        tableName: string;
        roomId: UUID;
        embedding: number[];
        match_threshold: number;
        match_count: number;
        unique: boolean;
    }): Promise<Memory[]> {
        return [];
    }

    async updateGoalStatus(params: { goalId: UUID; status: GoalStatus; }): Promise<void> {}

    async searchMemoriesByEmbedding(embedding: number[], params: {
        match_threshold?: number;
        count?: number;
        roomId?: UUID;
        agentId?: UUID;
        unique?: boolean;
        tableName: string;
    }): Promise<Memory[]> {
        return [];
    }

    async createMemory(memory: Memory, tableName: string, unique?: boolean): Promise<void> {}

    async removeMemory(memoryId: UUID, tableName: string): Promise<void> {}

    async removeAllMemories(roomId: UUID, tableName: string): Promise<void> {}

    async countMemories(roomId: UUID, unique?: boolean, tableName?: string): Promise<number> {
        return 0;
    }

    async getGoals(params: { roomId: UUID; userId?: UUID | null; onlyInProgress?: boolean; count?: number; }): Promise<Goal[]> {
        return [];
    }

    async updateGoal(goal: Goal): Promise<void> {}

    async createGoal(goal: Goal): Promise<void> {}

    async removeGoal(goalId: UUID): Promise<void> {}

    async removeAllGoals(roomId: UUID): Promise<void> {}

    async getRoom(roomId: UUID): Promise<UUID | null> {
        return null;
    }

    async createRoom(roomId?: UUID): Promise<UUID> {
        return roomId || crypto.randomUUID();
    }

    async removeRoom(roomId: UUID): Promise<void> {}

    async getRoomsForParticipant(userId: UUID): Promise<UUID[]> {
        return [];
    }

    async getRoomsForParticipants(userIds: UUID[]): Promise<UUID[]> {
        return [];
    }

    async addParticipant(userId: UUID, roomId: UUID): Promise<boolean> {
        return true;
    }

    async removeParticipant(userId: UUID, roomId: UUID): Promise<boolean> {
        return true;
    }

    async getParticipantsForAccount(userId: UUID): Promise<Participant[]> {
        return [];
    }

    async getParticipantsForRoom(roomId: UUID): Promise<UUID[]> {
        return [];
    }

    async getParticipantUserState(roomId: UUID, userId: UUID): Promise<"FOLLOWED" | "MUTED" | null> {
        return null;
    }

    async setParticipantUserState(roomId: UUID, userId: UUID, state: "FOLLOWED" | "MUTED" | null): Promise<void> {}

    async createRelationship(params: { userA: UUID; userB: UUID; }): Promise<boolean> {
        return true;
    }

    async getRelationship(params: { userA: UUID; userB: UUID; }): Promise<Relationship | null> {
        return null;
    }

    async getRelationships(params: { userId: UUID; }): Promise<Relationship[]> {
        return [];
    }
} 
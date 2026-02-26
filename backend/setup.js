const pool = require('./config/db');
const fs = require('fs').promises;
const path = require('path');

async function runSetup() {
    // We declare connection outside so it's accessible in the catch/finally blocks
    let connection; 

    try {
        console.log("--- Initializing Database Setup from File ---");

        const sqlFilePath = path.join(__dirname, '..', 'database', 'quickbites-1.0.sql');
        const schema = await fs.readFile(sqlFilePath, 'utf8');

        const tableNames = Array.from(
            schema.matchAll(/CREATE\s+TABLE\s+`?([a-zA-Z0-9_]+)`?/gi),
            match => match[1]
        );

        const sanitizedSchema = schema.replace(/^\s*--.*$/gm, '');

        const statements = sanitizedSchema
            .split(/;\s*(?:\r?\n|$)/)
            .map(s => s.trim())
            .filter(s => s.length > 0);

        // 1. Get a single connection from the pool
        connection = await pool.getConnection();

        // 2. Start the transaction
        await connection.beginTransaction();

        if (tableNames.length > 0) {
            await connection.query('SET FOREIGN_KEY_CHECKS = 0');
            for (const tableName of tableNames.reverse()) {
                await connection.query(`DROP TABLE IF EXISTS \`${tableName}\``);
            }
            await connection.query('SET FOREIGN_KEY_CHECKS = 1');
        }

        const shouldIgnoreError = (error) => {
            return error?.code === 'ER_TABLE_EXISTS_ERROR'
                || error?.code === 'ER_DUP_ENTRY';
        };

        for (const statement of statements) {
            console.log(`Executing: ${statement.substring(0, 50)}...`);
            try {
                await connection.query(statement);
            } catch (error) {
                if (shouldIgnoreError(error)) {
                    console.warn(`⚠️  Skipped: ${error.code} for statement`);
                    continue;
                }
                throw error;
            }
        }

        // 3. Commit changes
        await connection.commit();
        console.log("✅ Database successfully synchronized with quickbites-1.0.sql.");
        
    } catch (error) {
        // 4. Rollback using the specific connection
        if (connection) await connection.rollback();
        console.error("❌ Setup failed:");
        console.error(error.stack || error.message);
        process.exit(1);
    } finally {
        // 5. Release the connection back to the pool
        if (connection) connection.release();
        console.log("--- Process Finished ---");
        // Close the pool
        await pool.end();
        process.exit(0);
    }
}

runSetup();
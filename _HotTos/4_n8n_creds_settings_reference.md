# n8n Creds References

For all default services, the following credentials examples can help getting setup:

- Mariadb
- Postgres
- Milvus
- LM Studio
- Ollama
- SFTP

NOTE: For database servers, there are no default databases created on general stand up. You will need to create databases and tables (and user / password if needed) to support the credentials setup.

## Example Credentials Setup

Redis:
<img src="./_images/n8n_7_redis_settings.png" alt="" />

MariaDB:
<img src="./_images/n8n_creds_1_mariadb.png" alt="" />

Postgres:
<img src="./_images/n8n_creds_2_postgres.png" alt="" />

Milvus: (requires to add a user first). Connect to 'https://attu.local/', Connect to Milvus (should be pre-populated), navigate to user, and add an 'n8n' account and password. Then add the credentials.

<img src="./_images/n8n_creds_3_milvus_add_user.png" alt="" />

<img src="./_images/n8n_creds_3_milvus.png" alt="" />

LM Studio:
<img src="./_images/n8n_creds_4_lm_studio.png" alt="" />

Ollama:
<img src="./_images/n8n_creds_5_ollama.png" alt="" />

SFTP:
<img src="./_images/n8n_creds_6_sftp.png" alt="" />

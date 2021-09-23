```bash
cat << EOF | psql ---params
BEGIN;
`pg_dump ----something`
update table .... statement ...;
END;
EOF
```

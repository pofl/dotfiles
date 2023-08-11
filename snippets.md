```bash
cat << EOF | psql ---params
BEGIN;
`pg_dump ----something`
update table .... statement ...;
END;
EOF
```

# Go: JSON HTTP

```go
func Handler(w http.ResponseWriter, r *http.Request) {
	var s struct{}
	_ = json.NewDecoder(r.Body).Decode(&s)
	//or
	body, _ := io.ReadAll(r.Body)
	_ = json.Unmarshal(body, &s)

	w.Header().Set("Content-Type", "application/json; charset=UTF-8")
	w.WriteHeader(http.StatusCreated)
	_ = json.NewEncoder(w).Encode(s)
}
```

Update(ctx context.Context,session sqlx.Session, data *{{.upperStartCamelObject}}) (sql.Result, error)

UpdateWithVersion(ctx context.Context,session sqlx.Session,data *{{.upperStartCamelObject}}) error
Update(ctx context.Context,session sqlx.Session, data *{{.upperStartCamelObject}}) (sql.Result, error)
UpdateWithId(ctx context.Context, session sqlx.Session, updateBuilder squirrel.UpdateBuilder, {{.lowerStartCamelPrimaryKey}} {{.dataType}}) (sql.Result, error)
UpdateWithVersion(ctx context.Context,session sqlx.Session,data *{{.upperStartCamelObject}}) error
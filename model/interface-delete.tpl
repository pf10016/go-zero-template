Delete(ctx context.Context,session sqlx.Session, {{.lowerStartCamelPrimaryKey}} {{.dataType}}) error
UpdateWithId(ctx context.Context, session sqlx.Session, updateBuilder squirrel.UpdateBuilder,{{.lowerStartCamelPrimaryKey}} {{.dataType}})(sql.Result, error)

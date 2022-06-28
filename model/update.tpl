
func (m *default{{.upperStartCamelObject}}Model) Update(ctx context.Context,session sqlx.Session, {{if .containsIndexCache}}newData{{else}}data{{end}} *{{.upperStartCamelObject}}) (error) {
	{{if .withCache}}{{if .containsIndexCache}}data, err:=m.FindOne(ctx, newData.{{.upperStartCamelPrimaryKey}})
	if err!=nil{
		return nil,err
	}

{{end}}	{{.keys}}
    _, {{if .containsIndexCache}}err{{else}}err:{{end}}= m.ExecCtx(ctx, func(ctx context.Context, conn sqlx.SqlConn) (result sql.Result, err error) {
		query := fmt.Sprintf("update %s set %s where {{.originalPrimaryKey}} = {{if .postgreSql}}$1{{else}}?{{end}}", m.table, {{.lowerStartCamelObject}}RowsWithPlaceHolder)
		if session != nil{
        		_,err:=  session.ExecCtx(ctx,query, {{.expressionValues}})
        		return err
        	}
		_,err:= conn.ExecCtx(ctx, query, {{.expressionValues}})
		return err
	}, {{.keyValues}}){{else}}query := fmt.Sprintf("update %s set %s where {{.originalPrimaryKey}} = {{if .postgreSql}}$1{{else}}?{{end}}", m.table, {{.lowerStartCamelObject}}RowsWithPlaceHolder)
    if session != nil{
    		_,err:= session.ExecCtx(ctx,query, {{.expressionValues}})
    		return err
    	}
    	 _,err:=m.conn.ExecCtx(ctx, query, {{.expressionValues}}){{end}}
        	return err

}


type {{.lowerStartCamelObject}}Model interface{
    {{.method}}
}

type default{{.upperStartCamelObject}}Model struct {
    {{if .withCache}}sqlc.CachedConn{{else}}conn sqlx.SqlConn{{end}}
    table string
}
//go:generate sqlugen -structs {{.upperStartCamelObject}} -input .
type {{.upperStartCamelObject}} struct {
    {{.fields}}
}


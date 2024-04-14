{{- define "postgres.fullname" -}}
{{- printf "%s-%s" .Release.Name "postgres" -}}
{{- end -}}
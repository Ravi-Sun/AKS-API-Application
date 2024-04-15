{{- define "postgres.fullname" -}}
{{- printf "%s-%s" .Release.Name "postgres" -}}
{{- end -}}

{{- define "python-api.fullname" -}}
{{- printf "%s-%s" .Release.Name "python-api" -}}
{{- end -}}
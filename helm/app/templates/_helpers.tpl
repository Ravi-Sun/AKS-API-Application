{{- define "python-api.fullname" -}}
{{- printf "%s-%s" .Release.Name "python-api" -}}
{{- end -}}
{{/*
Expand the name of the chart.
*/}}
{{- define "helm-jenkins-project.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "helm-jenkins-project.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Chart labels
*/}}
{{- define "helm-jenkins-project.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" | replace "." "_" }}
{{ include "helm-jenkins-project.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "helm-jenkins-project.selectorLabels" -}}
app.kubernetes.io/name: {{ include "helm-jenkins-project.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

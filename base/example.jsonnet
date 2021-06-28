local kp = (import 'kube-prometheus/main.libsonnet') + {
  values+:: {
    common+: {
      namespace: 'monitoring',
    },
  },
};

[kp.kubePrometheus.namespace] +
[kp.prometheusOperator[name]
  for name in std.filter((function(name) name != 'serviceMonitor' && name != 'prometheusRule'), std.objectFields(kp.prometheusOperator))] +
[kp.alertmanager[name] for name in std.objectFields(kp.alertmanager)] +
[kp.kubePrometheus[name] for name in std.objectFields(kp.kubePrometheus)] +
[kp.nodeExporter[name] for name in std.objectFields(kp.nodeExporter)] +
[kp.kubeStateMetrics[name] for name in std.objectFields(kp.kubeStateMetrics)] +
[kp.prometheus[name] for name in std.objectFields(kp.prometheus)] +
[kp.prometheusAdapter[name] for name in std.objectFields(kp.prometheusAdapter)]
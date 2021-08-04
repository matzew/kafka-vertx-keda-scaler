# kafka-vertx-keda-scaler

Sample project that builds a simple `KafkaConsumer`, based on Vert.x reading from a topic like:

```yaml
apiVersion: kafka.strimzi.io/v1beta2
kind: KafkaTopic
metadata:
  name: my-topic
  labels:
    strimzi.io/cluster: my-cluster
spec:
  partitions: 10
  replicas: 3
  config:
    retention.bytes: 53687091200
    retention.ms: 36000000
```

We now use [KEDA](./keda-scalers.yaml) to dynamically scale our consumers, based on the consumer group for the topic.

The application is defined as a normal Kubernetes [deployment](./k8s.yaml).




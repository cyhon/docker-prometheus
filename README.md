[![Build Status](https://ci.finogeeks.club/api/badges/monitor/prometheus/status.svg)](https://ci.finogeeks.club/monitor/prometheus)
# Prometheus监控接入

## 数据模型
Prometheus 的数据模型支持多维自定义，这个模型下的时序数据有metric name和一组key/value的labels组成。Prometheus的存储都是按时间序列去实现的，相同的metric name和labels组成一条时间序列，如果labels不同表示不同的时间序列。
```
<metric name>{<label name>=<label value>, ...}
```
### 指标名和标签
* metric name: 我们需要给监控对象的指标取一个名字，例如```api_http_requests_total```
* label: 表示对一条时间序列不同维度的识别，例如对于```api_http_requests_total{method="POST", handler="/messages"}```中有method表示请求用的是GET还是POST

指标名和标签的命名规范可以参考[METRIC AND LABEL NAMING](https://prometheus.io/docs/practices/naming/).

### 指标类型
* Counter: 用于累计计数，例如用来记录请求次数，Counter的特点是一直增加不会减少
* Gauge：用于记录常规数值，可以增加或减少，例如用来记录CPU、内存的变化
* Histogram：可理解为直方图，常用于跟踪事件发生的规模，如请求耗时、响应大小。可对记录的内容分组和聚合(count,sum等)，例如响应时间小于500毫秒的多少次、500毫秒~1000毫秒之间多少次、1000毫秒以上的多少次
* Summary：与Histogram类似，但支持按百分比跟踪结果

Histogram和Summary的区别可以参考[HISTOGRAMS AND SUMMARIES](https://prometheus.io/docs/practices/histograms/).

### Job和Instance
在Prometheus中任何被采集的目标Target被称为Instance，通常对应单个进程。 相同类型的Instance被称为Job，例如：

```
job: api-server
	instance 1: 1.2.3.4:5670
	instance 2: 1.2.3.4:5671
	instance 3: 5.6.7.8:5670
	instance 4: 5.6.7.8:5671
```

当Prometheus抓取Target的数据时，会自动向每条数据添加job和instance的标签，其取值如下：

* job: 配置文件中当前Target所属的job name
* instance: Target地址的```<host>:<port>```部分

## 数据采集

* [Go](https://github.com/prometheus/client_golang)
* [Java](https://github.com/prometheus/client_java)
* [Python](https://github.com/prometheus/client_python)
* [Node.js](https://github.com/siimon/prom-client)

更多开发语言请参考[CLIENT LIBRARIES](https://prometheus.io/docs/instrumenting/clientlibs/)

## 数据上报
### PULL模型
参考[WRITING EXPORTER](https://prometheus.io/docs/instrumenting/writing_exporters/)

### PUSH模型
参考[PUSHING METRICS](https://prometheus.io/docs/instrumenting/pushing/)
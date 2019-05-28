import 'package:okapia_app/entities/config.dart';

class MetaData {
  String version;
  String transformSeed;
  String masterSeed;
  String iv;
  String headerHmac;
  String dataHmac;

  MetaData(
      {this.version,
      this.transformSeed,
      this.masterSeed,
      this.iv,
      this.headerHmac,
      this.dataHmac});

  factory MetaData.from(List<ConfigEntity> values) {
    Map<String, String> kvs = Map();
    values.forEach((entity) => {kvs[entity.name] = entity.value});
    return MetaData(
        version: kvs["version"],
        transformSeed: kvs["transformSeed"],
        masterSeed: kvs["masterSeed"],
        iv: kvs["iv"],
        headerHmac: kvs["headerHmac"],
        dataHmac: kvs["dataHmac"]);
  }

  List<ConfigEntity> toEntities() {
    return <ConfigEntity>[
      ConfigEntity(name: "version", value: version),
      ConfigEntity(name: "transformSeed", value: transformSeed),
      ConfigEntity(name: "masterSeed", value: masterSeed),
      ConfigEntity(name: "iv", value: iv),
      ConfigEntity(name: "headerHmac", value: headerHmac),
      ConfigEntity(name: "dataHmac", value: dataHmac),
    ];
  }
}

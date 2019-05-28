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

  factory MetaData.from(List<ResourceEntity> values) {
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

  List<ResourceEntity> toEntities() {
    return <ResourceEntity>[
      ResourceEntity(name: "version", value: version),
      ResourceEntity(name: "transformSeed", value: transformSeed),
      ResourceEntity(name: "masterSeed", value: masterSeed),
      ResourceEntity(name: "iv", value: iv),
      ResourceEntity(name: "headerHmac", value: headerHmac),
      ResourceEntity(name: "dataHmac", value: dataHmac),
    ];
  }
}

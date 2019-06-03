

const bool isRelease = const bool.fromEnvironment("dart.vm.product");
const isDebug = !isRelease;
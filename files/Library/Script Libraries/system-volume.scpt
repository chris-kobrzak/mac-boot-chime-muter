JsOsaDAS1.001.00bplist00�Vscript_o// SystemVolume "class"
const app = Application.currentApplication()
app.includeStandardAdditions = true
// "Conveniently", the first argument to setVolume is deprecated
const setVolume = app.setVolume.bind(app, null)

function turnDown() {
  return set(6)
}

function turnUp() {
  return set(31)
}

function set(volume) {
  return setVolume({outputVolume: volume})
}                              � jscr  ��ޭ
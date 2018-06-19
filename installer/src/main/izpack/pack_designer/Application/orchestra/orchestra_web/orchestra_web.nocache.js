function orchestra_web(){
  var $intern_0 = 'bootstrap', $intern_1 = 'begin', $intern_2 = 'gwt.codesvr.orchestra_web=', $intern_3 = 'gwt.codesvr=', $intern_4 = 'orchestra_web', $intern_5 = 'startup', $intern_6 = 'DUMMY', $intern_7 = 0, $intern_8 = 1, $intern_9 = 'iframe', $intern_10 = 'javascript:""', $intern_11 = 'position:absolute; width:0; height:0; border:none; left: -1000px;', $intern_12 = ' top: -1000px;', $intern_13 = 'CSS1Compat', $intern_14 = '<!doctype html>', $intern_15 = '', $intern_16 = '<html><head><\/head><body><\/body><\/html>', $intern_17 = 'undefined', $intern_18 = 'DOMContentLoaded', $intern_19 = 50, $intern_20 = 'script', $intern_21 = 'javascript', $intern_22 = 'Failed to load ', $intern_23 = 'moduleStartup', $intern_24 = 'scriptTagAdded', $intern_25 = 'moduleRequested', $intern_26 = 'meta', $intern_27 = 'name', $intern_28 = 'orchestra_web::', $intern_29 = '::', $intern_30 = 'gwt:property', $intern_31 = 'content', $intern_32 = '=', $intern_33 = 'gwt:onPropertyErrorFn', $intern_34 = 'Bad handler "', $intern_35 = '" for "gwt:onPropertyErrorFn"', $intern_36 = 'gwt:onLoadErrorFn', $intern_37 = '" for "gwt:onLoadErrorFn"', $intern_38 = '#', $intern_39 = '?', $intern_40 = '/', $intern_41 = 'img', $intern_42 = 'clear.cache.gif', $intern_43 = 'baseUrl', $intern_44 = 'orchestra_web.nocache.js', $intern_45 = 'base', $intern_46 = '//', $intern_47 = 'compat.mode', $intern_48 = 'BackCompat', $intern_49 = 'mobile.user.agent', $intern_50 = 'android', $intern_51 = 'mobile', $intern_52 = 'iphone', $intern_53 = 'ipad', $intern_54 = 'not_mobile', $intern_55 = 'user.agent', $intern_56 = 'webkit', $intern_57 = 'safari', $intern_58 = 'msie', $intern_59 = 10, $intern_60 = 11, $intern_61 = 'ie10', $intern_62 = 9, $intern_63 = 'ie9', $intern_64 = 8, $intern_65 = 'ie8', $intern_66 = 'gecko', $intern_67 = 'gecko1_8', $intern_68 = 2, $intern_69 = 3, $intern_70 = 4, $intern_71 = 'selectingPermutation', $intern_72 = 'orchestra_web.devmode.js', $intern_73 = '305DB633AC9E5F6BEFA43E6911BE54E2', $intern_74 = '4239064115DA6675D6E29EBF68EA088F', $intern_75 = '48ACDB82C3D03BE67AB0BDBA70528820', $intern_76 = '4F6027352FE8F6970FCDEBDE5AEF60EB', $intern_77 = '4FD36BE8D5C95D0EC541C291494EA38D', $intern_78 = '5000635732B7006896929D92082FA1F0', $intern_79 = '5C64689E06E540A7C208F84DCAA6C6A8', $intern_80 = '6C0E448ED93EEEB3E06C306723EB30AE', $intern_81 = '70DAFD43CD238D13458E12ADF2D0AC07', $intern_82 = '961A89C5992678E9A603D7C779561B91', $intern_83 = '9A69F435ED89B37AC28EE15DE13A8232', $intern_84 = '9EE73D8777929229FA3BB4B1B23370CF', $intern_85 = 'B98F903DAB93A1DE478215BE089C6F8E', $intern_86 = 'C4B77264983705EB9D8D2CBDC769B770', $intern_87 = 'CE9A41AB6150430B4CD5CB2D4C8C4F2E', $intern_88 = 'EEB097BA93DE4778450B688C8629E7F2', $intern_89 = ':', $intern_90 = '.cache.js', $intern_91 = 'loadExternalRefs', $intern_92 = 'end', $intern_93 = 'http:', $intern_94 = 'file:', $intern_95 = '_gwt_dummy_', $intern_96 = '__gwtDevModeHook:orchestra_web', $intern_97 = 'Ignoring non-whitelisted Dev Mode URL: ', $intern_98 = ':moduleBase', $intern_99 = 'head';
  var $wnd = window;
  var $doc = document;
  sendStats($intern_0, $intern_1);
  function isHostedMode(){
    var query = $wnd.location.search;
    return query.indexOf($intern_2) != -1 || query.indexOf($intern_3) != -1;
  }

  function sendStats(evtGroupString, typeString){
    if ($wnd.__gwtStatsEvent) {
      $wnd.__gwtStatsEvent({moduleName:$intern_4, sessionId:$wnd.__gwtStatsSessionId, subSystem:$intern_5, evtGroup:evtGroupString, millis:(new Date).getTime(), type:typeString});
    }
  }

  orchestra_web.__sendStats = sendStats;
  orchestra_web.__moduleName = $intern_4;
  orchestra_web.__errFn = null;
  orchestra_web.__moduleBase = $intern_6;
  orchestra_web.__softPermutationId = $intern_7;
  orchestra_web.__computePropValue = null;
  orchestra_web.__getPropMap = null;
  orchestra_web.__installRunAsyncCode = function(){
  }
  ;
  orchestra_web.__gwtStartLoadingFragment = function(){
    return null;
  }
  ;
  orchestra_web.__gwt_isKnownPropertyValue = function(){
    return false;
  }
  ;
  orchestra_web.__gwt_getMetaProperty = function(){
    return null;
  }
  ;
  var __propertyErrorFunction = null;
  var activeModules = $wnd.__gwt_activeModules = $wnd.__gwt_activeModules || {};
  activeModules[$intern_4] = {moduleName:$intern_4};
  orchestra_web.__moduleStartupDone = function(permProps){
    var oldBindings = activeModules[$intern_4].bindings;
    activeModules[$intern_4].bindings = function(){
      var props = oldBindings?oldBindings():{};
      var embeddedProps = permProps[orchestra_web.__softPermutationId];
      for (var i = $intern_7; i < embeddedProps.length; i++) {
        var pair = embeddedProps[i];
        props[pair[$intern_7]] = pair[$intern_8];
      }
      return props;
    }
    ;
  }
  ;
  var frameDoc;
  function getInstallLocationDoc(){
    setupInstallLocation();
    return frameDoc;
  }

  function setupInstallLocation(){
    if (frameDoc) {
      return;
    }
    var scriptFrame = $doc.createElement($intern_9);
    scriptFrame.src = $intern_10;
    scriptFrame.id = $intern_4;
    scriptFrame.style.cssText = $intern_11 + $intern_12;
    scriptFrame.tabIndex = -1;
    $doc.body.appendChild(scriptFrame);
    frameDoc = scriptFrame.contentDocument;
    if (!frameDoc) {
      frameDoc = scriptFrame.contentWindow.document;
    }
    frameDoc.open();
    var doctype = document.compatMode == $intern_13?$intern_14:$intern_15;
    frameDoc.write(doctype + $intern_16);
    frameDoc.close();
  }

  function installScript(filename){
    function setupWaitForBodyLoad(callback){
      function isBodyLoaded(){
        if (typeof $doc.readyState == $intern_17) {
          return typeof $doc.body != $intern_17 && $doc.body != null;
        }
        return /loaded|complete/.test($doc.readyState);
      }

      var bodyDone = isBodyLoaded();
      if (bodyDone) {
        callback();
        return;
      }
      function onBodyDone(){
        if (!bodyDone) {
          bodyDone = true;
          callback();
          if ($doc.removeEventListener) {
            $doc.removeEventListener($intern_18, onBodyDone, false);
          }
          if (onBodyDoneTimerId) {
            clearInterval(onBodyDoneTimerId);
          }
        }
      }

      if ($doc.addEventListener) {
        $doc.addEventListener($intern_18, onBodyDone, false);
      }
      var onBodyDoneTimerId = setInterval(function(){
        if (isBodyLoaded()) {
          onBodyDone();
        }
      }
      , $intern_19);
    }

    function installCode(code_0){
      var doc = getInstallLocationDoc();
      var docbody = doc.body;
      var script = doc.createElement($intern_20);
      script.language = $intern_21;
      script.src = code_0;
      if (orchestra_web.__errFn) {
        script.onerror = function(){
          orchestra_web.__errFn($intern_4, new Error($intern_22 + code_0));
        }
        ;
      }
      docbody.appendChild(script);
      sendStats($intern_23, $intern_24);
    }

    sendStats($intern_23, $intern_25);
    setupWaitForBodyLoad(function(){
      installCode(filename);
    }
    );
  }

  orchestra_web.__startLoadingFragment = function(fragmentFile){
    return computeUrlForResource(fragmentFile);
  }
  ;
  orchestra_web.__installRunAsyncCode = function(code_0){
    var doc = getInstallLocationDoc();
    var docbody = doc.body;
    var script = doc.createElement($intern_20);
    script.language = $intern_21;
    script.text = code_0;
    docbody.appendChild(script);
  }
  ;
  function processMetas(){
    var metaProps = {};
    var propertyErrorFunc;
    var onLoadErrorFunc;
    var metas = $doc.getElementsByTagName($intern_26);
    for (var i = $intern_7, n = metas.length; i < n; ++i) {
      var meta = metas[i], name_0 = meta.getAttribute($intern_27), content;
      if (name_0) {
        name_0 = name_0.replace($intern_28, $intern_15);
        if (name_0.indexOf($intern_29) >= $intern_7) {
          continue;
        }
        if (name_0 == $intern_30) {
          content = meta.getAttribute($intern_31);
          if (content) {
            var value_0, eq = content.indexOf($intern_32);
            if (eq >= $intern_7) {
              name_0 = content.substring($intern_7, eq);
              value_0 = content.substring(eq + $intern_8);
            }
             else {
              name_0 = content;
              value_0 = $intern_15;
            }
            metaProps[name_0] = value_0;
          }
        }
         else if (name_0 == $intern_33) {
          content = meta.getAttribute($intern_31);
          if (content) {
            try {
              propertyErrorFunc = eval(content);
            }
             catch (e) {
              alert($intern_34 + content + $intern_35);
            }
          }
        }
         else if (name_0 == $intern_36) {
          content = meta.getAttribute($intern_31);
          if (content) {
            try {
              onLoadErrorFunc = eval(content);
            }
             catch (e) {
              alert($intern_34 + content + $intern_37);
            }
          }
        }
      }
    }
    __gwt_getMetaProperty = function(name_0){
      var value_0 = metaProps[name_0];
      return value_0 == null?null:value_0;
    }
    ;
    __propertyErrorFunction = propertyErrorFunc;
    orchestra_web.__errFn = onLoadErrorFunc;
  }

  function computeScriptBase(){
    function getDirectoryOfFile(path){
      var hashIndex = path.lastIndexOf($intern_38);
      if (hashIndex == -1) {
        hashIndex = path.length;
      }
      var queryIndex = path.indexOf($intern_39);
      if (queryIndex == -1) {
        queryIndex = path.length;
      }
      var slashIndex = path.lastIndexOf($intern_40, Math.min(queryIndex, hashIndex));
      return slashIndex >= $intern_7?path.substring($intern_7, slashIndex + $intern_8):$intern_15;
    }

    function ensureAbsoluteUrl(url_0){
      if (url_0.match(/^\w+:\/\//)) {
      }
       else {
        var img = $doc.createElement($intern_41);
        img.src = url_0 + $intern_42;
        url_0 = getDirectoryOfFile(img.src);
      }
      return url_0;
    }

    function tryMetaTag(){
      var metaVal = __gwt_getMetaProperty($intern_43);
      if (metaVal != null) {
        return metaVal;
      }
      return $intern_15;
    }

    function tryNocacheJsTag(){
      var scriptTags = $doc.getElementsByTagName($intern_20);
      for (var i = $intern_7; i < scriptTags.length; ++i) {
        if (scriptTags[i].src.indexOf($intern_44) != -1) {
          return getDirectoryOfFile(scriptTags[i].src);
        }
      }
      return $intern_15;
    }

    function tryBaseTag(){
      var baseElements = $doc.getElementsByTagName($intern_45);
      if (baseElements.length > $intern_7) {
        return baseElements[baseElements.length - $intern_8].href;
      }
      return $intern_15;
    }

    function isLocationOk(){
      var loc = $doc.location;
      return loc.href == loc.protocol + $intern_46 + loc.host + loc.pathname + loc.search + loc.hash;
    }

    var tempBase = tryMetaTag();
    if (tempBase == $intern_15) {
      tempBase = tryNocacheJsTag();
    }
    if (tempBase == $intern_15) {
      tempBase = tryBaseTag();
    }
    if (tempBase == $intern_15 && isLocationOk()) {
      tempBase = getDirectoryOfFile($doc.location.href);
    }
    tempBase = ensureAbsoluteUrl(tempBase);
    return tempBase;
  }

  function computeUrlForResource(resource){
    if (resource.match(/^\//)) {
      return resource;
    }
    if (resource.match(/^[a-zA-Z]+:\/\//)) {
      return resource;
    }
    return orchestra_web.__moduleBase + resource;
  }

  function getCompiledCodeFilename(){
    var answers = [];
    var softPermutationId = $intern_7;
    function unflattenKeylistIntoAnswers(propValArray, value_0){
      var answer = answers;
      for (var i = $intern_7, n = propValArray.length - $intern_8; i < n; ++i) {
        answer = answer[propValArray[i]] || (answer[propValArray[i]] = []);
      }
      answer[propValArray[n]] = value_0;
    }

    var values = [];
    var providers = [];
    function computePropValue(propName){
      var value_0 = providers[propName](), allowedValuesMap = values[propName];
      if (value_0 in allowedValuesMap) {
        return value_0;
      }
      var allowedValuesList = [];
      for (var k in allowedValuesMap) {
        allowedValuesList[allowedValuesMap[k]] = k;
      }
      if (__propertyErrorFunction) {
        __propertyErrorFunction(propName, allowedValuesList, value_0);
      }
      throw null;
    }

    providers[$intern_47] = function(){
      return document.compatMode == $intern_13?$intern_13:$intern_48;
    }
    ;
    values[$intern_47] = {BackCompat:$intern_7, CSS1Compat:$intern_8};
    providers[$intern_49] = function(){
      {
        var ua = window.navigator.userAgent.toLowerCase();
        if (ua.indexOf($intern_50) != -1) {
          return $intern_51;
        }
        if (ua.indexOf($intern_52) != -1) {
          return $intern_51;
        }
        if (ua.indexOf($intern_53) != -1) {
          return $intern_51;
        }
        return $intern_54;
      }
    }
    ;
    values[$intern_49] = {mobile:$intern_7, not_mobile:$intern_8};
    providers[$intern_55] = function(){
      var ua = navigator.userAgent.toLowerCase();
      var docMode = $doc.documentMode;
      if (function(){
        return ua.indexOf($intern_56) != -1;
      }
      ())
        return $intern_57;
      if (function(){
        return ua.indexOf($intern_58) != -1 && (docMode >= $intern_59 && docMode < $intern_60);
      }
      ())
        return $intern_61;
      if (function(){
        return ua.indexOf($intern_58) != -1 && (docMode >= $intern_62 && docMode < $intern_60);
      }
      ())
        return $intern_63;
      if (function(){
        return ua.indexOf($intern_58) != -1 && (docMode >= $intern_64 && docMode < $intern_60);
      }
      ())
        return $intern_65;
      if (function(){
        return ua.indexOf($intern_66) != -1 || docMode >= $intern_60;
      }
      ())
        return $intern_67;
      return $intern_15;
    }
    ;
    values[$intern_55] = {gecko1_8:$intern_7, ie10:$intern_8, ie8:$intern_68, ie9:$intern_69, safari:$intern_70};
    __gwt_isKnownPropertyValue = function(propName, propValue){
      return propValue in values[propName];
    }
    ;
    orchestra_web.__getPropMap = function(){
      var result = {};
      for (var key in values) {
        if (values.hasOwnProperty(key)) {
          result[key] = computePropValue(key);
        }
      }
      return result;
    }
    ;
    orchestra_web.__computePropValue = computePropValue;
    $wnd.__gwt_activeModules[$intern_4].bindings = orchestra_web.__getPropMap;
    sendStats($intern_0, $intern_71);
    if (isHostedMode()) {
      return computeUrlForResource($intern_72);
    }
    var strongName;
    try {
      unflattenKeylistIntoAnswers([$intern_48, $intern_51, $intern_57], $intern_73);
      unflattenKeylistIntoAnswers([$intern_48, $intern_54, $intern_63], $intern_74);
      unflattenKeylistIntoAnswers([$intern_48, $intern_51, $intern_67], $intern_75);
      unflattenKeylistIntoAnswers([$intern_48, $intern_54, $intern_65], $intern_76);
      unflattenKeylistIntoAnswers([$intern_13, $intern_54, $intern_57], $intern_77);
      unflattenKeylistIntoAnswers([$intern_13, $intern_54, $intern_65], $intern_78);
      unflattenKeylistIntoAnswers([$intern_13, $intern_51, $intern_67], $intern_79);
      unflattenKeylistIntoAnswers([$intern_13, $intern_51, $intern_57], $intern_80);
      unflattenKeylistIntoAnswers([$intern_13, $intern_54, $intern_63], $intern_81);
      unflattenKeylistIntoAnswers([$intern_13, $intern_51, $intern_63], $intern_82);
      unflattenKeylistIntoAnswers([$intern_48, $intern_51, $intern_65], $intern_83);
      unflattenKeylistIntoAnswers([$intern_13, $intern_51, $intern_65], $intern_84);
      unflattenKeylistIntoAnswers([$intern_13, $intern_54, $intern_67], $intern_85);
      unflattenKeylistIntoAnswers([$intern_48, $intern_51, $intern_63], $intern_86);
      unflattenKeylistIntoAnswers([$intern_48, $intern_54, $intern_67], $intern_87);
      unflattenKeylistIntoAnswers([$intern_48, $intern_54, $intern_57], $intern_88);
      strongName = answers[computePropValue($intern_47)][computePropValue($intern_49)][computePropValue($intern_55)];
      var idx = strongName.indexOf($intern_89);
      if (idx != -1) {
        softPermutationId = parseInt(strongName.substring(idx + $intern_8), $intern_59);
        strongName = strongName.substring($intern_7, idx);
      }
    }
     catch (e) {
    }
    orchestra_web.__softPermutationId = softPermutationId;
    return computeUrlForResource(strongName + $intern_90);
  }

  function loadExternalStylesheets(){
    if (!$wnd.__gwt_stylesLoaded) {
      $wnd.__gwt_stylesLoaded = {};
    }
    sendStats($intern_91, $intern_1);
    sendStats($intern_91, $intern_92);
  }

  processMetas();
  orchestra_web.__moduleBase = computeScriptBase();
  activeModules[$intern_4].moduleBase = orchestra_web.__moduleBase;
  var filename = getCompiledCodeFilename();
  if ($wnd) {
    var devModePermitted = !!($wnd.location.protocol == $intern_93 || $wnd.location.protocol == $intern_94);
    $wnd.__gwt_activeModules[$intern_4].canRedirect = devModePermitted;
    function supportsSessionStorage(){
      var key = $intern_95;
      try {
        $wnd.sessionStorage.setItem(key, key);
        $wnd.sessionStorage.removeItem(key);
        return true;
      }
       catch (e) {
        return false;
      }
    }

    if (devModePermitted && supportsSessionStorage()) {
      var devModeKey = $intern_96;
      var devModeUrl = $wnd.sessionStorage[devModeKey];
      if (!/^http:\/\/(localhost|127\.0\.0\.1)(:\d+)?\/.*$/.test(devModeUrl)) {
        if (devModeUrl && (window.console && console.log)) {
          console.log($intern_97 + devModeUrl);
        }
        devModeUrl = $intern_15;
      }
      if (devModeUrl && !$wnd[devModeKey]) {
        $wnd[devModeKey] = true;
        $wnd[devModeKey + $intern_98] = computeScriptBase();
        var devModeScript = $doc.createElement($intern_20);
        devModeScript.src = devModeUrl;
        var head = $doc.getElementsByTagName($intern_99)[$intern_7];
        head.insertBefore(devModeScript, head.firstElementChild || head.children[$intern_7]);
        return false;
      }
    }
  }
  loadExternalStylesheets();
  sendStats($intern_0, $intern_92);
  installScript(filename);
  return true;
}

orchestra_web.succeeded = orchestra_web();

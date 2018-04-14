'use babel'

import units from '../helpers/units'

const trailingWhitespace = /\s$/
const attributeInput = /^([a-zA-Z][-a-zA-Z]*)$/;
const attributePattern = /\s+([a-zA-Z][-a-zA-Z]*)\s*=\s*$/
const tagInput = /^<([a-zA-Z][-a-zA-Z]*|$)/
const tagNotInput = />([a-zA-Z][-a-zA-Z]*|$)/
const tagPattern = /<([a-zA-Z][-a-zA-Z]*)(?:\s|$)/
const completions = require('../../completions/components')

export default {
  getTagNameCompletions: function() {
    let _completions = []
    completions.tags.completions.forEach((obj) => {
      _completions.push(units.clone(obj))
    })

    return _completions
  },
  getAttributeNameCompletions: function(editor, bufferPosition) {
    let _completions = []
    let tag = this.getPreviousTag(editor, bufferPosition)

    if (completions.attributes.tags[tag]) {
      completions.attributes.tags[tag].forEach((attr) => {
        completions.attributes.completions[attr].forEach((obj) => {
          _completions.push(units.clone(obj))
        })
      })
    }

    completions.attributes.global.forEach((attr) => {
      completions.attributes.completions[attr].forEach((obj) => {
        _completions.push(units.clone(obj))
      })
    })

    return _completions
  },
  getAttributeValueCompletions: function(line) {
    let _completions = [],
    attribute = this.getPreviousAttribute(line)

    if (completions.values[attribute]) {
      completions.values[attribute].forEach((text) => {
        _completions.push({
          "text": text,
          "type": "value"
        })
      })
    }
    return _completions
  },
  getPreviousTag: function(editor, bufferPosition) {
    var ref
    let row = bufferPosition.row

    while (row >= 0) {
      ref = tagPattern.exec(editor.lineTextForBufferRow(row))
      if (ref) {
        return ref[1]
      }
      row--
    }
    return null
  },
  getPreviousAttribute: function(line) {
    var ref, ref1
    let quoteIndex = line.length - 1

    while (line[quoteIndex] && !((ref = line[quoteIndex]) === '"' || ref === "'")) {
      quoteIndex--
    }
    line = line.substring(0, quoteIndex)
    return (ref1 = attributePattern.exec(line)) != null ? ref1[1] : null
  },
  isAttributeValue: function(scopes) {
    return this.hasTagScope(scopes) && this.hasAttributeValueScope(scopes) && !this.hasAttributeContentScope(scopes)
  },
  isAttribute: function(prefix, scopes) {
    if (!trailingWhitespace.test(prefix) && !attributeInput.test(prefix)) {
      return false
    }
    return this.hasTagScope(scopes) && !this.hasAttributeContentScope(scopes)
  },
  isTag: function(scopes, line) {
    let segment = line.split(' ').pop()

    return tagInput.test(segment) && !tagNotInput.test(segment) && !this.hasScopeDescriptor(scopes, [
      'string.quoted.double.js',
      'string.quoted.single.js'
    ]) && !this.hasAttributeContentScope(scopes)
  },
  hasTagScope: function(scopes) {
    return this.hasScopeDescriptor(scopes, [
      'meta.tag.any.html',
      'meta.tag.other.html',
      'meta.tag.block.any.html',
      'meta.tag.inline.any.html',
      'meta.tag.structure.any.html'
    ])
  },
  hasAttributeValueScope: function(scopes) {
    return this.hasScopeDescriptor(scopes, [
      'string.quoted.double.html',
      'string.quoted.single.html'
    ])
  },
  hasAttributeContentScope: function(scopes) {
    return this.hasScopeDescriptor(scopes, [
      'punctuation.definition.brace.curly.begin.js',
      'punctuation.definition.brace.curly.end.js',
      'meta.brace.curly.js'
    ])
  },
  hasScopeDescriptor: function(fromScopes, toScopes) {
    for (let scope of toScopes) {
      if (typeof(scope) === 'string') {
        if (fromScopes.indexOf(scope) !== -1) {
          return true
        }
      } else {
        let pass = false
        for (let text of fromScopes) {
          if (scope.test(text)) {
            pass = true
          }
        }
        if (pass) return true
      }
    }
    return false
  }
}

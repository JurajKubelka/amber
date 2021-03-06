Object subclass: #JQuery
	instanceVariableNames: 'jquery'
	category: 'JQuery'!

!JQuery methodsFor: 'DOM insertion'!

append: anObject
    "Append anObject at the end of the element."
    anObject appendToJQuery: self
!

appendElement: anElement
    "Append anElement at the end of the element.
     Dont't call this method directly, use #append: instead"
    self call: 'append' withArgument: anElement
!

appendToJQuery: aJQuery
    aJQuery appendElement: jquery
!

contents: anObject
    self empty.
    self append: anObject
!

empty
    ^self call: 'empty'
! !

!JQuery methodsFor: 'accessing'!

jquery
	^jquery
! !

!JQuery methodsFor: 'attributes'!

removeAttribute: aString
    "Remove an attribute from each element in the set of matched elements."
    ^self call: 'removeAttribute' withArgument: aString
!

attr: aString
    "Get the value of an attribute for the first element in the set of matched elements."
    ^self call: 'attr' withArgument: aString
!

val
    "Get the current value of the first element in the set of matched elements."
    ^self call: 'val'
!

val: aString
    self call: 'val' withArgument: aString
!

attrAt: aString put: anotherString
    "Set the value of an attribute for the first element in the set of matched elements."
    <self['@jquery'].attr(aString, anotherString)>
! !

!JQuery methodsFor: 'css'!

cssAt: aString
	<return self['@jquery'].css(aString)>
!

cssAt: aString put: anotherString
    <self['@jquery'].css(aString, anotherString)>
!

addClass: aString
    "Adds the specified class(es) to each of the set of matched elements."
    self call: 'addClass' withArgument: aString
!

removeClass: aString
    "Remove a single class, multiple classes, or all classes from each element in the set of matched elements."
    self call: 'removeClass' withArgument: aString
!

toggleClass: aString
    "Add or remove one or more classes from each element in the set of matched elements, depending on either the class's presence or the value of the switch argument."
    self call: 'toggleClass' withArgument: aString
!

height 
    "Get the current computed height for the first element in the set of matched elements."
    ^self call: 'height'
!

height: anInteger
    self call: 'height' withArgument: anInteger
!

width: anInteger
    self call: 'width' withArgument: anInteger
!

width
    "Get the current computed width for the first element in the set of matched elements."
    ^self call: 'width'
!

innerHeight
    "Get the current computed height for the first element in the set of matched elements, including padding but not border."
    ^self call: 'innerHeight'
!

innerWidth
    "Get the current computed width for the first element in the set of matched elements, including padding but not border."
    ^self call: 'innerWidth'
!

outerHeight
    "Get the current computed height for the first element in the set of matched elements, including padding, border, and optionally margin."
    ^self call: 'outerHeight'
!

outerWidth
    "Get the current computed width for the first element in the set of matched elements, including padding and border."
    ^self call: 'outerWidth'
!

top
    "Get the current y coordinate of the first element in the set of matched elements, relative to the offset parent."
    ^(self call: 'position') basicAt: 'top'
!

left
    "Get the current x coordinate of the first element in the set of matched elements, relative to the offset parent."
    ^(self call: 'position') basicAt: 'left'
!

offsetLeft
    "Get the current coordinates of the first element in the set of matched elements, relative to the document."
    ^(self call: 'offset') basicAt: 'left'
!

offsetTop
    "Get the current coordinates of the first element in the set of matched elements, relative to the document."
    ^(self call: 'offset') basicAt: 'top'
!

scrollLeft
    "Get the current horizontal position of the scroll bar for the first element in the set of matched elements."
    ^self call: 'scrollLeft'
!

scrollTop
    "Get the current vertical position of the scroll bar for the first element in the set of matched elements."
    ^self call: 'scrollTop'
!

scrollLeft: anInteger
    self call: 'scrollLeft' withArgument: anInteger
!

scrollTop: anInteger
    self call: 'scrollTop' withArgument: anInteger
! !

!JQuery methodsFor: 'effects'!

fadeIn
 	self call: 'fadeIn'
!

slideDown
 	self call: 'slideDown'
!

fadeInSlow
 	self call: 'fadeIn' withArgument: 'slow'
!

fadeOut
 	self call: 'fadeOut'
!

fadeOutSlow
 	self call: 'fadeOut' withArgument: 'slow'
!

slideUp
 	self call: 'slideUp'
! !

!JQuery methodsFor: 'enumerating'!

do: aBlock
    self elementsDo: [:anElement|  aBlock value: (JQuery fromElement: anElement)]
! !

!JQuery methodsFor: 'events'!

focus
    self call: 'focus'
!

show
    self call: 'show'
!

hide
    self call: 'hide'
!

remove
    self call: 'remove'
!

on: anEventString do: aBlock
    "Attach aBlock for anEventString on the element"
    <self['@jquery'].bind(anEventString, function(e){aBlock(e, self)})>
!

removeEvents: aString
    "Unbind all handlers attached to the event aString"
    self call: 'unbind' withArgument: aString
!

onLoadDo: aBlock
	"Bind an event handler to the 'load' JavaScript event."
        self call: 'load' withArgument: aBlock
! !

!JQuery methodsFor: 'initialization'!

initializeWithJQueryObject: anObject
    jquery := anObject
! !

!JQuery methodsFor: 'private'!

call: aString
	<return self['@jquery'][aString]()>
!

call: aString withArgument: anObject
    <return self['@jquery'][aString](anObject)>
!

elementsDo: aBlock
    "Iterate over a jQuery object, executing a function for each matched element."
    <self['@jquery'].each(function(index, element){aBlock(element, self)})>
! !

!JQuery methodsFor: 'testing'!

hasClass: aString
    "Determine whether any of the matched elements are assigned the given class."
    ^self call: 'hasClass' withArgument: aString
! !

!JQuery methodsFor: 'traversing'!

find: aSelector
    "Get the descendants of each element in the current set of matched elements, filtered by a selector, jQuery object, or element."
    ^ self call: 'find' withArgument: aSelector
! !

!JQuery class methodsFor: 'instance creation'!

fromString: aString
    | newJQuery |
    <newJQuery = jQuery(String(aString))>.
    ^self from: newJQuery
!

from: anObject
    ^self new
	initializeWithJQueryObject: anObject;
	yourself
!

window
	<return self._from_(jQuery(window))>
!

body
	<return self._from_(jQuery('body'))>
!

document
	<return self._from_(jQuery(document))>
!

fromElement: anElement
    | newJQuery |
    <newJQuery = jQuery(anElement)>.
    ^self from: newJQuery
!

documentReady: aBlock
	<jQuery(document).ready(aBlock)>
! !

Object subclass: #Ajax
	instanceVariableNames: 'settings'
	category: 'JQuery'!
!Ajax commentStamp!
instance variable names:
- settings  A set of key/value pairs that configure the Ajax request. All settings are optional.

Full list of settings options at http://api.jquery.com/jQuery.ajax/!

!Ajax methodsFor: 'accessing'!

at: aKey
    ^settings at: aKey ifAbsent: [nil]
!

at: aKey put: aValue
    settings at: aKey put: aValue
!

url
    ^self at: 'url'
!

url: aString
    self at: 'url' put: aString
! !

!Ajax methodsFor: 'actions'!

send
    <jQuery.ajax(self['@settings'])>
! !

!Ajax methodsFor: 'callbacks'!

onSuccessDo: aBlock
	"Set action to execute when Ajax request is successful. Pass received data as block argument. Block arguments: data, textStatus, jqXHR"
	self at: 'success' put: aBlock
!

onCompleteDo: aBlock
	"A block to be called when the request finishes (after success and error callbacks are executed). Block arguments: jqXHR, textStatus"
	self at: 'complete' put: aBlock
!

onErrorDo: aBlock
	"A block to be called if the request fails.Block arguments: jqXHR, textStatus, errorThrown"
	self at: 'error' put: aBlock
! !

!Ajax methodsFor: 'initialization'!

initialize
    super initialize.
    settings := Dictionary new
! !

!Ajax class methodsFor: 'instance creation'!

url: aString
    ^self new
	url: aString;
	yourself
! !

!BlockClosure methodsFor: '*JQuery'!

appendToJQuery: aJQuery
	self value: (HTMLCanvas onJQuery: aJQuery)
! !

!String methodsFor: '*JQuery'!

asJQuery
    ^JQuery fromString: self
!

appendToJQuery: aJQuery
    <aJQuery._appendElement_(String(self))>
! !

!HTMLCanvas methodsFor: '*JQuery'!

appendToJQuery: aJQuery
    aJQuery appendElement: root element
! !


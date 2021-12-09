// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var React = require("react")
var React$1 = require("@ionic/react")

function Page(Props) {
  var title = Props.title
  var children = Props.children
  return React.createElement(
    React.Fragment,
    undefined,
    React.createElement(React$1.IonHeader, {
      children: React.createElement(React$1.IonToolbar, {
        children: React.createElement(React$1.IonTitle, {
          children: title,
        }),
      }),
    }),
    React.createElement(React$1.IonContent, {
      children: React.createElement(
        "div",
        undefined,
        React.createElement(React$1.IonGrid, {
          children: React.createElement(React$1.IonRow, {
            children: React.createElement(React$1.IonCol, {
              children: children,
              sizeMd: "5",
              sizeLg: "4",
            }),
            className: "ion-justify-content-center",
          }),
        })
      ),
      className: "ion-padding",
    })
  )
}

var make = Page

exports.make = make
/* react Not a pure module */

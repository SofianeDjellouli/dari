// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict"

var React = require("react")
var Spread = require("../../components/spread/Spread.bs.js")
var Caml_option = require("rescript/lib/js/caml_option.js")
var React$1 = require("@ionic/react")

var IonContent = {}

var IonApp = {}

var Content = {
  IonContent: IonContent,
  IonApp: IonApp,
}

var IonSpinner = {}

var ProgressIndicators = {
  IonSpinner: IonSpinner,
}

var IonHeader = {}

var IonToolbar = {}

var IonTitle = {}

var IonButtons = {}

function Ionic$Toolbar$MainHeader(Props) {
  var children = Props.children
  var color = Props.color
  var tmp = {
    children: React.createElement(React$1.IonTitle, {
      children: children,
    }),
  }
  if (color !== undefined) {
    tmp.color = Caml_option.valFromOption(color)
  }
  return React.createElement(React$1.IonHeader, {
    children: React.createElement(React$1.IonToolbar, tmp),
  })
}

var MainHeader = {
  make: Ionic$Toolbar$MainHeader,
}

var Toolbar = {
  IonHeader: IonHeader,
  IonToolbar: IonToolbar,
  IonTitle: IonTitle,
  IonButtons: IonButtons,
  MainHeader: MainHeader,
}

var IonPage = {}

var Navigation = {
  IonPage: IonPage,
}

var IonItem = {}

var IonItemGroup = {}

var IonLabel = {}

var IonNote = {}

var IonItemSliding = {}

var IonItemOptions = {}

var IonItemOption = {}

var IonItemDivider = {}

var Item = {
  IonItem: IonItem,
  IonItemGroup: IonItemGroup,
  IonLabel: IonLabel,
  IonNote: IonNote,
  IonItemSliding: IonItemSliding,
  IonItemOptions: IonItemOptions,
  IonItemOption: IonItemOption,
  IonItemDivider: IonItemDivider,
}

var IonInput = {}

var Input = {
  IonInput: IonInput,
}

var IonGrid = {}

var IonCol = {}

var IonRow = {}

var Grid = {
  IonGrid: IonGrid,
  IonCol: IonCol,
  IonRow: IonRow,
}

var IonButton = {}

function Ionic$Button$AsyncButton(Props) {
  var color = Props.color
  var expand = Props.expand
  var label = Props.label
  var isLoadingOpt = Props.isLoading
  var isLoading = isLoadingOpt !== undefined ? isLoadingOpt : false
  return React.createElement(Spread.make, {
    props: {
      type: "submit",
    },
    children: React.createElement(React$1.IonButton, {
      children: isLoading ? React.createElement(React$1.IonSpinner, {}) : label,
      color: color,
      expand: expand,
    }),
  })
}

var AsyncButton = {
  make: Ionic$Button$AsyncButton,
}

var Button = {
  IonButton: IonButton,
  AsyncButton: AsyncButton,
}

var IonToast = {}

var Toast = {
  IonToast: IonToast,
}

function Ionic$Form(Props) {
  var onSubmit = Props.onSubmit
  var children = Props.children
  return React.createElement(
    "form",
    {
      onSubmit: onSubmit,
    },
    children,
    React.createElement("input", {
      style: {
        display: "none",
      },
      type: "submit",
    })
  )
}

var Form = {
  make: Ionic$Form,
}

var SpreadableIonSplitPanel = {}

function Ionic$Menu$IonSplitPane(Props) {
  var contentId = Props.contentId
  var when_ = Props.when_
  var children = Props.children
  var tmp = {
    children: children,
  }
  if (contentId !== undefined) {
    tmp.contentId = contentId
  }
  return React.createElement(Spread.make, {
    props: {
      when: when_,
    },
    children: React.createElement(React$1.IonSplitPane, tmp),
  })
}

var IonSplitPane = {
  make: Ionic$Menu$IonSplitPane,
}

var IonMenu = {}

var IonMenuToggle = {}

var Menu = {
  SpreadableIonSplitPanel: SpreadableIonSplitPanel,
  IonSplitPane: IonSplitPane,
  IonMenu: IonMenu,
  IonMenuToggle: IonMenuToggle,
}

var IonList = {}

var IonListHeader = {}

var List = {
  IonList: IonList,
  IonListHeader: IonListHeader,
}

var IonIcon = {}

var Icon = {
  IonIcon: IonIcon,
}

var IonTabs = {}

var IonTabBar = {}

var IonTab = {}

var IonTabButton = {}

var Tabs = {
  IonTabs: IonTabs,
  IonTabBar: IonTabBar,
  IonTab: IonTab,
  IonTabButton: IonTabButton,
}

var IonPage$1 = {}

var IonCheckbox = {}

var Checkbox = {
  IonCheckbox: IonCheckbox,
}

var IonReorderGroup = {}

var IonReorder = {}

var Reorder = {
  IonReorderGroup: IonReorderGroup,
  IonReorder: IonReorder,
}

exports.Content = Content
exports.ProgressIndicators = ProgressIndicators
exports.Toolbar = Toolbar
exports.Navigation = Navigation
exports.Item = Item
exports.Input = Input
exports.Grid = Grid
exports.Button = Button
exports.Toast = Toast
exports.Form = Form
exports.Menu = Menu
exports.List = List
exports.Icon = Icon
exports.Tabs = Tabs
exports.IonPage = IonPage$1
exports.Checkbox = Checkbox
exports.Reorder = Reorder
/* react Not a pure module */

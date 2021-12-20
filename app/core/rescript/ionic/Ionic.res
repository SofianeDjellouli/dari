type color = [
  | #primary
  | #secondary
  | #tertiary
  | #success
  | #warning
  | #danger
  | #light
  | #medium
  | #dark
]

type slot = [
  | #primary
  | #secondary
  | #end
  | #start
]

type side = [#end | #start]

type lines = [#full | #inset | #none]

type expand = [#block | #full]

type fill = [#clear | #default | #outline | #solid]

type onFormEvent = ReactEvent.Form.t => unit

type onClickEvent = ReactEvent.Mouse.t => unit

module Content = {
  module IonContent = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~className: string=?) => React.element =
      "IonContent"
  }

  module IonApp = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonApp"
  }
}

module ProgressIndicators = {
  module IonSpinner = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~color: color=?,
      ~name: [#bubbles | #circles | #circular | #crescent | #dots | #lines]=?,
    ) => React.element = "IonSpinner"
  }
}

module Toolbar = {
  module IonHeader = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonHeader"
  }

  module IonToolbar = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~color: color=?) => React.element = "IonToolbar"
  }

  module IonTitle = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonTitle"
  }

  module IonButtons = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~slot: slot=?) => React.element = "IonButtons"
  }

  module MainHeader = {
    @react.component
    let make = (~children: React.element, ~color: option<color>=?) =>
      <IonHeader> <IonToolbar ?color> <IonTitle> children </IonTitle> </IonToolbar> </IonHeader>
  }
}

module Navigation = {
  module IonPage = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonPage"
  }
}

module Item = {
  module IonItem = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~lines: [#full | #inset | #none]=?,
      ~button: bool=?,
      ~onClick: onClickEvent=?,
      ~color: color=?,
    ) => React.element = "IonItem"
  }

  module IonItemGroup = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonItemGroup"
  }

  module IonLabel = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~position: [#fixed | #floating | #stacked]=?,
    ) => React.element = "IonLabel"
  }

  module IonNote = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~color: color=?,
      ~className: string=?,
    ) => React.element = "IonNote"
  }

  module IonItemSliding = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonItemSliding"
  }

  module IonItemOptions = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~side: side=?) => React.element = "IonItemOptions"
  }

  module IonItemOption = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~onClick: onClickEvent=?,
      ~color: color=?,
      ~expandable: bool=?,
      ~name: string=?,
    ) => React.element = "IonItemOption"
  }

  module IonItemDivider = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonItemDivider"
  }
}

module Input = {
  module IonInput = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~name: string,
      ~placeholder: string=?,
      ~value: string,
      ~onIonChange: onFormEvent,
      ~autofocus: bool=?,
      ~color: color=?,
      ~onIonBlur: onFormEvent=?,
    ) => React.element = "IonInput"
  }
}

module Grid = {
  module IonGrid = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~className: string=?) => React.element = "IonGrid"
  }

  module IonCol = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~sizeMd: string=?,
      ~sizeLg: string=?,
    ) => React.element = "IonCol"
  }

  module IonRow = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~className: string=?) => React.element = "IonRow"
  }
}

module Button = {
  module IonButton = {
    type shape = [#round]

    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~color: color=?,
      ~expand: expand=?,
      ~slot: slot=?,
      ~shape: shape=?,
      ~onClick: onClickEvent=?,
      ~fill: fill=?,
      ~disabled: bool=?,
    ) => React.element = "IonButton"
  }

  module AsyncButton = {
    @react.component
    let make = (~color, ~expand, ~label: string, ~isLoading: bool=false) =>
      <Spread props={"type": "submit"}>
        <IonButton color expand>
          {switch isLoading {
          | true => <ProgressIndicators.IonSpinner />
          | false => React.string(label)
          }}
        </IonButton>
      </Spread>
  }
}

module Toast = {
  module IonToast = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~color: color=?,
      ~message: string=?,
      ~isOpen: bool=?,
      ~onDidPresent: unit => unit=?,
    ) => React.element = "IonToast"
  }
}

module Form = {
  @react.component
  let make = (~onSubmit: onFormEvent, ~children: React.element) =>
    <form onSubmit>
      children <input type_="submit" style={ReactDOMStyle.make(~display="none", ())} />
    </form>
}

module Menu = {
  module SpreadableIonSplitPanel = {
    @module("@ionic/react") @react.component
    external make: (~contentId: string=?, ~children: React.element) => React.element =
      "IonSplitPane"
  }

  module IonSplitPane = {
    @react.component
    let make = (~contentId: option<string>=?, ~when_: string, ~children: React.element) =>
      <Spread props={"when": when_}>
        <SpreadableIonSplitPanel ?contentId> children </SpreadableIonSplitPanel>
      </Spread>
  }

  module IonMenu = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~contentId: string=?) => React.element = "IonMenu"
  }

  module IonMenuToggle = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~autoHide: bool) => React.element = "IonMenuToggle"
  }
}

module List = {
  module IonList = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonList"
  }

  module IonListHeader = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~lines: lines=?,
      ~onClick: onClickEvent=?,
    ) => React.element = "IonListHeader"
  }
}

module Icon = {
  module IonIcon = {
    type slot = [#end | #start | #"icon-only"]

    @module("@ionic/react") @react.component
    external make: (~slot: slot=?, ~icon: string, ~onClick: onClickEvent=?) => React.element =
      "IonIcon"
  }

  @module("ionicons/icons")
  external home: string = "home"

  @module("ionicons/icons")
  external menu: string = "menu"

  @module("ionicons/icons")
  external bagOutline: string = "bagOutline"

  @module("ionicons/icons")
  external peopleCircleOutline: string = "peopleCircleOutline"

  @module("ionicons/icons")
  external logOutOutline: string = "logOutOutline"

  @module("ionicons/icons")
  external trashBin: string = "trashBin"

  @module("ionicons/icons")
  external heart: string = "heart"

  @module("ionicons/icons")
  external heartHalf: string = "heartHalf"

  @module("ionicons/icons")
  external heartDislikeOutline: string = "heartDislikeOutline"

  @module("ionicons/icons")
  external chevronForwardOutline: string = "chevronForwardOutline"

  @module("ionicons/icons")
  external chevronDownOutline: string = "chevronDownOutline"
}

module Tabs = {
  module IonTabs = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonTabs"
  }

  module IonTabBar = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~slot: slot=?) => React.element = "IonTabBar"
  }

  module IonTab = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonTab"
  }

  module IonTabButton = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~tab: string=?) => React.element = "IonTabButton"
  }
}

module IonPage = {
  @module("@ionic/react") @react.component
  external make: (~children: React.element=?, ~id: string=?) => React.element = "IonPage"
}

module Checkbox = {
  module IonCheckbox = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~slot: slot=?,
      ~checked: bool=?,
      ~color: color=?,
      ~name: string=?,
      ~onIonChange: onFormEvent=?,
    ) => React.element = "IonCheckbox"
  }
}

module Reorder = {
  module IonReorderGroup = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~onIonItemReorder: unit => unit=?,
    ) => React.element = "IonReorderGroup"
  }

  module IonReorder = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~slot: slot=?) => React.element = "IonReorder"
  }
}

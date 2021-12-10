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
    external make: (~children: React.element=?) => React.element = "IonToolbar"
  }

  module IonTitle = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonTitle"
  }

  module IonButtons = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?, ~slot: slot=?) => React.element = "IonButtons"
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
    ) => React.element = "IonItem"
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
}

module Input = {
  module IonInput = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~name: string,
      ~placeholder: string=?,
      ~value: string,
      ~onIonChange: ReactEvent.Form.t => unit,
      ~autofocus: bool=?,
      ~color: color=?,
      ~onIonBlur: ReactEvent.Form.t => unit=?,
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
    @module("@ionic/react") @react.component
    external make: (
      ~children: React.element=?,
      ~color: color=?,
      ~expand: [#block | #full]=?,
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
  let make = (~onSubmit: ReactEvent.Form.t => unit, ~children: React.element) =>
    <form onSubmit>
      children <input type_="submit" style={ReactDOMStyle.make(~display="none", ())} />
    </form>
}

module Menu = {
  module SpreadableIonSplitPanel = {
    @module("@ionic/react") @react.component
    external make: (~contentId: string=?) => React.element = "IonSplitPanel"
  }

  module IonSplitPanel = {
    @react.component
    let make = (~contentId: option<string>=?, ~when_: string) =>
      <Spread props={"when": when_}> <SpreadableIonSplitPanel ?contentId /> </Spread>
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
    external make: (~children: React.element=?) => React.element = "IonListHeader"
  }
}

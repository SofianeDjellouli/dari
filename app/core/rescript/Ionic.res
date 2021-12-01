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
      ~color: [#warning]=?,
    ) => React.element = "IonInput"
  }
}

module Grid = {
  module IonGrid = {
    @module("@ionic/react") @react.component
    external make: (~children: React.element=?) => React.element = "IonGrid"
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
}

module Form = {
  @react.component
  let make = (~onSubmit: ReactEvent.Form.t => unit, ~children: React.element) =>
    <form onSubmit>
      children <input type_="submit" style={ReactDOMStyle.make(~display="none", ())} />
    </form>
}

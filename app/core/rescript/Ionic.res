module Content = {
  module IonContent = {
    @module("@ionic/react") @react.component
    external make: (~children: option<React.element>=?) => React.element = "IonContent"
  }

  module IonApp = {
    @module("@ionic/react") @react.component
    external make: (~children: option<React.element>=?) => React.element = "IonApp"
  }
}

module Toolbar = {
  module IonHeader = {
    @module("@ionic/react") @react.component
    external make: (~children: option<React.element>=?) => React.element = "IonHeader"
  }

  module IonToolbar = {
    @module("@ionic/react") @react.component
    external make: (~children: option<React.element>=?) => React.element = "IonToolbar"
  }

  module IonTitle = {
    @module("@ionic/react") @react.component
    external make: (~children: option<React.element>=?) => React.element = "IonTitle"
  }
}

module Navigation = {
  module IonPage = {
    @module("@ionic/react") @react.component
    external make: (~children: option<React.element>=?) => React.element = "IonPage"
  }
}

module Item = {
  module IonItem = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: option<React.element>=?,
      ~lines: option<[#full | #inset | #none]>=?,
    ) => React.element = "IonItem"
  }

  module IonLabel = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: option<React.element>=?,
      ~position: option<[#fixed | #floating | #stacked]>=?,
    ) => React.element = "IonLabel"
  }
}

module Input = {
  module IonInput = {
    @module("@ionic/react") @react.component
    external make: (
      ~children: option<React.element>=?,
      ~name: string,
      ~placeholder: option<string>=?,
    ) => React.element = "IonInput"
  }
}

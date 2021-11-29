module IonContent = {
  @module("@ionic/react") @react.component
  external make: (~children: option<React.element>=?) => React.element = "IonContent"
}

module IonHeader = {
  @module("@ionic/react") @react.component
  external make: (~children: option<React.element>=?) => React.element = "IonHeader"
}

module IonToolbar = {
  @module("@ionic/react") @react.component
  external make: (~children: option<React.element>=?) => React.element = "IonToolbar"
}

module IonPage = {
  @module("@ionic/react") @react.component
  external make: (~children: option<React.element>=?) => React.element = "IonPage"
}

module IonApp = {
  @module("@ionic/react") @react.component
  external make: (~children: option<React.element>=?) => React.element = "IonApp"
}

module IonTitle = {
  @module("@ionic/react") @react.component
  external make: (~children: option<React.element>=?) => React.element = "IonTitle"
}

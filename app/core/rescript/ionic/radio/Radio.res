open IonicTypes

module IonRadio = {
  @module("@ionic/react") @react.component
  external make: (
    ~children: React.element=?,
    ~color: color=?,
    ~disabled: bool=?,
    ~name: string=?,
    ~value: 'a,
  ) => React.element = "IonRadio"
}

module IonRadioGroup = {
  @module("@ionic/react") @react.component
  external make: (
    ~children: React.element=?,
    ~onIonChange: onFormEvent,
    ~name: string=?,
    ~value: 'a,
  ) => React.element = "IonRadioGroup"
}

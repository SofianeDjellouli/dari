open Ionic

type iconPropsType = {icon: string, name: string}

let presentProps: iconPropsType = {icon: Icon.heart, name: "Present"}

let lackingProps: iconPropsType = {icon: Icon.heartHalf, name: "Lacking"}

let missingProps: iconPropsType = {icon: Icon.heartDislikeOutline, name: "Missing"}

type propsType = {
  color: IonicTypes.color,
  firstAction: iconPropsType,
  secondAction: iconPropsType,
}

let getErrandItemProps = level =>
  switch level {
  | #Present => {
      color: #success,
      firstAction: lackingProps,
      secondAction: missingProps,
    }
  | #Missing => {
      color: #danger,
      firstAction: presentProps,
      secondAction: lackingProps,
    }
  | #Lacking => {
      color: #warning,
      firstAction: presentProps,
      secondAction: missingProps,
    }
  }

type updateErrandLevelPayload = {id: int, name: ErrandsTypes.errandLevelLabel}

type updateErrandNamePayload = {id: int, name: string}

type updateErrandLevelType = updateErrandLevelPayload => Promise.t<unit>
type updateErrandNameType = updateErrandNamePayload => Promise.t<unit>
type deleteErrandType = int => Promise.t<unit>
type errandsQueryType = unit => Promise.t<ErrandsTypes.errandsLevels>

@module("../../../mutations/update-level")
external updateErrandLevel: updateErrandLevelType = "default"

@module("../../../mutations/update-name")
external updateErrandName: updateErrandNameType = "default"

@module("../../../mutations/delete")
external deleteErrand: deleteErrandType = "default"

@module("../../../mutations/delete")
external deleteErrand: deleteErrandType = "default"

@module("../../../queries/errands-levels")
external errandsLevelsQuery: errandsQueryType = "default"

let useErrandMutation = function =>
  Blitz.ReactQuery.useMutation(
    ~function,
    ~onSuccess=(_, _, _) => Blitz.ReactQuery.invalidateQuery(errandsLevelsQuery, ignore())->ignore,
    (),
  )

external unsafeAsHtmlInputElement: Dom.eventTarget => Webapi.Dom.HtmlInputElement.t = "%identity"

@react.component
let make = (~errand: ErrandsTypes.errand) => {
  let (value, setValue) = React.useState(_ => errand.name)

  let (updateErrandLevelMutation, _) = useErrandMutation(updateErrandLevel)

  let (updateErrandNameMutation, _) = useErrandMutation(updateErrandName)

  let (deleteErrandMutation, _) = useErrandMutation(deleteErrand)

  let handleUpdateLevelClick = e => {
    let name = ReactEvent.Mouse.currentTarget(e)["dataset"]["name"]

    updateErrandLevelMutation(. {name: name, id: errand.id})->ignore
  }

  let handleDeleteClick = _ => deleteErrandMutation(. errand.id)->ignore

  let handleChange = e => {
    let targetValue = ReactEvent.Form.target(e)["value"]

    setValue(_ => targetValue)
  }

  let inputRef = React.useRef(Js.Nullable.null)

  React.useEffect0(() => {
    let inputOption = Js.Nullable.toOption(inputRef.current)

    let handleInput = Debounce.debounce(e => {
      let value =
        e->Webapi.Dom.InputEvent.target->unsafeAsHtmlInputElement->Webapi.Dom.HtmlInputElement.value

      updateErrandNameMutation(. {name: value, id: errand.id})->ignore
    }, 300)

    switch inputOption {
    | Some(input) => {
        Webapi.Dom.Element.addInputEventListener(handleInput, input)

        Some(() => Webapi.Dom.Element.removeInputEventListener(handleInput, input))
      }
    | None => None
    }
  })

  let {color, firstAction, secondAction} = getErrandItemProps(errand.level)

  <Item.IonItemSliding>
    <Item.IonItem color>
      <Input.IonInput value onIonChange=handleChange ref={ReactDOM.Ref.domRef(inputRef)} />
      {[firstAction, secondAction]
      ->Belt.Array.map(action =>
        <Spread props={{"data-name": action.name}} key=action.name>
          <Icon.IonIcon slot=#end icon=action.icon onClick=handleUpdateLevelClick />
        </Spread>
      )
      ->React.array}
    </Item.IonItem>
    <Item.IonItemOptions side=#end>
      <Item.IonItemOption color onClick=handleDeleteClick>
        <Icon.IonIcon icon=Icon.trashBin />
      </Item.IonItemOption>
    </Item.IonItemOptions>
  </Item.IonItemSliding>
}

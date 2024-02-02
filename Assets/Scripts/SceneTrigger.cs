using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneTrigger : MonoBehaviour, IInteractable
{
    [SerializeField] string sceneNameToLoad;
    [SerializeField] Vector3 playerPosition;
    [SerializeField] Vector3 playerRotation;
    [SerializeField] float interactionDistance = 5.0f;
    [SerializeField] bool playerActiveInNewScene = true;

    public void SetInteractableActive()
    {}

    public void SetInteractableNotActive()
    {}

    public void Interact()
    {
        Player.instance.SeekAndInteract(gameObject, interactionDistance);
    }

    public void Highlight()
    {}

    public void Unhighlight()
    {} 
    
    public void OnInteraction()
    {
        SceneLoadManager.instance.LoadNewScene(gameObject.scene, sceneNameToLoad, playerPosition, playerRotation, playerActiveInNewScene);
    }

}

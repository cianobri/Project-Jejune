using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

[RequireComponent(typeof(Character))]
public class LockedDoorWithDialogueInteractable : MonoBehaviour, IInteractable
{
    // When the door is locked, it will be treated as a DialogueInteractable. Otherwise, a SceneTrigger.

    [SerializeField] string dialogueSceneName = "Dialogue";
    string currentInkName;
    Character character;
    [SerializeField] float interactionDistance = 4.0f;

    [SerializeField] string sceneNameToLoad;
    [SerializeField] Vector3 playerPosition;
    [SerializeField] Vector3 playerRotation;

    [SerializeField] string inkUnlockVarName;
    [SerializeField] bool isInteractableActive = false;
    [SerializeField] bool isOpen = false;
    [SerializeField] bool playerActiveInNewScene = true;

    void Start()
    {
        character = GetComponent<Character>();

        // Observe the ink-variable.
        InkManager.instance.story.ObserveVariable(inkUnlockVarName, (variableName, newValue) =>
        {
            isOpen = (bool)newValue;
        });
    }

    public void SetInteractableActive()
    {
        isInteractableActive = true;
    }

    public void SetInteractableNotActive()
    {
        isInteractableActive = false;
    }

    public void OnEnable()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    public void OnDisable()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        if (scene.name == dialogueSceneName && isInteractableActive == true)
        {
            // Set the ink mamager to the right dialogue.
            InkManager.instance.GoToKnot(currentInkName);
            isInteractableActive = false;
        }
    }

    public void Interact()
    {
        Player.instance.SeekAndInteract(gameObject, interactionDistance);
    }

    public void Highlight()
    {
    }

    public void Unhighlight()
    {
    }

    public void OnInteraction()
    {
        if (isOpen == false)
        {
            EnableAndSetDialogue(character.inkName);
            GameManager.instance.currentGameState = GameManager.GameState.Dialogue;
        } else
        {
            SceneLoadManager.instance.LoadNewScene(gameObject.scene, sceneNameToLoad, playerPosition, playerRotation, playerActiveInNewScene);
        }
    }

    public void EnableAndSetDialogue(string inkName)
    {
        currentInkName = inkName;
        SceneManager.LoadScene(dialogueSceneName, LoadSceneMode.Additive);
    }

    public void DisableDialogueWindow()
    { 
        SceneManager.UnloadSceneAsync(dialogueSceneName);
        GameManager.instance.currentGameState = GameManager.GameState.Exploration;
    }
    
}

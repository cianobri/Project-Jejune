using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

[RequireComponent(typeof(Character))]
public class DialogueInteractable : MonoBehaviour, IInteractable
{
    [SerializeField] string dialogueSceneName = "Dialogue";
    string currentInkName;
    Character character;
    [SerializeField] float interactionDistance = 4.0f;
    [SerializeField] bool isInteractableActive = false;

    void Start()
    {
        character = GetComponent<Character>();
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
        EnableAndSetDialogue(character.inkName);
        GameManager.instance.currentGameState = GameManager.GameState.Dialogue;
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
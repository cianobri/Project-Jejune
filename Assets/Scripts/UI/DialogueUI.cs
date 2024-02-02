using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;
using TMPro;
using UnityEngine.Events;
using UnityEngine.SceneManagement;
public class DialogueUI : MonoBehaviour
{
    [SerializeField] Button choiceButtonPrefab; 
    [SerializeField] GameObject textDisplayObject; 	
    [SerializeField] GameObject choiceButtonPanel; 	
    private List<Choice> currentChoices;
    TextMeshProUGUI textDisplayArea;
    public UnityEvent mainKnotReached;

    void OnEnable()
    {
        InkManager.instance.knotFound.AddListener(Refresh);
    }

    public void Refresh()
    {
        ClearUI();

        textDisplayArea = textDisplayObject.GetComponent<TextMeshProUGUI>();
        
        textDisplayArea.text = GetNextStoryBlock();

        currentChoices = InkManager.instance.GetCurrentChoices();

        if (textDisplayArea.text.Trim() == "Main")
        {
            //mainKnotReached.Invoke();
            foreach (Choice choice in currentChoices)
            {
                //Debug.Log(choice.text);
            }
            //Reset();
            GameManager.instance.currentGameState = GameManager.GameState.Exploration;
            SceneManager.UnloadSceneAsync(gameObject.scene.name);
            
        } else
        {
            foreach (Choice choice in currentChoices)
            {
                Button choiceButton = Instantiate(choiceButtonPrefab) as Button;
                choiceButton.transform.SetParent(choiceButtonPanel.transform);
                
                TextMeshProUGUI choiceButtonText = choiceButton.GetComponentInChildren<TextMeshProUGUI>();
                choiceButtonText.text = choice.text;
                //Debug.Log(choice.text);
                // Set listener.
                choiceButton.onClick.AddListener(delegate {OnClickChoiceButton(choice);});
            }
        }
        
	}

    void OnClickChoiceButton(Choice choice)
    {	
       
		InkManager.instance.story.ChooseChoiceIndex(choice.index);
		Refresh();

		//inkManager.story.ContinueMaximally();
    }

    public void Reset()
    {
        //Debug.Log("Resetting ink to main knot.");
        //InkManager.instance.story.ChoosePathString("Main"); 
        ClearUI();
    }
   
    void ClearUI()
    {
        int childCount = choiceButtonPanel.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i)
        {
            GameObject.Destroy(choiceButtonPanel.transform.GetChild(i).gameObject);		
        }
    }

    string GetNextStoryBlock()
    {
        string text = "";

        if (InkManager.instance.story.canContinue)
        {
            text = InkManager.instance.story.ContinueMaximally();
        }

        return text;
    }

    void OnDisable()
    {
        Reset();
    }
}

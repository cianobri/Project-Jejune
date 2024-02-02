using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.Events;
public class InkManager : MonoBehaviour
{
    public static InkManager instance;

	public Story story;
	private Choice choice;
	
	public TextAsset inkJSON;
	public string currentKnot;

	public UnityEvent knotFound;
    void Awake()
    {
		if (instance != null && instance != this)
		{
			Destroy(gameObject);
		}
		else
		{
			instance = this;
		}
    }

	void Start()
	{

		story = new Story(inkJSON.text);
		
		if (story == null)
		{
			Debug.Log("ERROR: Ink story is null!");
		} else
		{
			Debug.Log("Ink loaded successfully.");
			story.Continue();
			//LogStoryState();
			//currentKnot = story.state.currentPathString;
			//LogStoryState();
		}
	}
    public void GoToKnot(string name)
	{
		Debug.Log("4 " + name);
		ContinueStory();
		//story.ChoosePathString("Main"); 
		//Debug.Log(story.currentChoices.Count);

		for (int i = 0; i < story.currentChoices.Count; ++i)
		{
			//Debug.Log(story.currentChoices[i].text);
			if (name == story.currentChoices[i].text)
			{
				//Debug.Log("Knot found!");
				story.ChooseChoiceIndex(i); 
				currentKnot = name; 
				knotFound.Invoke();

				break;					
			}					
		}
		
	}

    public void ContinueStory(){
		
		if (story.canContinue){
			story.ContinueMaximally();
		}
	}
    
    public List<Choice> GetCurrentChoices()
	{
		return story.currentChoices;
	}

	void LogStoryState()
	{
		//Debug.Log("Current Content:\n" + story.currentText);
		Debug.Log("Current Choices Count: " + story.currentChoices.Count);
		foreach (var choice in story.currentChoices)
		{
			Debug.Log("Choice: " + choice.text);
		}
		Debug.Log("******************");
	}
}

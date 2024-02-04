using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.Events;
using Ink;
using System;
public class InkManager : MonoBehaviour
{
    public static InkManager instance;

	public Story story;
	private Choice choice;
	
	public TextAsset inkJSON;
	public string currentKnot;

	public UnityEvent knotFound;

	string tagDelimiter = "."; // sfx.file will play the sound "file".
	string playSfxTag = "sfx";

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
			//Debug.Log("ERROR: Ink story is null!");
		} else
		{
			//Debug.Log("Ink loaded successfully.");
			story.Continue();
			//LogStoryState();
			//currentKnot = story.state.currentPathString;
			//LogStoryState();
		}
	}
    public void GoToKnot(string name)
	{
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
	public void TagHandler(List<string> tags)
	{
		// Handles action for Ink tags, for example playing sound effects.

		if (tags.Count > 0)
		{
			for (int i=0; i < tags.Count; i++)
			{
				string[] parsedTag = tags[i].Split(tagDelimiter);

				// Play sound effect.
				if (parsedTag[0] == playSfxTag)
				{
					AudioManager.instance.TryPlaySoundEffect(parsedTag[1]);
				}
			}
		}

	}

    public void ContinueStory(){
		if (story.canContinue){
			//story.ContinueMaximally();
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

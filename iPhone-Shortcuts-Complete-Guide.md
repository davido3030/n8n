# 📱 Complete iPhone Shortcuts Guide - Enhanced Database Access

## ✅ **What's Ready Now**
- **Direct Notion API:** WORKING
- **Command Center Access:** CONFIRMED  
- **Database Access:** ALL DATABASES MAPPED
- **Authentication:** TOKEN VERIFIED

---

## 🎯 **Enhanced Shortcuts for Your Databases**

### **1. Quick Note to Command Center**

**Steps to Create:**
1. Open **Shortcuts app**
2. Tap **"+"** to create new shortcut
3. Add these actions in order:

#### **Action 1: Ask for Input**
- **Prompt:** "What's your note?"
- **Input Type:** Text
- **Allow Multiple Lines:** ON

#### **Action 2: Get Contents of URL**
- **URL:** `https://api.notion.com/v1/pages`
- **Method:** POST
- **Headers:**
  - `Authorization`: `Bearer YOUR_NOTION_API_TOKEN`
  - `Content-Type`: `application/json`
  - `Notion-Version`: `2022-06-28`

#### **Request Body (JSON):**
```json
{
  "parent": {
    "page_id": "YOUR_COMMAND_CENTER_PAGE_ID"
  },
  "properties": {
    "title": {
      "title": [
        {
          "text": {
            "content": "📱 Quick Note"
          }
        }
      ]
    }
  },
  "children": [
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {
            "type": "text",
            "text": {
              "content": "REPLACE_WITH_INPUT"
            }
          }
        ]
      }
    }
  ]
}
```

**Replace "REPLACE_WITH_INPUT" with your "Provided Input" variable**

**Name the shortcut:** "📱 Quick Note"

---

### **2. Add Task to Database**

#### **Request Body for Tasks Database:**
```json
{
  "parent": {
    "database_id": "YOUR_TASKS_DATABASE_ID"
  },
  "properties": {
    "Name": {
      "title": [
        {
          "text": {
            "content": "TASK_NAME_INPUT"
          }
        }
      ]
    },
    "Status": {
      "select": {
        "name": "Not started"
      }
    },
    "Category": {
      "select": {
        "name": "Personal"
      }
    }
  }
}
```

**Name the shortcut:** "✅ Add Task"

---

### **3. Create Project Entry**

#### **Request Body for Projects Database:**
```json
{
  "parent": {
    "database_id": "YOUR_PROJECTS_DATABASE_ID"
  },
  "properties": {
    "Name": {
      "title": [
        {
          "text": {
            "content": "PROJECT_NAME_INPUT"
          }
        }
      ]
    },
    "Status": {
      "select": {
        "name": "Planning"
      }
    },
    "Progress": {
      "number": 0
    }
  }
}
```

**Name the shortcut:** "📊 New Project"

---

### **4. Research Note Entry**

#### **Request Body for Research Database:**
```json
{
  "parent": {
    "database_id": "YOUR_RESEARCH_DATABASE_ID"
  },
  "properties": {
    "Name": {
      "title": [
        {
          "text": {
            "content": "RESEARCH_TITLE_INPUT"
          }
        }
      ]
    },
    "Priority": {
      "select": {
        "name": "Medium"
      }
    }
  }
}
```

**Name the shortcut:** "🔬 Research Note"

---

### **5. Advanced: Meeting Notes Template**

**Multiple Inputs Required:**
1. **Ask for Input:** "Meeting title?"
2. **Ask for Input:** "Who's attending?"  
3. **Ask for Input:** "What's the agenda?"

#### **Request Body:**
```json
{
  "parent": {
    "page_id": "YOUR_COMMAND_CENTER_PAGE_ID"
  },
  "properties": {
    "title": {
      "title": [
        {
          "text": {
            "content": "🤝 Meeting - MEETING_TITLE"
          }
        }
      ]
    }
  },
  "children": [
    {
      "object": "block",
      "type": "heading_2",
      "heading_2": {
        "rich_text": [
          {
            "type": "text",
            "text": {
              "content": "Meeting Details"
            }
          }
        ]
      }
    },
    {
      "object": "block",
      "type": "paragraph",
      "paragraph": {
        "rich_text": [
          {
            "type": "text",
            "text": {
              "content": "**Attendees:** ATTENDEES_INPUT\n\n**Agenda:** AGENDA_INPUT\n\n## Notes\n\n## Action Items\n- [ ] \n\n## Follow-up\n"
            }
          }
        ]
      }
    }
  ]
}
```

**Name the shortcut:** "🤝 Meeting Notes"

---

## 🎙️ **Voice Activation Setup**

For each shortcut:
1. **Open the shortcut**
2. **Tap Settings** (⚙️)
3. **"Add to Siri"**
4. **Record phrases:**
   - "Take a quick note"
   - "Add a task"
   - "New project"
   - "Research note"
   - "Meeting notes"

---

## 📲 **Add to Home Screen**

For each shortcut:
1. **Tap Settings** (⚙️)
2. **"Add to Home Screen"**
3. **Choose icon and name**
4. **Tap "Add"**

---

## 🔧 **Troubleshooting**

### **Common Issues:**

#### **401 Unauthorized Error**
- Check API token in headers
- Ensure `Bearer ` prefix is included

#### **400 Bad Request**
- Verify JSON formatting
- Check all required properties are included

#### **404 Not Found**
- Verify page/database IDs are correct
- Ensure parent references are properly formatted

### **Testing Tips:**

1. **Start with simple shortcuts first**
2. **Test with static text before adding variables**
3. **Check Notion workspace for created content**
4. **Use "Quick Look" action to see API responses**

---

## 🎯 **Quick Test Shortcut**

**Simplest test to verify everything works:**

1. **Create shortcut with just:**
   - Get Contents of URL
   - URL: `https://api.notion.com/v1/pages`
   - Method: POST
   - Headers as above
   - JSON Body:
   ```json
   {
     "parent": {"page_id": "YOUR_COMMAND_CENTER_PAGE_ID"},
     "properties": {
       "title": {"title": [{"text": {"content": "iPhone Test - Working!"}}]}
     }
   }
   ```

2. **Run it** - should create page in Command Center
3. **If working**, add complexity with inputs

---

## 📊 **Available Database Options**

### **Tasks Database Status Options:**
- "Not started"
- "In progress"  
- "Completed"
- "On hold"

### **Tasks Database Categories:**
- "Personal"
- "Work"
- "Project"
- "Research"

### **Projects Database Status Options:**
- "Planning"
- "In Progress"
- "Review"
- "Completed"
- "On Hold"

### **Research Database Priorities:**
- "Low"
- "Medium"
- "High"
- "Urgent"

---

**🎉 You now have direct database access from your iPhone! Create any of these shortcuts and start automating your Notion workflow.**
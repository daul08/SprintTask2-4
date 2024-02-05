package dataBase;

import models.Tasks;

import java.util.ArrayList;
import java.util.List;

public class DBManager {
    public static List<Tasks> tasksList = new ArrayList<>();
    static {
        tasksList.add(new Tasks(1L, "Создать веб приложение на Java EE","sdghsdognpsndpgnspdngpsdngpsdngpsngsdnglsdnbglsndglsd", "2024-02-10", true));
        tasksList.add(new Tasks(2L, "Убраться дома и закупить продукты","sdghsdognpsndpgnspdngpsdngpsdngpsngsdnglsdnbglsndglsd", "2024-02-15", true));
        tasksList.add(new Tasks(3L, "Выполнить все домашние задания","sdghsdognpsndpgnspdngpsdngpsdngpsngsdnglsdnbglsndglsd", "2024-02-17", false));
        tasksList.add(new Tasks(4L, "Записаться на качку","sdghsdognpsndpgnspdngpsdngpsdngpsngsdnglsdnbglsndglsd", "2024-02-19", false));
        tasksList.add(new Tasks(5L, "Учить итальянский","sdghsdognpsndpgnspdngpsdngpsdngpsngsdnglsdnbglsndglsd", "2024-02-20", false));
    }
    public static void addTask(Tasks task) {
        tasksList.add(task);
    }

    public static Tasks getTask(Long id) {
        for(Tasks tasks: tasksList) {
            if (tasks.getId() == id) {
                return tasks;
            }
        }
        return null;
    }
    public static ArrayList getAllTasks() {
        return (ArrayList) tasksList;
    }
    public static void deleteTask(Long id) {
        for (int i = 0; i < tasksList.size(); i++) {
            if (tasksList.get(i).getId() == id) {
                tasksList.remove(i);
            }
        }
    }

    public static Tasks updateTask(Tasks taskNew) {
        for(Tasks task: tasksList) {
            if (task.getId() == taskNew.getId()) {
                task.setName(taskNew.getName());
                task.setDescription(taskNew.getDescription());
                task.setDeadlineDate(taskNew.getDeadlineDate());
                task.setStatus(taskNew.isStatus());
                return task;
            }
        }
        return null;
    }
    public static Long getId(){
        if(tasksList.size() == 0) {
            return 1L;
        }
        else {
         Long min = (long) Integer.MIN_VALUE;
         for(Tasks task: tasksList) {
             if (task.getId() > min) {
                 min = task.getId();
             }
         }
         return min + 1;
        }
    }
}

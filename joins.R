library(dplyr)
library(tidyr)

questions %>% 
  count()

questions %>% 
  group_by(score) %>% 
  count(name="count") %>% 
  arrange(desc(count)) %>% 
  filter(count > 5)

questions %>% 
  group_by(creation_date) %>% 
  count() %>% 
  arrange(desc(creation_date))


# day that asked most questions than other dates
question_counts <- questions %>% 
  group_by(creation_date) %>% 
  count(name="count") %>% 
  arrange(desc(count)) %>% 
  ungroup()

# top 3 days that most questions asked on
question_counts %>% 
  top_n(3)


# tags that mentioned on how many question
question_tags %>% 
  group_by(tag_id) %>% 
  count(name="mentioned_question_counts") %>% 
  arrange(desc(mentioned_question_counts)) %>% 
  ungroup() %>% 
  inner_join(tags, by = c("tag_id" = "id")) %>% 
  select(tag_name, mentioned_question_counts)



question_tags %>% 
  right_join(questions, by = c("question_id" = "id")) %>%
  right_join(tags, by = c("tag_id" = "id")) %>% 
  filter(is.na(question_id))


question_tags %>% 
  right_join(questions, by = c("question_id" = "id")) %>%
  right_join(tags, by = c("tag_id" = "id")) %>% 
  filter(is.na(question_id)) %>% 
  replace_na(list(question_id = 0, score = -1000000))


# join table with itself
themes %>% 
  inner_join(themes, by = c("id" = "parent_id"), suffix=c("_parent", "_child")) %>% 
  select(id, name_parent, name_child)

themes %>% 
  inner_join(themes, by = c("id" = "parent_id"), suffix=c("_parent", "_child")) %>% 
  inner_join(themes, by = c("id_child" = "parent_id"), suffix = c("_child", "_grand_child")) %>% 
  select(name_parent, name_child, name)



question_tags %>% 
  full_join(tags, by = c("tag_id" = "id"))


question_tags %>% 
  count(question_id, tag_id)


student <- data.frame(id = 1 : 4, name = c("Samir", "Cabbar", "Qasim", "Zakir"),
                      teacher_id = c(2, 3, 1, 4))

teacher <- data.frame(id = c(2, 3, 5, 8), name = c("Babek", "Ali", "Mubarek", "Mehebbet"))

student %>% 
  inner_join(teacher, by = c("teacher_id" = "id"), suffix = c("_student", "_teacher"))

student %>% 
  left_join(teacher, by = c("teacher_id" = "id"), suffix = c("_student", "_teacher")) %>% 
  replace_na(list(name_teacher = "-"))

student %>% 
  right_join(teacher, by = c("teacher_id" = "id"), suffix = c("_student", "_teacher"))

student %>% 
  full_join(teacher, by = c("teacher_id" = "id"), suffix = c("_student", "_teacher"))

student %>% 
  semi_join(teacher, by = c("teacher_id" = "id"), suffix = c("_student", "_teacher"))

student %>% 
  anti_join(teacher, by = c("teacher_id" = "id"), suffix = c("_student", "_teacher"))



# n() function can only be used within: summarize, mutate, filter
question_counts %>% 
  filter(n() > 100)


question_tags %>%
  inner_join(tags, by = c("tag_id" = "id")) %>% 
  group_by(tag_name) %>% 
  summarise(num_of_questions = n()) %>% 
  arrange(desc(num_of_questions))


# bind_rows
questions_with_tags <- questions %>%
  inner_join(question_tags, by = c("id" = "question_id")) %>%
  inner_join(tags, by = c("tag_id" = "id"))

answers_with_tags <- answers %>%
  inner_join(question_tags, by = "question_id") %>%
  inner_join(tags, by = c("tag_id" = "id"))

questions_with_tags
answers_with_tags


posts_with_tags <- bind_rows(questions_with_tags %>% mutate(type = "question"),
                             answers_with_tags %>% mutate(type = "answer"))
posts_with_tags %>% 
  select(id, tag_name, type, score) %>% 
  filter(type == "answer")

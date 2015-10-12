# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ActioncableExamples.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
ActioncableExamples.Repo.delete_all(ActioncableExamples.Message)
ActioncableExamples.Repo.delete_all(ActioncableExamples.User)

big = ActioncableExamples.Repo.insert!(%ActioncableExamples.User{name: "The Notorious B.I.G."})
snoop = ActioncableExamples.Repo.insert!(%ActioncableExamples.User{name: "Snoop Dogg"})
ActioncableExamples.Repo.insert!(%ActioncableExamples.User{name: "Funkmaster Flex"})
ActioncableExamples.Repo.insert!(%ActioncableExamples.User{name: "Ice Cube"})

ActioncableExamples.Repo.insert!(%ActioncableExamples.Message{title: "Tha Shiznit", content: "Poppin, stoppin, hoppin like a rabbit", user_id: snoop.id})
ActioncableExamples.Repo.insert!(%ActioncableExamples.Message{title: "Hypnotize", content: "Hah, sicker than your average Poppa", user_id: big.id})


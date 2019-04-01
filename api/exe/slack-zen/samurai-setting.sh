date=$(TZ=Asia/Tokyo date +'%Y-%m-%d')

# #engine
slack_channel_id="CG8Q65EGP"

github_repository="playground"

slack_channel_history_log_file="$log_dir"/slack-channel-history-samurai.json
slack_message_log_file="$log_dir"/slack-message-samurai.json
slack_user_message_log_file="$log_dir"/slack-user-message-samurai.json
slack_message_plain_log_file="$log_dir"/slack-message-plain-samurai.txt

formatted_message_log_file="$log_dir"/formatted-message-samurai.json
markdown_text_log_file="$log_dir"/markdown_text-samurai.txt

github_title="いなうらゆうまはここにいた Zen ${date}"
ja_github_title="いなうらゆうまはここにいた Zen ${date}"
en_github_title="Yuma Inaura was Here Zen ${date}"

github_issue_list_log_file="$log_dir"/github-issue-samurai.json
github_found_issue_log_file="$log_dir"/github-found-issue-samurai.json
github_found_top_issue_log_file="$log_dir"/github-found-top-issue-samurai.json

google_translate_en_log_file="$log_dir"/google-translate-en-samurai.txt
google_translate_tw_log_file="$log_dir"/google-translate-tw-samurai.txt
google_translate_hi_log_file="$log_dir"/google-translate-hi-samurai.txt


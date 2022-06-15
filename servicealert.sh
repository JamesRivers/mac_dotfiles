##Service Alert Documentation Writer
echo "Enter SA number" 
read -p 'SA:  ' sa
echo "Enter SA Title"
read -p 'Title:  ' title
mkdir -p ~/GitFiles/academy/imagine_service_alerts/docs/SA$sa/attachments
cd ~/GitFiles/academy/imagine_service_alerts/docs/SA$sa
vim  "$title.md"




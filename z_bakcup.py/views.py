from django.http import Http404
from django.shortcuts import render, redirect
from django.views.generic import View
from django.http import HttpResponse
from django.utils import timezone
from .forms import CreateFolderForm
from .models import *
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm
from .forms import CreateUserForm
import bs4
from bs4 import BeautifulSoup

import os
import requests


class TeraIndexView(View):
	def get(self, request):

		return render(request,'la1ndingpage.html')
		
def TeraLoginUser(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        
        user = authenticate(request, username=username, password=password)
    
        if user is not None:
            login(request, user)
            return redirect('ra:tera_homepage_view')
        else:
            messages.info(request, '*Incorrect username or password')
    
    context = {}
    return render(request,'login.html',context)


class TeraSearchResultsView(View):
	def get(self,request):
		return render(request,'3.html')	

class TeraHomepageView(View):
	def get(self,request):
		word = 'computer'
		springTitles = []
		springAuthor = []
		springDate = []
		springLink = []

		scienceDTitles = []
		scienceDDescription = []
		scienceDLink = []
		
		
		#response = requests.get('https://www.springeropen.com/search?query=' + word + '&searchType=publisherSearch')
		#soup = BeautifulSoup(response.content, 'html.parser')
		#a= soup.find('ol', class_='c-list-group c-list-group--bordered c-list-group c-list-group--md')
		#bb = a.findAll('li', )
		#for b in bb:

		#	article = b.find('article')
		#	if article != None:

		#		div = article.find('div', class_='u-mb-16')
		#		a = div.h3
		#		p = div.find('p', class_='c-listing__authors u-mb-0')
		#		springTitles.append(a.text)
		#		springAuthor.append(p.text)
		#		div2 = article.find('div',class_='c-meta')
		#		springDate.append(div2.text)
		#		springLink.append(a.a['href'])
				#print(a.a['href'])
		

		headers = {
		    'authority': 'www.sciencedirect.com',
		    'sec-ch-ua': '^\\^',
		    'sec-ch-ua-mobile': '?0',
		    'upgrade-insecure-requests': '1',
		    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36 Edg/90.0.818.56',
		    'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
		    'sec-fetch-site': 'same-origin',
		    'sec-fetch-mode': 'navigate',
		    'sec-fetch-user': '?1',
		    'sec-fetch-dest': 'document',
		    'referer': 'https://www.sciencedirect.com/search?qs=' + word,
		    'accept-language': 'en-US,en;q=0.9',
		    'cookie': 'EUID=75fdfe63-504d-4c8a-8180-c03a43da237c; mboxes=^%^7B^%^7D; utt=2146-84ee935a77144283645aebe835a645e74f7-M0M6; __cfduid=d581cdfc6af0612fb99bd31d759e5b2b01620472367; AMCVS_4D6368F454EC41940A4C98A6^%^40AdobeOrg=1; fingerPrintToken=0e09a4589ad201b7779dc25f995a7fcc; SD_ART_LINK_STATE=^%^3Ce^%^3E^%^3Cq^%^3Escience^%^3C^%^2Fq^%^3E^%^3Corg^%^3Ejrnl_home^%^3C^%^2Forg^%^3E^%^3Cz^%^3Erslt_list_item^%^3C^%^2Fz^%^3E^%^3Crdt^%^3E2021^%^2F05^%^2F15^%^2F04^%^3A50^%^3A21^%^3A693^%^3C^%^2Frdt^%^3E^%^3Cenc^%^3EN^%^3C^%^2Fenc^%^3E^%^3C^%^2Fe^%^3E; mbox=session^%^239105d5c237604313bfd15e5b357d8385^%^231621056083^%^7CPC^%^2370b4195123dc401fa07762b437030b81.34_0^%^231684299023; SD_REMOTEACCESS=eyJhY2NvdW50SWQiOiI3MzA5NCIsInRpbWVzdGFtcCI6MTYyMTA1NDQ3NzQzOH0=; sd_session_id=64b88bde49c1f3445e2892b333e22bd29b02gxrqa; id_ab=AEG; acw=64b88bde49c1f3445e2892b333e22bd29b02gxrqa^%^7C^%^24^%^7CC97A49C4D55825A701A2B831EFC27B1BBE7ACBC0917CEE99BCF7086A97128C0A6FD7058E53D0D47C4A4EB855974236302C20B33206EAD7F33FBA44D1BD4E4F2EB0469A67597464825D387A21AFA2E514; has_multiple_organizations=false; AMCV_4D6368F454EC41940A4C98A6^%^40AdobeOrg=-1124106680^%^7CMCIDTS^%^7C18763^%^7CMCMID^%^7C10640528059237186110715255087884724485^%^7CMCAID^%^7CNONE^%^7CMCOPTOUT-1621061687s^%^7CNONE^%^7CMCAAMLH-1621659287^%^7C3^%^7CMCAAMB-1621659287^%^7Cj8Odv6LonN4r3an7LhD3WZrU1bUpAkFkkiY1ncBR96t2PTI^%^7CMCSYNCSOP^%^7C411-18716^%^7CvVersion^%^7C5.2.0^%^7CMCCIDH^%^7C-1660478464; __cf_bm=d38428dd202136a09187f1b2037a1c4e42db6e85-1621058460-1800-AQkbFGoxqX+5uFAFIezpHTDE62JXklL30EKf0QyuJjQ2QPOI6WayDh9V7kl9hfgmOlvJqC0mjFoarFrBzKc/kLI=; MIAMISESSION=76530023-5194-4f7b-88d4-12743ae5097b:3798511713; s_pers=^%^20v8^%^3D1621058962796^%^7C1715666962796^%^3B^%^20v8_s^%^3DLess^%^2520than^%^25201^%^2520day^%^7C1621060762796^%^3B^%^20c19^%^3Dsd^%^253Asearch^%^253Aresults^%^253Aguest^%^7C1621060762801^%^3B^%^20v68^%^3D1621058913924^%^7C1621060762810^%^3B; s_sess=^%^20s_cpc^%^3D0^%^3B^%^20e78^%^3Dqs^%^253Dcomputer^%^3B^%^20c7^%^3Dcontenttype^%^253Djl^%^3B^%^20s_cc^%^3Dtrue^%^3B^%^20s_ppvl^%^3Dsd^%^25253Abrowse^%^25253Ajournalsandbooks^%^252C16^%^252C16^%^252C969^%^252C1280^%^252C969^%^252C1920^%^252C1080^%^252C1^%^252CP^%^3B^%^20s_ppv^%^3Dsd^%^25253Asearch^%^25253Aresults^%^25253Aguest^%^252C22^%^252C22^%^252C969^%^252C1280^%^252C969^%^252C1920^%^252C1080^%^252C1^%^252CP^%^3B^%^20c21^%^3Dqs^%^253Dwar^%^3B^%^20e13^%^3Dqs^%^253Dwar^%^253A1^%^3B^%^20c13^%^3Drelevance-desc^%^3B^%^20e41^%^3D1^%^3B^%^20s_sq^%^3Delsevier-global-prod^%^253D^%^252526c.^%^252526a.^%^252526activitymap.^%^252526page^%^25253Dsd^%^2525253Asearch^%^2525253Aresults^%^2525253Aguest^%^252526link^%^25253Djournals^%^25252520^%^25252526^%^25252520books^%^252526region^%^25253Dheader^%^252526pageIDType^%^25253D1^%^252526.activitymap^%^252526.a^%^252526.c^%^252526pid^%^25253Dsd^%^2525253Asearch^%^2525253Aresults^%^2525253Aguest^%^252526pidt^%^25253D1^%^252526oid^%^25253Dhttps^%^2525253A^%^2525252F^%^2525252Fwww.sciencedirect.com^%^2525252Fbrowse^%^2525252Fjournals-and-books^%^252526ot^%^25253DA^%^3B',
		}

		#response = requests.get('https://www.sciencedirect.com/browse/journals-and-books?contentType=JL&searchPhrase=' + word, headers=headers)
		with open("C:\\Users\\Valued Client\\Downloads\\Browse journals and books _ ScienceDirect.com.html") as html_file:
			soup2 = BeautifulSoup(html_file, 'html.parser')
		#print(soup2.prettify())
		
		lli= soup2.findAll('li', class_='publication branded u-padding-xs-ver js-publication')
		for li in lli:
			scienceDTitles.append(li.a.text)
			p = li.div.p
			pp = li.div.find('p', class_='u-display-inline u-clr-grey8')
			if pp != None:
				ppp = pp.find('span')#
				scienceDDescription.append(p.text + " ● " + ppp.text)


			
			scienceDLink.append(li.a['href'])
			print(scienceDLink)
#NB. Original query string below. It seems impossible to parse and
#reproduce query strings 100% accurately so the one below is given
#in case the reproduced version is not "correct".
# response = requests.post('https://bam.nr-data.net/events/1/7ac4127487?a=884506234&sa=1&v=1169.7b094c0&t=Unnamed^%^20Transaction&rst=41883&ck=1&ref=https://www.sciencedirect.com/search', headers=headers, cookies=cookies, data=data)


		#scirp = requests.get("https://www.scirp.org/journal/Articles.aspx?searchCode="+word)
		#url = requests.get('https://www.sciencedirect.com/browse/journals-and-books?contentType=JL' + word, headers=headers)
		#sciencedirect = url.content
		#soup = BeautifulSoup(url.content, 'html.parser')
		#soup = BeautifulSoup(sciencedirect.content, "html.parser")
		
		#a = soup.find('div', class_='col-lg-6')
		#b = soup.findAll('span', class_='checkbox-label-value checkbox-small checkbox-label-indent u-clr-grey8 u-padding-xs-bottom')

		#c = soup.find('div', class_='checkbox-check checkbox-small checkbox-label-indent u-clr-grey8 u-padding-xs-bottom')
		#a = row.find('div', class_='row u-margin-l-bottom')
		#b = a.find('div', class_='u-margin-l-top')
		#journal.click()checkbox checkbox-small checkbox-label-indent u-clr-grey8 u-padding-xs-bottom
		#print(soup)
		


		#row = soup.find_all('ul')
		#print(results)
		#for p in row:
		#	sp = p.find('span')
		#	if sp!= None:

		#		titles.append(sp.find('a').text)
		

		headers = {
		    'authority': 'doaj.org',
		    'sec-ch-ua': '^\\^',
		    'accept': 'text/javascript, application/javascript, application/ecmascript, application/x-ecmascript, */*; q=0.01',
		    'x-requested-with': 'XMLHttpRequest',
		    'sec-ch-ua-mobile': '?0',
		    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36 Edg/90.0.818.56',
		    'sec-fetch-site': 'same-origin',
		    'sec-fetch-mode': 'cors',
		    'sec-fetch-dest': 'empty',
		    'referer': 'https://doaj.org/search/journals?ref=homepage-box&source=^%^7B^%^22query^%^22^%^3A^%^7B^%^22query_string^%^22^%^3A^%^7B^%^22query^%^22^%^3A^%^22war^%^22^%^2C^%^22default_operator^%^22^%^3A^%^22AND^%^22^%^7D^%^7D^%^7D',
		    'accept-language': 'en-US,en;q=0.9',
		    'cookie': '__cfduid=dff54c590896468c12d3997d74c7320991620448133; _ga=GA1.2.1942324762.1620448136; _gid=GA1.2.137596291.1621078780',
		}

		params = (
		    ('ref', 'public_journal'),
		    ('callback', 'jQuery341010019889148834937_1621078847844'),
		    ('source', '^%^7B^%^22query^%^22^%^3A^%^7B^%^22query_string^%^22^%^3A^%^7B^%^22query^%^22^%^3A^%^22computer^%^22^%^2C^%^22default_operator^%^22^%^3A^%^22AND^%^22^%^7D^%^7D^%^2C^%^22size^%^22^%^3A0^%^2C^%^22aggs^%^22^%^3A^%^7B^%^22language^%^22^%^3A^%^7B^%^22terms^%^22^%^3A^%^7B^%^22field^%^22^%^3A^%^22index.language.exact^%^22^%^2C^%^22size^%^22^%^3A100^%^2C^%^22order^%^22^%^3A^%^7B^%^22_count^%^22^%^3A^%^22desc^%^22^%^7D^%^7D^%^7D^%^7D^%^7D'),
		    ('_', '1621078847861'),
		)

		
		#url2 = requests.get('https://doaj.org/')
		
		
		
		#soup2 = BeautifulSoup(response.content, 'html.parser')
		#print(soup2.prettify)
		
			#e = d.div
			#f = e.h3
			
#NB. Original query string below. It seems impossible to parse and
#reproduce query strings 100% accurately so the one below is given
#in case the reproduced version is not "correct".
# response = requests.get('https://doaj.org/query/journal/_search?ref=public_journal&callback=jQuery341010019889148834937_1621078847844&source=^%^7B^%^22query^%^22^%^3A^%^7B^%^22query_string^%^22^%^3A^%^7B^%^22query^%^22^%^3A^%^22computer^%^22^%^2C^%^22default_operator^%^22^%^3A^%^22AND^%^22^%^7D^%^7D^%^2C^%^22size^%^22^%^3A0^%^2C^%^22aggs^%^22^%^3A^%^7B^%^22language^%^22^%^3A^%^7B^%^22terms^%^22^%^3A^%^7B^%^22field^%^22^%^3A^%^22index.language.exact^%^22^%^2C^%^22size^%^22^%^3A100^%^2C^%^22order^%^22^%^3A^%^7B^%^22_count^%^22^%^3A^%^22desc^%^22^%^7D^%^7D^%^7D^%^7D^%^7D&_=1621078847861', headers=headers)


		#t = soup.find_all('a',  'data-test:title-link')
		#print(soup)
			#a = span.find('a')
			
			#titles.append(title.find_all('p'))
			
		
		#print(titles[0])

		#for result in r2:
		#	print(result.text)
		#titles
		#soupTitles = soup.find_all('li', class_='publication branded u-padding-xs-ver js-publication')
		#print(soupTitles)
		#for n in soupTitles:
		#	print(n.text)
			#titles.append(n.text)
		
		#links
		#rLink = soup.find_all('li', class_='publication branded u-padding-xs-ver js-publication')
		#for n in rLink:
		#	links.append(n.find('a')['href'])
			#print(links)
		#a = requests.get("https://www.sciencedirect.com" +links[0],headers=jHeaders)
	
	#soup = BeautifulSoup(a.content, "html.parser")
		user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36"
		
		
		
		context ={
			'springTitles': springTitles
		}
		#for title in tt:
		#	wait = WebDriverWait(driver, 2)
		#	element = wait.until(EC.element_to_be_clickable((By.tag, 'span')))

			#titles.append(element.text)

			




		
		

		
		
		
		
		return render(request,'searchresults.html', context)
		#return redirect('https://www.scirp.org/journal/Articles.aspx?searchCode=computer')	

class TeraDashboardView(View):
	def get(self,request):
		qs_folders = Folders.objects.all()
		print (qs_folders)
			
		context = { 'folders': qs_folders}
		return render(request,'dashboard.html', context)

	def post(self, request):
	 	form = CreateFolderForm(request.POST)
	 	if form.is_valid():
	 		folder = request.POST.get("foldername")
	 		form = Folders(foldername = folder)
	 		form.save()

	 		return redirect('ra:tera_dashboard_view')

	 	if request.method == 'POST':
	 		if 'btnDelete' in request.POST:
	 			print('delete button clicked')
	 			fid = request.POST.get("folder-id")
	 			fldr = Folders.objects.filter(id=fid).delete()
	 			print('Recorded Deleted')
	 		return redirect('ra:tera_dashboard_view')		

class TeraCreateJournalCitationView(View):
	def get(self,request):
		return render(request,'citejournal.html')

	def post(self, request):
	 	form = CiteJournalForm(request.POST)
	 	if form.is_valid():
	 		contrib = request.POST.get("contributor")
	 		firstname = request.POST.get("fname")
	 		midnitial = request.POST.get("minitial")
	 		lastname = request.POST.get("lname")
	 		artitle = request.POST.get("ar_title")
	 		jourtitle = request.POST.get("jour_title")
	 		vol = request.POST.get("volume")
	 		iss = request.POST.get("issue")
	 		ser = request.POST.get("series")
	 		datepublished = request.POST.get("pubdate")
	 		start = request.POST.get("pagestart")
	 		end = request.POST.get("pagend")
	 		anno = request.POST.get("annotation")
	 		citeformat = request.POST.get("citationformat")
	 		reftype = request.POST.get("referencetype")
	 		form = Citations(contributor = contrib, fname = firstname, minitial = midnitial, lname = lastname, 
	 			ar_title = artitle, jour_title = jourtitle, volume = vol, issue = iss, series = ser, pubdate = datepublished, 
	 			pagestart = start, pagend = end, annotation = anno, citationformat=citeformat, referencetype = reftype)
	 		form.save()

	 		print('Data Successfully Recorded!')
	 		return redirect('ra:journal-citation-result-inprint')
	 		
	 	else:
	 		print(form.errors)
	 		return HttpResponse('Sorry, Failed to Record Data.')

class TeraCreateBookCitationView(View):
	def get(self,request):
		return render(request,'citebook.html')

class CitationDeleteView(View):
	def get(self,request):
		return render(request,'citedeleted.html')

class JournalCitationResult(View):
	def get(self, request):
		qs_journalcitation = Citations.objects.order_by('-id')

		context = {'results' : qs_journalcitation }	
		return render(request, 'citejournalresult_inprint.html', context)

class CitationHistory(View):
	def get(self, request):
		qs_journalcitation = Citations.objects.order_by('-id')

		context = {'results' : qs_journalcitation }	
		return render(request, 'citationhistory.html', context)

		if 'btnDelete' in request.POST:	
				print('delete button clicked')
				journal_id = request.POST.get("journal-id")
				journaldelete = Citations.objects.filter(id=journal_id).delete()
				print('Recorded Deleted')
		return redirect('ra:deletion_confirmation')

def TeraLogout(request):
    logout(request)
    return redirect('ra:tera_index_view')

def TeraAccountSettingsView(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  
            messages.success(request, 'Your password was successfully updated!')
            return redirect('ra:tera_account_settings')
        else:
            messages.info(request, 'Password cannot be changed.')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'accountsettings.html', {
        'form': form
    })

						
Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 635AC111F0
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 05:47:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vh6K0bf3zDqR1
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 May 2019 13:47:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vh6D4hvkzDqPG
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 May 2019 13:47:16 +1000 (AEST)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x423eC5d069679;
 Thu, 2 May 2019 11:40:12 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 2 May
 2019 11:47:04 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 2 May
 2019 11:47:02 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Thu, 2 May 2019 11:47:03 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: RE: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / PWM and
 DVO outputs on AST2500 devices
Thread-Topic: [PATCH 2/3] aspeed/pinctrl: Fix simultaneous RS-232 / PWM and
 DVO outputs on AST2500 devices
Thread-Index: AdUAlAXpS154mlgPT4yc4y3VL8kZB2RDAL2hZEHNz/A=
Date: Thu, 2 May 2019 03:47:02 +0000
Message-ID: <921172cf50484d839bd30fa27ecf525e@TWMBX02.aspeed.com>
References: <1890791123.3393899.1556750986902.JavaMail.zimbra@raptorengineeringinc.com>
 <f35bf045-48e4-432f-8239-29f8f6746158@www.fastmail.com>
 <d5a0e5a855144fd6bb65c569b37dedfa@TWMBX02.aspeed.com>
 <313461427.3426138.1556768056285.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <313461427.3426138.1556768056285.JavaMail.zimbra@raptorengineeringinc.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x423eC5d069679
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: Morris Mao <morris_mao@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

LS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQ0KPiBGcm9tOiAiUnlhbiBDaGVuIiA8cnlhbl9j
aGVuQGFzcGVlZHRlY2guY29tPg0KPiBUbzogIkFuZHJldyBKZWZmZXJ5IiA8YW5kcmV3QGFqLmlk
LmF1PiwgIlRpbW90aHkgUGVhcnNvbiIgPHRwZWFyc29uQHJhcHRvcmVuZ2luZWVyaW5nLmNvbT4s
ICJsaW51eC1hc3BlZWQiDQo+IDxsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZz4NCj4gQ2M6
ICJNb3JyaXMgTWFvIiA8bW9ycmlzX21hb0Bhc3BlZWR0ZWNoLmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBNYXkgMSwgMjAxOSAxMDowNjoyNSBQTQ0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDIvM10g
YXNwZWVkL3BpbmN0cmw6IEZpeCBzaW11bHRhbmVvdXMgUlMtMjMyIC8gUFdNIA0KPiBhbmQgRFZP
IG91dHB1dHMgb24gQVNUMjUwMCBkZXZpY2VzDQoNCj4+T24gVGh1LCAyIE1heSAyMDE5LCBhdCAw
ODoyMCwgVGltb3RoeSBQZWFyc29uIHdyb3RlOg0KPj4gVGhlcmUgYXBwZWFycyB0byBiZSBhIHNt
YWxsIGVycm9yIGluIHRoZSBwaW5tdXggdGFibGUgb24gcGFnZXMgMTMwIA0KPj5hbmQNCj4+IDEz
MSBvZiB0aGUgQVNUMjUwMCBkYXRhc2hlZXQgdjEuNi4gIFNwZWNpZmljYWxseSwgdGhlIENPTkQy
ICANCj4+cmVxdWlyZW1lbnQgdXNlZCB0byBtdXggdGhlIHN1cnJvdW5kaW5nIHBpbnMgdG8gRFZJ
IHdhcyBpbmFkdmVydGVudGx5ICANCj4+cmVwbGljYXRlZCB0byBwaW5zIFYxLCBXMSwgVjIsIGFu
ZCBXMiBpbiB0aGUgdGFibGUsIHdoaWNoIGRvIG5vdCAgDQo+PmluY29ycG9yYXRlIERWSSBmdW5j
dGlvbmFsaXR5Lg0KPj4gDQo+PiBBcyBhIHJlc3VsdCBvZiB0aGlzIGVycm9yLCBib3RoIHNlcmlh
bCBUWCBsaW5lcyBhbmQgdGhlIFBXTSAwLzEgDQo+PiBvdXRwdXRzIHdlcmUgb3ZlcnJpZGluZyB0
aGUgVlBPIHBpbm11eCBzZXR0aW5ncyB3aGVuIFZQTyB3YXMgZW5hYmxlZCANCj4+IGluIHRoZSBw
aW5tdXggaG9ncy4NCj4+IA0KPj4gVGhpcyBwYXRjaCBoYXMgYmVlbiB2ZXJpZmllZCB0byBmdW5j
dGlvbiBvbiBCbGFja2JpcmQgaGFyZHdhcmUuICBCb3RoIA0KPj4gc2VyaWFsIFRYRCBwaW5zIGFu
ZCBQV00wL1BXTTEgd2VyZSBmdW5jdGlvbmFsbHkgdGVzdGVkIHdpdGggDQo+PiBTQ1U5NFsxOjBd
IHNldCB0byAweDEuDQo+IA0KPiBIZWxsbyBUaW0uDQo+IA0KPiBUaGUgQVNUMjUwMCBwd20wLzEg
Y29uZmlndXJlIG5lZWQgZm9sbG93aW5nIGNvbmRpdGlvbiwgdGhlIFNDVTk0WzE6MF0gDQo+IGlz
IDB4MSwgaXQgc2hvdWxkIG5vdCB3b3JrLg0KPiBDb3VsZCB5b3UgaGVscCBjb25maXJtIGl0Pw0K
PiANCj4gdjIgOiBwd20gMCA6IHNjdTg4WzBdID0gMSAmIHNjdSA5NFsxOjBdID0gMCAmIHNjdTkw
WzVdID0gMA0KPiB3MiA6IHB3bSAxIDogc2N1ODhbMV0gPSAxICYgc2N1IDk0WzE6MF0gPSAwICYg
c2N1OTBbNV0gPSAwDQoNCj4+SSBjYW4gY29uZmlybSB0aGF0IHdpdGggU0NVOTRbMTowXSA9PSAw
eDEgdGhlIFBXTTAgYW5kIFBXTTEgb3V0cHV0cyB3b3JrIGNvcnJlY3RseSAtLSB0aGlzIHdhcyB0
ZXN0ZWQgb24gb3VyIEJsYWNrYmlyZCA+PmhhcmR3YXJlLiAgSWYgeW91IGFyZSByZWFkaW5nIGZy
b20gdGhlIGRhdGFzaGVldCwgSSBzdXNwZWN0IHRoZXJlIGFyZSBhIGZldyBlcnJvcnMgaW4gaXQg
cmVsYXRpbmcgdG8gdGhlIHJlbGF0aXZlbHkgcmFyZWx5IHVzZWQgRFZPID4+bXV4IHNldHRpbmdz
Lg0KDQpZZXMgaXQgY2FuIHdvcmsgYWZ0ZXIgY2hlY2sgd2l0aCBkZXNpZ25lciwgaWYgeW91IGRv
bid0IGVuYWJsZSB0aGUgQ1JUIGRyaXZlciwgaXQgd2lsbCB3b3JrLg0KQnV0IGZvciBzYWZldHku
IFlvdSBuZWVkIGFsc28gYW5kIHdpdGggQ09ORDIgZm9yIHB3bSBkcml2ZXIgbG9hZGVkLg0KDQoN
Cg==

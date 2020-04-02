Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 476AC19C84D
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Apr 2020 19:50:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tVvb4rPDzDrPq
	for <lists+linux-aspeed@lfdr.de>; Fri,  3 Apr 2020 04:50:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=northeastern.edu (client-ip=40.107.236.129;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=liu.changm@northeastern.edu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=northeastern.edu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=northeastern.edu header.i=@northeastern.edu
 header.a=rsa-sha256 header.s=selector2 header.b=fel6Nfjq; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2129.outbound.protection.outlook.com [40.107.236.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tVvP4zN9zDrFL
 for <linux-aspeed@lists.ozlabs.org>; Fri,  3 Apr 2020 04:49:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHan/AU22NUCrqHg3yUm4mYQWL+47Mrt0BYQmp89tOqP+3QrCH/+BSkSxxe+Jln+Hzmr7U7O0ZbJgvnC9pPmjBxEzEzt7EwH4JIZWoWXT68Y8v23DWRxkuiQPl5Y9DwsXPr/wiTU2nMIuJfKBEb/3oOJ6vMgL6V/QT8Tdk8ekvolo7TObcX6tgfU/3Fon5iD5XX2pNZ6yhufWc9AwqSgvs6qPYM/ZQEZAxtSj0M6XueAzQrAxH6/RWuIIFlQ+sgd6a7/IEm71Y+1oS9meKpwJ4g1xeKxfyYxZrwW1In115Ns1JqcnpRO+MLveftORCMEGO5czPSCPfjRT0rkI5CT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgfZXywpAyquy7TsjJtjggn0+RS7mAuk+MHesGwXOfA=;
 b=gufA0M4LpgkH2ncWknhLxObYkaI+1+ymqYOEpbhHNVpiTTkxZs0yN1Hs14hop71Io44XYcFEuQPedYzex0fEgG0vOde3TzAhceKiIIG0gHw8Yg2ByhNS05tFC6JVgjbCsyMsPUN8oQKp5D8vnxEpboBsb4l7JvrA35ybkj7N4z3gBhOh3cLYGDGZjeCX2Z7ympfS49atr0EQkEmL/Hnx/mwuQahk/RPYkNt+xzN54ryzU/7oq47/Na19hZ8EWF4QLACXi9FaQkE5NB26FWsQnoK2FUDN4f0+VmFwz9vWC8zYkLC3Xk3BQi7cWxhwCjw58JY/fersFRXN/vNaNX3Vuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgfZXywpAyquy7TsjJtjggn0+RS7mAuk+MHesGwXOfA=;
 b=fel6Nfjq0wLadEHCxT06gds8AoXty5qywThdjAsObysLSktXn1yeMXyhIQt1PRTHGuBiHqCuJ1V6yUBhLwJNuIwJIgDFfi/kaj7a0VP01r7H3JtM/lBFyfQyJbdIgPWGQx3366RDOJf2TJvnY4kffmrePmCSYK1GIranfroHwVg=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4753.namprd06.prod.outlook.com (2603:10b6:208:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Thu, 2 Apr
 2020 17:49:13 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::20f8:a2f2:5ebc:da2]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::20f8:a2f2:5ebc:da2%7]) with mapi id 15.20.2878.014; Thu, 2 Apr 2020
 17:49:13 +0000
From: Changming Liu <liu.changm@northeastern.edu>
To: Patrick Venture <venture@google.com>, Andrew Jeffery <andrew@aj.id.au>
Subject: RE: [Bug Report] soc/aspeed: integer error in
 aspeed_p2a_region_acquire
Thread-Topic: [Bug Report] soc/aspeed: integer error in
 aspeed_p2a_region_acquire
Thread-Index: AdYGAIGuDCfrUgheRrujj/e7wCdDjwAKrhIAAB2TuoAAnH7qIA==
Date: Thu, 2 Apr 2020 17:49:13 +0000
Message-ID: <BL0PR06MB4548CB10837BB7E64104338EE5C60@BL0PR06MB4548.namprd06.prod.outlook.com>
References: <BL0PR06MB45481A385F546CF5B6855C16E5CA0@BL0PR06MB4548.namprd06.prod.outlook.com>
 <d694432d-a3f2-4aa1-b9ee-f99f18ee2d99@www.fastmail.com>
 <CAO=notwsjF3fVhY6gFVqsxTXYs=D7LHoOUDhcHSJLzRrsA7rGw@mail.gmail.com>
In-Reply-To: <CAO=notwsjF3fVhY6gFVqsxTXYs=D7LHoOUDhcHSJLzRrsA7rGw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=liu.changm@northeastern.edu; 
x-originating-ip: [2601:197:a7f:5cb0:e015:f2b5:42b5:30de]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de069d77-60a5-4c5b-37c1-08d7d72e27f0
x-ms-traffictypediagnostic: BL0PR06MB4753:|BL0PR06MB4753:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB4753C0D30193DDBC5720F2BAE5C60@BL0PR06MB4753.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR06MB4548.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(66476007)(33656002)(66446008)(64756008)(66556008)(107886003)(75432002)(478600001)(52536014)(5660300002)(110136005)(4326008)(54906003)(786003)(2906002)(86362001)(316002)(8936002)(81166006)(6506007)(53546011)(76116006)(7696005)(66946007)(8676002)(81156014)(71200400001)(55016002)(9686003)(186003)(70780200001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: northeastern.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8kT0IVgtKaulZK0h6OmnXQqwIn0+6j/aaznCslgzrrBMEr/h+wCi1ZRwV+chptv3ahUZJXqWBuEXOhn1uKa7AIWIvlBNrcjE9e917GLmKP5A0GnAsgfmCa5GNw6hEMqnqnrguNllIUucI3E436RyykknYNVNwmST8LVcYyldzZ3RA4FjSwMk6G91evRXjPGevZLDUAJluxX/trkbp6hOhzPLQdfmw0v6mMHp7KdRAAQEWB+1oXDcFpuFk8oXe4SXERSV1Fv4j0t4qRSPFQhPBf31E+R/VQ7lxEFnQjEjpJ/LhY6NmMaTOygyzRpoQuw0uf1bublzNZS8GmmfNImifdZD6DuGGBocsSKmT8wpgV/BZfP6GNDAgoPMTT3U5exWaItKgyrkkAOR20E2vArYuQ7p4MUB+39vjrb9jUJuWNUwIyUgoKum4BfzaZo8Ly4p/IX/Kk8vfVyXszQwK+LNSXpYw7HSSf/uP4pzkr9SUYZVuSOAs4D29KYd+z7Rm1Zw
x-ms-exchange-antispam-messagedata: GDvsoxu84H832r5o4H9jUB8Y51QZRB18Avo9o9g81D/Sr7neDt9BhZKIpefwebNN21ylPqhtuxPppLVVxQJB9C1GbXjHtM4+25yIy4rYC4OT3lWCg7uecuUIAgPwE7KTIfN1tbDmk2iAxLByUlNuvW1IJ6/7S/7vUUgX9pkh3RRKdQ4EAocrRl4lh0Io+d5YdjrFy+IL6Yngs0otfoFAew==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: de069d77-60a5-4c5b-37c1-08d7d72e27f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 17:49:13.2787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xLrgivdKSeoYNUh4L848M+dKlB9Qt5v2nBT9w68hQYxS2VoONy+ZnwDhadARwPOLm3twYf3O7BlY1ujSRfCbPKHr0eARNlWsND0+5/S43UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4753
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "yaohway@gmail.com" <yaohway@gmail.com>, "Lu, Long" <l.lu@northeastern.edu>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

DQo+IEZyb206IFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29nbGUuY29tPg0KPiBTZW50OiBN
b25kYXksIE1hcmNoIDMwLCAyMDIwIDEwOjQzIEFNDQo+IFRvOiBBbmRyZXcgSmVmZmVyeSA8YW5k
cmV3QGFqLmlkLmF1Pg0KPiBDYzogQ2hhbmdtaW5nIExpdSA8bGl1LmNoYW5nbUBub3J0aGVhc3Rl
cm4uZWR1PjsgSm9lbCBTdGFubGV5DQo+IDxqb2VsQGptcy5pZC5hdT47IHlhb2h3YXlAZ21haWwu
Y29tOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVl
ZEBsaXN0cy5vemxhYnMub3JnOyBMdSwgTG9uZyA8bC5sdUBub3J0aGVhc3Rlcm4uZWR1Pg0KPiBT
dWJqZWN0OiBSZTogW0J1ZyBSZXBvcnRdIHNvYy9hc3BlZWQ6IGludGVnZXIgZXJyb3IgaW4NCj4g
YXNwZWVkX3AyYV9yZWdpb25fYWNxdWlyZQ0KPiANCj4gT24gU3VuLCBNYXIgMjksIDIwMjAgYXQg
NTozNyBQTSBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PiB3cm90ZToNCj4gPg0KPiA+
IEhpIENoYW5nbWluZyBMaXUsDQo+ID4NCj4gPiBJJ3ZlIGFkZGVkIFBhdHJpY2sgdG8gdGhlIHRo
cmVhZCwgd2hvIGF1dGhvcmVkIHRoZSBkcml2ZXIuDQo+ID4NCj4gPiBPbiBNb24sIDMwIE1hciAy
MDIwLCBhdCAwNjowNywgQ2hhbmdtaW5nIExpdSB3cm90ZToNCj4gPiA+IEhpIEpvZWwgYW5kIEFu
ZHJldywNCj4gPiA+DQo+ID4gPiBHcmVldGluZ3MsIEknbSBhIGZpcnN0IHllYXIgUGhEIHN0dWRl
bnQgd2hvIGlzIGludGVyZXN0ZWQgaW4gdGhlDQo+ID4gPiB1c2FnZSBvZiBVQlNhbiBpbiB0aGUg
bGludXgga2VybmVsLCBhbmQgd2l0aCBzb21lIGV4cGVyaW1lbnRzIEkNCj4gPiA+IGZvdW5kIHRo
YXQgaW4gZHJpdmVycy9zb2MvYXNwZWVkL2FzcGVlZC1wMmEtY3RybC5jIGZ1bmN0aW9uDQo+ID4g
PiBhc3BlZWRfcDJhX3JlZ2lvbl9hY3F1aXJlLCB0aGVyZSBpcyBhbiB1bnNpZ25lZCBpbnRlZ2Vy
IGVycm9yIHdoaWNoDQo+ID4gPiBtaWdodCBjYXVzZSB1bmV4cGVjdGVkIGJlaGF2aW9yLg0KPiA+
ID4NCj4gPiA+IE1vcmUgc3BlY2lmaWNhbGx5LCB0aGUgbWFwIHN0cnVjdHVyZSwgYWZ0ZXIgdGhl
IGV4ZWN1dGlvbiBvZg0KPiA+ID4gY29weV9mcm9tX3VzZXIgYXQgbGluZSAxODAgaW4gZnVuY3Rp
b24gYXNwZWVkX3AyYV9pb2N0bCwgaXMgZmlsbGVkDQo+ID4gPiB3aXRoIGRhdGEgZnJvbSB1c2Vy
IHNwYWNlLiAgU28gdGhlIGNvZGUgYXQgbGluZSAxMzYgdGhhdCBpcw0KPiA+ID4NCj4gPiA+IGVu
ZCA9IG1hcC0+YWRkciArIChtYXAtPmxlbmd0aCAtIDEpOw0KPiA+ID4NCj4gPiA+IHRoZSBzdWJ0
cmFjdGlvbiBjb3VsZCB1bmRlcmZsb3cgd2hlbiBtYXAtPmxlbmd0aCBlcXVhbHMgemVybywgYWxz
bywNCj4gPiA+IHRoaXMgc3VtIGNvdWxkIG92ZXJmbG93LiBBcyBhIGNvbnNlcXVlbmNlLCB0aGUg
Y2hlY2sgYXQgbGluZSAxNDkNCj4gPiA+IGNvdWxkIGJlIGJ5cGFzc2VkIGFuZCB0aGUgZm9sbG93
aW5nIGNvZGUgY291bGQgYmUgZXhlY3V0ZWQuDQo+ID4gPg0KPiA+ID4gQWx0aG91Z2ggdGhlIGZh
Y3QgdGhhdCBtYXAtPmFkZHIgaXMgYSA2NC1iaXQgdW5zaWduZWQgaW50ZWdlciBhbmQNCj4gPiA+
IG1hcC0+bGVuZ3RoIGlzIDMyLWJpdCBtYWtlcyB0aGUgb3ZlcmZsb3cgbGVzcyBsaWtlbHkgdG8g
aGFwcGVuLCBpdA0KPiA+ID4gc2VlbXMgZG9lc24ndCBlbGltaW5hdGUgdGhlIHBvc3NpYmlsaXR5
IGVudGlyZWx5LiBJIGd1ZXNzIGENCj4gPiA+IGFjY2Vzc19vayBjb3VsZCBkbz8NCj4gDQo+IEkn
bGwgdGFrZSBhIGxvb2ssIGJ1dCBjZXJ0YWlubHkgYWRkaW5nIGEgMzItYml0IHZhbHVlIHRvIGEg
NjQtYml0IHZhbHVlIGhhcyB0aGUNCj4gcG9zc2liaWxpdHkgb2Ygb3ZlcmZsb3cgZ2l2ZW4gYSBj
b250cml2ZWQgYXR0YWNrIHNjZW5hcmlvLg0KPiANCj4gPiA+DQo+ID4gPiBEdWUgdG8gdGhlIGxh
Y2sgb2Yga25vd2xlZGdlIG9mIHRoZSBpbnRlcmFjdGlvbiBiZXR3ZWVuIHRoaXMgbW9kdWxlDQo+
ID4gPiBhbmQgdGhlIHVzZXIgc3BhY2UsIEknbSBub3QgYWJsZSB0byBhc3Nlc3MgaWYgdGhpcyBp
cw0KPiA+ID4gc2VjdXJpdHktcmVsYXRlZCBwcm9ibGVtLiBJJ2QgYXBwcmVjaWF0ZSBpdCB2ZXJ5
IG11Y2ggdG8gaGVhciB5b3VyDQo+ID4gPiB2YWx1YWJsZSBvcGluaW9uIG9uIHdoeSB0aGlzIGNv
dWxkIG5vdCBjYXVzZSBhbnkgdHJvdWJsZSBpZiBpdCdzDQo+ID4gPiBpbmRlZWQgdGhlIGNhc2Us
IHRoaXMgd2lsbCBoZWxwIG1lIHVuZGVyIGxpbnV4IGFuZCBVQlNBTiBhIGxvdCEgYW5kDQo+ID4g
PiBJJ20gbW9yZSB0aGFuIGhhcHB5IHRvIHByb3ZpZGUgbW9yZSBpbmZvcm1hdGlvbiBpZiBuZWVk
ZWQuDQo+ID4NCj4gPiBJdCdzIGNlcnRhaW5seSBub3QgZXhwZWN0ZWQgYmVoYXZpb3VyIGFuZCBz
aG91bGQgYmUgZml4ZWQgOikgV2UgbmVlZA0KPiA+IHRvIGNoZWNrIGlmIHRoZSBgZW5kYCBjYWxj
dWxhdGlvbiBvdmVyZmxvd2VkLCBidXQgbm90IHVzaW5nDQo+ID4gYGFjY2Vzc19vaygpYCwgYXMg
dGhlIHZhbHVlIG9mIGBlbmRgIGlzIGFuIGFkZHJlc3MgaW4gdGhlIHBoeXNpY2FsIGFkZHJlc3Mg
c3BhY2UNCj4gb2YgdGhlIFNvQy4NCj4gPg0KPiA+IFRoZSBjdXJyZW50IGJlaGF2aW91ciBkb2Vz
IGhhdmUgYSBzZWN1cml0eSBpbXBhY3QsIHRob3VnaCBwcm9iYWJseSBub3QNCj4gPiBpbiB0aGUg
d2F5IHlvdSdyZSBleHBlY3RpbmcsIGFzIHRoZSBkcml2ZXIgaXRzZWxmIGlzIGEgbWVhbnMgdG8N
Cj4gPiB2aW9sYXRlIHRoZSBTb0MncyBzZWN1cml0eS4gVGhlIFNvQyBpcyBhIEJNQyBhbmQgZXhw
b3NlcyBzZXZlcmFsIFBDSWUNCj4gPiBkZXZpY2VzIHRvIGl0cyBob3N0IChhIFZHQSBncmFwaGlj
cyBkZXZpY2UgYW5kIGEgIkJNQyIgZGV2aWNlKS4gQm90aA0KPiA+IGRldmljZXMgZXhwb3NlIGZ1
bmN0aW9uYWxpdHkgdGhhdCBhbGxvd3MgdGhlIGhvc3QgdG8gcGVyZm9ybSBhcmJpdHJhcnkNCj4g
PiByZWFkcyBhbmQgd3JpdGVzIHRvIHRoZSBCTUMncyBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlIF9p
Zl8gdGhlIEJNQyBoYXMNCj4gPiBhbGxvd2VkIGl0IHRvIGRvIHNvLiBUaGlzIGRyaXZlciBjb250
cm9scyB3aGV0aGVyIHRoZSBjYXBhYmlsaXR5IGlzDQo+ID4gZXhwb3NlZCB0byB0aGUgaG9zdCAo
ZGlzYWJsaW5nIGRlbmllcyB0aGUgcmVhZCBjYXBhYmlsaXR5KSBhbmQgd2hhdA0KPiA+IHJlZ2lv
bnMgb2YgdGhlIFNvQydzIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgY2FuIGJlIHdyaXR0ZW4uIFJl
Z2lvbnMNCj4gPiBhcmUgcm91Z2hseSBicm9rZW4gdXAgaW50byBtZW1vcnktbWFwcGVkIGZsYXNo
LCBCTUMgTU1JTywgQk1DIFJBTQ0KPiBhbmQgQk1DIExQQyBob3N0IGNvbnRyb2xsZXIuDQo+ID4N
Cj4gPiBQcmFjdGljYWxseSwgZW5hYmxpbmcgYW55IHJlZ2lvbiBmb3Igd3JpdGUgaXMgdG8gc29t
ZSBkZWdyZWUgdW5zYWZlOg0KPiA+IGZvciBpbnN0YW5jZSBleHBvc2luZyB0aGUgQk1DJ3MgUkFN
IHRvIHdyaXRlcyBkb2Vzbid0IGluIGFueSB3YXkNCj4gPiByZXN0cmljdCB3aGF0IGFyZWFzIG9m
IFJBTSBjYW4gYmUgd3JpdHRlbiwgYWxsb3dpbmcgZS5nLiBhcmJpdHJhcnkNCj4gPiBjb2RlIGlu
amVjdGlvbiBpbnRvIHRoZSBrZXJuZWwgb3IgcnVubmluZyBwcm9jZXNzZXMgb24gdGhlIEJNQy4N
Cj4gPiBFbmFibGluZyB3cml0ZXMgdG8gdGhlIEJNQyBNTUlPIHJlZ2lvbiBhbGxvd3MgYXJiaXRy
YXJ5IGNvbnRyb2wgb2YgdGhlDQo+ID4gQk1DIGFuZCBpdHMgcGVyaXBoZXJhbHMgd2l0aG91dCBo
YXZpbmcgdG8gZ2FpbiBjb2RlLWV4ZWN1dGlvbiAoaW5jbHVkaW5nDQo+IGVzY2FsYXRpbmcgYnkg
cmVtb3Zpbmcgd3JpdGUgcHJvdGVjdGlvbiBmb3Igb3RoZXIgcmVnaW9ucykuDQo+ID4NCj4gPiBU
aGUgZHJpdmVyIGV4aXN0cyB0byBhc3Npc3QgYSB0cnVzdGVkIGZpcm13YXJlIHVwZGF0ZSBwcm9j
ZXNzIHVzZWQgb24NCj4gPiBzb21lIHBsYXRmb3JtcyB3aGVyZSB0aGUgaG9zdCBjYW4gcmVxdWVz
dCAoZS5nLiB2aWEgSVBNSSkgdGhhdCBCTUMgUkFNDQo+ID4gYmUgbWFkZSB3cml0YWJsZSwgdGhl
biBkcm9wIGl0cyBmaXJtd2FyZSB1cGRhdGUgcGF5bG9hZCBpbnRvIGENCj4gPiBwcmVkZXRlcm1p
bmVkIGxvY2F0aW9uIGluIHBoeXNpY2FsIG1lbW9yeSwgYW5kIGZpbmFsbHkgY29tcGxldGUgdGhl
DQo+ID4gdHJhbnNmZXIgYnkgcmVxdWVzdGluZyB0aGF0IFJBTSByZWdpb24gYmUgcmV0dXJuZWQg
dG8gYXQgbGVhc3QgcmVhZC1vbmx5DQo+IG1vZGUuDQo+ID4NCj4gPiBUbyB1bmxvY2sgdW5leHBl
Y3RlZCByZWdpb25zIG9mIHRoZSBCTUMncyBhZGRyZXNzIHNwYWNlIGluIHRoaXMNCj4gPiBzY2Vu
YXJpbyB0aGUgaG9zdCB3b3VsZCBhbHNvIGhhdmUgdG8gZXhwbG9pdCBJUE1JIHRvIGNyYWZ0IGFu
IGlvY3RsKCkNCj4gPiBwYXlsb2FkIHdpdGggdGhlIHByb3BlcnRpZXMgdG8gdHJpZ2dlciB0aGUg
b3ZlcmZsb3cuIEdpdmVuIHRoYXQgaXQNCj4gPiBhbHJlYWR5IGhhcyBjb21wbGV0ZSB3cml0ZSBh
Y2Nlc3MgdG8gUkFNIGl0IG1heSBiZSBlYXNpZXIgdG8ganVzdA0KPiA+IGV4cGxvaXQgdGhlIEJN
QyBrZXJuZWwgZGlyZWN0bHkgcmF0aGVyIHRoYW4gY2hhaW4gYW4gZXhwbG9pdCB0aHJvdWdoIGF0
IGxlYXN0DQo+IG9uZSBvdGhlciB1c2Vyc3BhY2UgcHJvY2Vzcy4NCj4gPg0KPiA+IEFueXdheSwg
ZW5vdWdoIGJhY2tncm91bmQgOikgVGhhbmtzIGZvciB0aGUgYnVnIHJlcG9ydCBhbmQgZm9yDQo+
ID4gYW5hbHl6aW5nIHRoZSBkcml2ZXIuIEhvcGVmdWxseSBQYXRyaWNrIGNhbiB0YWtlIGEgbG9v
ayBhbmQgY29vayB1cCBhIGZpeC4NCj4gDQpIaSBBbmRyZXcgYW5kIFBhdHJpY2ssDQpUaGFuayB5
b3Ugc28gbXVjaCBmb3IgdGhpcyB2aXZpZCBlbmxpZ2h0ZW5pbmcgZXhwbGFuYXRpb24hIFRoZSBk
cml2ZXIgY29kZSBoYXMgbmV2ZXIgYmVlbiB0aGlzIGNsZWFyLg0KQWx0aG91Z2ggaXQgd2FzIGEg
bG90IGZvciBtZSB0byBkaWdlc3QgYnV0IGl0IHVuZG91YnRlZGx5IGhlbHBlZCBhIGxvdCB0byB1
bmRlcnN0YW5kIGhvdyBsaW51eCBkcml2ZXJzIGFjdHVhbGx5IHdvcmtlZC4NCllvdSBndXlzIGFy
ZSB0aGUgaGVyby4gOiApDQoNCkNoYW5nbWluZyBMaXUNCg0KPiBZZWFoLCB0aGlzIGRyaXZlciB3
YXMgZGVsaWJlcmF0ZWx5IHdyaXR0ZW4gdG8gZW5hYmxlIGFjY2Vzc2luZyB0aGUgbWVtb3J5DQo+
IHJlZ2lvbnMgY29udHJvbGxlZCBieSB0aGUgQk1DLCBvcGVuaW5nIGEgc2VjdXJpdHkgaG9sZSBp
biB0aGUgQk1DLiAgSXQncyBwYXJ0IG9mDQo+IHRoZSBkZXNpZ24uDQo+IA0KPiA+DQo+ID4gQW5k
cmV3DQo=

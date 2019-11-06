Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FAEF2B66
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:50:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477zDV181LzF6K0
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:50:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fi.rohmeurope.com (client-ip=178.15.145.194;
 helo=mailgate1.rohmeurope.com;
 envelope-from=prvs=2213888d88=matti.vaittinen@fi.rohmeurope.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fi.rohmeurope.com
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by lists.ozlabs.org (Postfix) with ESMTP id 477YRh2K61zF3C3
 for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Nov 2019 04:28:55 +1100 (AEDT)
X-AuditID: c0a8fbf4-183ff70000001fa6-4b-5dc302d46b4a
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 47.2E.08102.4D203CD5; Wed,  6 Nov 2019 18:28:52 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 6 Nov 2019 18:28:51 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>
Subject: Re: [PATCH v2 0/2] Add definition for GPIO direction
Thread-Topic: [PATCH v2 0/2] Add definition for GPIO direction
Thread-Index: AQHVlLAQU8xb+K9L/ECQSPwnZdt/+qd+VSuA
Date: Wed, 6 Nov 2019 17:28:51 +0000
Message-ID: <c333eb18eec9adf333e1b3cca2ff7ccacb2a863b.camel@fi.rohmeurope.com>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106143938.GA3176@icarus>
In-Reply-To: <20191106143938.GA3176@icarus>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [176.93.194.151]
Content-Type: text/plain; charset="utf-8"
Content-ID: <18FFF0DF279DD94B9327FC374E716AF8@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTZxTee+/t7eWj41KBvsIkoWFZHJng5pbzwxGzX3dZwkYWk2UB2VWu
 lACFtGVTfyg41AGWlQEDOygfATcKOGg1SHEBiwq6YGV8TCcd6ajDmggOMKjI2L3tFH69zznP
 85zn/DgvQyqLmWgmW2sQdFo+V00HU4M/rdremiCG0pOqPbHQ4/0VwcSYkwDHOAPG47UElD+q
 JaHLeJWC5YYbFEycsCEYMA6R8Gz+ihw8kx9DezUFd4r7CVh1rZFQYm6hwFrTR8E9+ywB1c9/
 JMA2OyWDrztukmBvfI6g7Fk7CeOOehp+aP2WArfbiuCCb56AsimvDEqXzTTc7/pdBiOtjxF4
 2uspqG8bocCy1iWDed9nsLQwIIPLcw8pGKtzkXDvjJ2GtV4bBafaJ0RFhxfB/fMqmLbbZVDX
 2Y/gqcNCwd3KKgTGhTYafvlzCe1J4iZPOeRc99Jxmlu4fULOmWdGaa5utYXiHIPRXJ/ZLefG
 /rlGcjZrKc1NT12iOcv1VM7eeoxz1TUjzvToodh+0oY42/g0+iTm85Dd+3nDl59mZ2kTk78I
 0ZT3jtEFf4UeKplboovQxdAyFMRgdhdutjSRZSiYUbKTCBc7a+SBYhjhkxduiQXD0OxuXHZH
 Lhki2HdxsWPRryHZ5ki8WnSXlIgt7Pt4tMdLBETJeKSjlgrgt/HNkWEkYYqNx52VPX6Ngk3B
 XaYK/1AlexC7ykdpCQexCdj6h9GvR+w2XFo079eTrArb/l6RBbZmceslFxnAkdg3++//fTVe
 GjET0s4kux3/7EgMWPfgym4rHcBxuLrcIw+sEI6vn/FSJhRl3pRg3nCbN7nNm9zmTe4mJLMi
 nMdn52bxBmHnDp1QuEOXr8kTnwP5eTYUOOnli2jd+aETEQxyoq0MoY5UvON0pitf3Z+feVjD
 6zUZusJcQe9EmCHVEYq0isvpSkUmf/iIoMt/QcUwlFqleMNTma5kpawcQSgQdC/Y1xhGjRUm
 NJSuDNcJWcKhg9m5hg2aYIKk4cHREXpBmyno+EKDJkO6jwy9eCASFSrm9kp2hb6AzxO7AesN
 lMCYfA0tJHOloa2FVFLafK0QrVI0vyJKWUmqKdS+DHqAVAxSb1HMSYNCxX/9cs4DMYIQI5Ju
 O6UIA79BRRehXVGde3OGkxNqwob7Pccaf/sqKi5+Zb16MCfYQ7i8KTOhW9Nc79ERqStPmvZ+
 15dm8iV3xgxs1906fTW2KvXs6W7ftQP7Yh8fPdkYnniuNzguLP6IsjbsaYVsVav66Py6MkWt
 f30xPMwSX3L0+6Lcs9vWhtwhdsWM8RtT06JbVtX+gZrSa/idb5I6Pf8fqswH+ZQEAAA=
X-Mailman-Approved-At: Thu, 07 Nov 2019 20:47:03 +1100
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "info@metux.net" <info@metux.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

DQpPbiBXZWQsIDIwMTktMTEtMDYgYXQgMDk6MzkgLTA1MDAsIFdpbGxpYW0gQnJlYXRoaXR0IEdy
YXkgd3JvdGU6DQo+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDEwOjUxOjA2QU0gKzAyMDAsIE1h
dHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiBUaGUgcGF0Y2ggc2VyaWVzIGFkZHMgZGVmaW5pdGlv
bnMgZm9yIEdQSU8gbGluZSBkaXJlY3Rpb25zLg0KDQouLi5zbmlwLi4uDQoNCj4gPiBUaGlzIHBh
dGNoIHNlcmllcyBpcyBiYXNlZCBvbiBHUElPIHRyZWUgZGV2ZWwgYnJhbmNoLg0KPiANCj4gSnVz
dCBhIHRpcCBmb3IgZnV0dXJlIHBhdGNoc2V0cyBpbiBjYXNlIHlvdSBkaWRuJ3Qga25vdywgeW91
IGNhc2UNCj4gc3BlY2lmeSB0aGUgYmFzZSBvZiB5b3VyIHBhdGNoc2V0IGJ5IHVzaW5nIHRoZSAi
LS1iYXNlIiBvcHRpb246DQo+IGh0dHBzOi8vZ2l0LXNjbS5jb20vZG9jcy9naXQtZm9ybWF0LXBh
dGNoI19iYXNlX3RyZWVfaW5mb3JtYXRpb24NCj4gDQo+IFRoaXMgd2lsbCBhcHBlbmQgYSAiYmFz
ZS1jb21taXQiIGxpbmUgd2l0aCB0aGUgY29tbWl0IGhhc2ggYXQgdGhlIGVuZA0KPiBvZg0KPiB0
aGUgZmlyc3QgbWVzc2FnZSBzbyB0aGF0IGl0J3MgdW5hYmlndW91cyB3aGljaCBiYXNlIHlvdSdy
ZSB1c2luZw0KPiAodXNlZnVsIGluIGNhc2UgdGhlIGJyYW5jaCBjaGFuZ2VzIGJlZm9yZSB5b3Vy
IHBhdGNoIGlzIHJldmlld2VkKS4NCg0KVGFua3MgV2lsbGlhbSEgSSBkaWRuJ3Qga25vdyBhYm91
dCB0aGUgLS1iYXNlLiBJdCdzIG5pY2UgdG8gbGVhcm4NCnNvbWV0aGluZyBuZXcgZXZlcnkgZGF5
IDpdDQoNCj4gPiAtLSANCj4gPiBNYXR0aSBWYWl0dGluZW4sIExpbnV4IGRldmljZSBkcml2ZXJz
DQo+ID4gUk9ITSBTZW1pY29uZHVjdG9ycywgRmlubGFuZCBTV0RDDQo+ID4gS2l2aWhhcmp1bmxl
bmtraSAxRQ0KPiA+IDkwMjIwIE9VTFUNCj4gPiBGSU5MQU5EDQo+ID4gDQo+ID4gfn5+ICJJIGRv
bid0IHRoaW5rIHNvLCIgc2FpZCBSZW5lIERlc2NhcnRlcy4gSnVzdCB0aGVuIGhlIHZhbmlzaGVk
DQo+ID4gfn5+DQo+ID4gU2ltb24gc2F5cyAtIGluIExhdGluIHBsZWFzZS4NCj4gPiB+fn4gIm5v
biBjb2dpdG8gbWUiIGRpeGl0IFJlbmUgRGVzY2FydGUsIGRlaW5kZSBldmFuZXNjYXZpdCB+fn4N
Cj4gPiBUaGFua3MgdG8gU2ltb24gR2xhc3MgZm9yIHRoZSB0cmFuc2xhdGlvbiA9XSANCg0K

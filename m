Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A496DF2B34
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:48:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477z9g5JhjzF6K0
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:48:23 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fi.rohmeurope.com (client-ip=178.15.145.194;
 helo=mailgate1.rohmeurope.com;
 envelope-from=prvs=9212de9b03=matti.vaittinen@fi.rohmeurope.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fi.rohmeurope.com
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by lists.ozlabs.org (Postfix) with ESMTP id 476rC24zrqzF51t
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Nov 2019 00:30:29 +1100 (AEDT)
X-AuditID: c0a8fbf4-199ff70000001fa6-89-5dc1797381a6
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com
 [192.168.251.177])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 4F.56.08102.37971CD5; Tue,  5 Nov 2019 14:30:27 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 14:30:21 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/62] Add definition for GPIO direction
Thread-Topic: [PATCH 00/62] Add definition for GPIO direction
Thread-Index: AQHVk8EYmzhgkSAfS0Ot5MRDeZesqad8bpwAgAAJlQCAAAReAIAABYEA
Date: Tue, 5 Nov 2019 13:30:20 +0000
Message-ID: <938a5ec7b41ae9ce7b0de83764d6b774cfdaa781.camel@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
 <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
 <20191105131038.duol3rwwkbuvgvwv@pengutronix.de>
In-Reply-To: <20191105131038.duol3rwwkbuvgvwv@pengutronix.de>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E04C63BA3FE0D4784860575696D5A4B@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0xbZRjHfc+tB9aas8LsO5wfaJYYb5sYM58Pw8zE6dlinAuaTBNkZ3Kk
 RGjxtExQI7cR0pJGyDDrOmCMgFIQlXZmW4EBtW6MDQG5iY6xAhsD5ZayOMZlnkPd4Ms5//f5
 P7/n/57kOSypLWOj2GSjRZSMQoqeCadaa5YaXjBntsW/OBGIhobxqwj6enwEeHtZsOeeIKBw
 7gQJ9fZfKVgo66CgL9+NoMX+Cwn3Z/wqCPQfAFcJBUM5jQQsda2QcMxZSUHtNxcouOUZI6Bk
 +TsC3GMDNOTV/UaC5/QyAtt9Fwm93lIGTlV9TcHwcC2CnydnCLANjNNgXXAycKd+kIb2qrsI
 Aq5SCkqr2ykoX6mnYWbyEFz0XCMgONtCQ9vENAU9ji4Sbp30MLByzk1BgatPbqsbR9C9OETA
 nbM6uO7x0OD4vhHBorecgr+KjyOwz1Yz0HwjiPa8xPcXeFX8T8Fchp/9I1/FO0c6Gd6xVEnx
 3tYovjDoI/kLzmEV3zN/ieTdtVaGvz7QxPDlVw7ynqosvstxBvFFc9Ny+V41emfbB5t2HxEs
 R+OSk4w7Xz28yVBhDTBpteoMR/AulY2y1TYUxmLuZZx7xkrYUDir5foRXu7NoUOHywhfsroZ
 G2JZhtuNbUMqRUZye/Gx+V1KC8mVs9g/MEcrgx7jOjU4tzFL0RFy+9W8GqToSC4W1414mJB+
 A4+sVq9pituOe8/mr/VouLex/fgMFcqdRngpz71mhMnwROMPhKIR9xS2Zs+saZLTYfftf+nQ
 F3C4qqmLDOkteHJs9f+6HjcvBijl0iT3DP7RuzOE7sH+4BwV0tG4pDCgCt1hM75ycpwqQjrn
 hgTnOu3cQDs30M4NdAWiaxFOFZJTkgSLGLNDEtN3SCZDqvz6yJTqRqFFXziPHvj2+RDBIh/a
 yhL6LZr9yW3x2sePmBIzDYLZkCClp4hmH8IsqY/U9Dia47WaRCHzc1EyPbSeZCm9TvN0oDhe
 yylZn4himig9dLexrB5rfv9MHrpZEpPEjI+TUyzrNsGGKcPDoyLNojFRlIR0iyFB2ZUEs7ws
 iqWWc0czZFxjThNS5WoI7UAxbNFkWSXJ9g6Wy09/WXUlqaWMJqMYpdN8qACcAhjSjY/ippCO
 RfoIzT7FVcv//KNpU3IQIQe9NXZRCbII61ZUNmqRDjnb95+yqkef81d1ewriI85VfHEvVmd4
 3YUEWFb7Y/88anqtpTTsxvNxn+bBe51NB3Je8QzSyyXdb44GTk9JaXmXv9Tu6n9gDxbHRnfc
 3JvT8L6PL0pniieartX9o5W+3dpqmZ8TDifRWQd6DgaC+Y64r1w3/0554vy7ntWa23rKbBBi
 niUls/AfOlQk57AEAAA=
X-Mailman-Approved-At: Thu, 07 Nov 2019 20:47:02 +1100
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
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>,
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
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
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDE5LTExLTA1IGF0IDE0OjEwICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToNCj4gSGVsbG8sDQo+IA0KPiBPbiBUdWUsIE5vdiAwNSwgMjAxOSBhdCAxMjo1NDo1NVBNICsw
MDAwLCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAxOS0xMS0wNSBhdCAx
NDoyMCArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4gSSB3b3VsZCBhbHNvIGxp
a2UgdG8gc2VlIGJsb2F0LW8tbWV0ZXIgc3RhdGlzdGljcyBiZWZvcmUgYW5kDQo+ID4gPiBhZnRl
cg0KPiA+ID4geW91ciBwYXRjaC4NCj4gPiA+IE15IGd1dHMgdGVsbCBtZSB0aGF0IHRoZSByZXN1
bHQgd2lsbCBiZSBub3QgaW4gdGhlIGZhdm91ciBvZg0KPiA+ID4geW91cnMNCj4gPiA+IHNvbHV0
aW9uLg0KPiA+IA0KPiA+IENhbiB5b3UgcGxlYXNlIHRlbGwgbWUgd2hhdCB0eXBlIG9mIHN0YXRz
IHlvdSBob3BlIHRvIHNlZT8gSSBjYW4NCj4gPiB0cnkNCj4gPiBnZW5lcmF0aW5nIHdoYXQgeW91
IGFyZSBhZnRlci4gVGhlIGNvdmVyIGxldHRlciBjb250YWluZWQgdHlwaWNhbA0KPiA+ICsvLQ0K
PiA+IGNoYW5nZSBzdGF0cyBmcm9tIGdpdCBhbmQgc3VtbWFyeToNCj4gPiANCj4gPiA2MiBmaWxl
cyBjaGFuZ2VkLCAyMjggaW5zZXJ0aW9ucygrKSwgMTA0IGRlbGV0aW9ucygtKQ0KPiANCj4gSSBn
dWVzcyBoZSB3YW50cyB0byBzZWUNCj4gDQo+IAlzY3JpcHRzL2Jsb2F0LW8tbWV0ZXIgdm1saW51
ei5vbGQgdm1saW51eg0KPiANCj4gLiBJIHdvdWxkIGV4cGVjdCBhIDAgdGhlcmUuIEkgZGlkbid0
IGxvb2sgaW4gZGV0YWlsLCBidXQgaW4gZ2VuZXJhbCBJDQo+IGxpa2UgdGhlIGlkZWEgdG8gZ2l2
ZSAwIGFuZCAxIGEgc3ltYm9saWMgbmFtZS4NCg0KVGhhbmtzIFV3ZS4gVGhpcyBmYXIgSSBoYXZl
IG9ubHkgY3Jvc3MtY29tcGlsZWQgdGhlIHNlcmllcyBmb3IgYXJtDQp3aGljaCBJIHVzZSBmb3Ig
ZGV2ZWxvcGluZyB0aGUgUk9ITSBQTUlDcy4gc2NyaXB0cy9ibG9hdC1vLW1ldGVyIC8NCnRvb2xz
IGl0IHVzZXMgZG9lcyBub3Qgc2VlbSB0byByZWNvZ25pemUgdGhlIGltYWdlIGZvcm1hdCAobm90
IGEgYmlnDQpzdXJwcml6ZSBhcyBteSBob3N0IGlzIHg4Nl82NCkuDQoNCkJyLA0KCU1hdHRpIFZh
aXR0aW5lbg0KDQo=

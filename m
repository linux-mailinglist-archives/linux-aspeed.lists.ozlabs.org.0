Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512BF2B4C
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:49:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477zBm5Fv0zF6K7
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:49:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fi.rohmeurope.com (client-ip=178.15.145.194;
 helo=mailgate1.rohmeurope.com;
 envelope-from=prvs=4212cf6531=matti.vaittinen@fi.rohmeurope.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fi.rohmeurope.com
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by lists.ozlabs.org (Postfix) with ESMTP id 476rks361PzF3nc
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Nov 2019 00:54:36 +1100 (AEDT)
X-AuditID: c0a8fbf4-199ff70000001fa6-ac-5dc17f19b60c
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com
 [192.168.251.177])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 7A.86.08102.91F71CD5; Tue,  5 Nov 2019 14:54:33 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 14:54:27 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 00/62] Add definition for GPIO direction
Thread-Topic: [PATCH 00/62] Add definition for GPIO direction
Thread-Index: AQHVk8EYmzhgkSAfS0Ot5MRDeZesqad8bpwAgAAJlQCAAASWgIAADAaA
Date: Tue, 5 Nov 2019 13:54:27 +0000
Message-ID: <fdcfc69b39990dd382804db45422ed692881ea15.camel@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
 <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
 <20191105131125.GP32742@smile.fi.intel.com>
In-Reply-To: <20191105131125.GP32742@smile.fi.intel.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F950CBC594F95498FB52FF5A6B6196B@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUwbZRjPe3e9HrCaWwf2hW0xNsbFLcCmJjyajeAfMyfTqZnRBYN4yI0S
 SyFtQVg04AZOSupYrFBOPrSByYdV12p0HbBRYcLYQBwgyPgK4PjIAC1TPlb1bnWDv+53z+/r
 fZPnZUj1h0wEk2YwC0YDr9fSwdSluvVzkeF5rYl7/xqMgnNTXQj6er0EeK4zYD1RRkDxUhkJ
 Tms7BcuVVyjoK3QhuGj9kYS1hTYlTPS/CPU2Cobev0DAeo+fhALRQUHDJ+cpmHZPEmC78wUB
 rskBBZxs7CbBXX0HgWWtnoTrngoaPq05TcHISAOC72YXCLAMTCmgaFmkYcb5qwI6am4jmKiv
 oKCitoOCKr9TAQuzR6HFfZUA3+JFBbTevEVBr72HhOlyNw3+710UnKrvk2SNUwh+Xh0iYOZb
 DdxwuxVg//ICglVPFQXDZz5GYF2spaF51IfiHuf6T3mU3De+EzS3OFio5MSxazRnX3dQnOdS
 BFfs85LceXFEyfX+cZnkXA1FNHdjoInmqjpf5tw1eVyP/XPElSzdksYrteilHQkh+5N5c/aR
 tFRDdOybIbqVs6PKzMtP51TYvEQ+KnjKgoIYzD6Jy4b9pAUFM2q2H+GuJicd+PkJ4dLxfIUF
 MQzN7seWIaVsCGUP4bWFQSRjkp0Ow3398TLeJkm6TtahgOYAbhxz07I1lH0WLzYxMqTYR3C7
 dZcMVexhfM12NFA0g/DSB6dJ2RnEAq7+bfZuCmJ34qL8BSLQpMGu3/9WBI7M4pqmHjKAw/Ds
 5D//z7W4eXWCkvNJ9jH8tSc6YI3D1T1FZAA/jG3FE3cvomK34s7yKaoEPShuahA33OImt7jJ
 LW5yf4YUDQin82n6VN4s7IsyCllRxgxduvR5KyPdhQKbvfwD+tf7nBcRDPKicIbQhqni01oT
 1Q8kZ6Tk6niTLsmYpRdMXoQZUhuq6rU3J6pVKXzuccGYcY/azlBajWrXxJlENSt3vS0ImYLx
 HruDYbRYlX1cCt1qFFKFnGNpevMGTTBBcnhwRKhJMKQIRj7LrEuSlyPJJG2HTG2Rervelewq
 UyafLk0D1itoD1MyW+kgmbbKWgeppgwZBiFCo2qSpaws1WUZ7hfNIQ2DtNtU5vckdov0vO/n
 zEkVhFTx/GSLXGHmN6iIfJRLvNBup/Pe6XaUhoxbCw88c2j5dox2sZuIW2/YPZ81/kqO0rd9
 WLOn8nBfP7yRIJR+tNPvFEc7KnLDE2wx5e2x+r0P+QuER9tf7207ZsuOPFjkPPvnzauvxte1
 KJMjX7OPZnY+EV0YHfYLPzVpHmHmDs4nfRW7cmQpRtTPjzlqw7WUScfv200aTfx/DlaFoZsE
 AAA=
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
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
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
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
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

DQpPbiBUdWUsIDIwMTktMTEtMDUgYXQgMTU6MTEgKzAyMDAsIGFuZHJpeS5zaGV2Y2hlbmtvQGxp
bnV4LmludGVsLmNvbQ0Kd3JvdGU6DQo+IE9uIFR1ZSwgTm92IDA1LCAyMDE5IGF0IDEyOjU0OjU1
UE0gKzAwMDAsIFZhaXR0aW5lbiwgTWF0dGkgd3JvdGU6DQo+ID4gT24gVHVlLCAyMDE5LTExLTA1
IGF0IDE0OjIwICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+ID4gPiBPbiBUdWUsIE5v
diAwNSwgMjAxOSBhdCAxMjowOToxMFBNICswMjAwLCBNYXR0aSBWYWl0dGluZW4gd3JvdGU6DQo+
ID4gPiA+IFRoZSBwYXRjaCBzZXJpZXMgYWRkcyBkZWZpbml0aW9ucyBmb3IgR1BJTyBsaW5lIGRp
cmVjdGlvbnMuDQo+ID4gPiA+IA0KPiA+ID4gPiBGb3Igb2NjYXNpb25hbCBHUElPIGNvbnRyaWJ1
dG9yIGxpa2UgbWUgaXQgaXMgYWx3YXlzIGEgcGFpbiB0bw0KPiA+ID4gPiByZW1lbWJlcg0KPiA+
ID4gPiB3aGV0aGVyIDEgb3IgMCB3YXMgdXNlZCBmb3IgR1BJTyBkaXJlY3Rpb24gSU5QVVQvT1VU
UFVULg0KPiA+ID4gPiBKdWRnaW5nDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBmYWN0IHRoYXQgSSBy
ZW1vdmVkIGZldyBjb21tZW50cyBsaWtlOg0KPiA+ID4gPiANCj4gPiA+ID4gLyogUmV0dXJuIDAg
aWYgb3V0cHV0LCAxIGlmIGlucHV0ICovDQo+ID4gPiA+IC8qIFRoaXMgbWVhbnMgIm91dCIgKi8N
Cj4gPiA+ID4gcmV0dXJuIDE7IC8qIGlucHV0ICovDQo+ID4gPiA+IHJldHVybiAwOyAvKiBvdXRw
dXQgKi8NCj4gPiA+ID4gDQo+ID4gPiA+IGl0IHNlZW1zIGF0IGxlYXN0IHNvbWUgb3RoZXJzIG1h
eSBmaW5kIGl0IGhhcmQgdG8gcmVtZW1iZXIgdG9vLg0KPiA+ID4gPiBBZGRpbmcNCj4gPiA+ID4g
ZGVmaW5lcyBmb3IgdGhlc2UgdmFsdWVzIGhlbHBzIHVzIHdobyByZWFsbHkgaGF2ZSBnb29kIC0g
YnV0DQo+ID4gPiA+IHNob3J0DQo+ID4gPiA+IGR1cmF0aW9uIC0gbWVtb3J5IDpdDQo+ID4gPiA+
IA0KPiA+ID4gPiBQbGVhc2UgYWxzbyBzZWUgdGhlIGxhc3QgcGF0Y2guIEl0IGFkZHMgd2Fybmlu
ZyBwcmludHMgdG8gYmUNCj4gPiA+ID4gZW1pdHRlZA0KPiA+ID4gPiBmcm9tIGdwaW9saWIgaWYg
b3RoZXIgdGhhbiBkZWZpbmVkIHZhbHVlcyBhcmUgdXNlZC4gVGhpcyBwYXRjaA0KPiA+ID4gPiBj
YW4NCj4gPiA+ID4gYmUNCj4gPiA+ID4gZHJvcHBlZCBvdXQgaWYgdGhlcmUgaXMgYSByZWFzb24g
Zm9yIHRoYXQgdG8gc3RpbGwgYmUgYWxsb3dlZC4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgaWRl
YSBjb21lcyBmcm9tIFJGQyBzZXJpZXMgZm9yIFJPSE0gQkQ3MTgyOCBQTUlDIGFuZCB3YXMNCj4g
PiA+ID4gaW5pdGlhbGx5DQo+ID4gPiA+IGRpc2N1c3NlZCB3aXRoIExpbnVzIFdhbGxlaWogaGVy
ZToNCj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9jMDY3MjVjM2RkMzQxMThh
MzI0OTA3MTM3NzU4ZDhiODViM2Q0MDQzLmNhbWVsQGZpLnJvaG1ldXJvcGUuY29tLw0KPiA+ID4g
PiBidXQgYXMgdGhpcyBoYXMgbm8gZGVwZW5kZW5jaWVzIHRvIEJENzE4Mjggd29yayAod2hpY2gg
cHJvYmFibHkNCj4gPiA+ID4gdGFrZXMgYQ0KPiA+ID4gPiB3aGlsZSkgSSBkZWNpZGVkIHRvIG1h
a2UgaXQgaW5kZXBlbmRlbnQgc2VyaWVzLg0KPiA+ID4gPiANCj4gPiA+ID4gUGF0Y2hlcyBhcmUg
Y29tcGlsZS10ZXN0ZWQgb25seS4gSSBoYXZlIG5vIEhXIHRvIHJlYWxseSB0ZXN0DQo+ID4gPiA+
IHRoZW0uDQo+ID4gPiA+IFRodXMgSSdkDQo+ID4gPiA+IGFwcHJlY2lhdGUgY2FyZWZ1bGwgcmV2
aWV3LiBUaGlzIHdvcmsgaXMgbWFpbmx5IGFib3V0DQo+ID4gPiA+IGNvbnZlcnRpbmcNCj4gPiA+
ID4gemVyb3MNCj4gPiA+ID4gYW5kIG9uZXMgdG8gdGhlIG5ldyBkZWZpbmVzIGJ1dCBpdCB3b3Vs
ZG4ndCBiZSBmaXJzdCB0aW1lIEkgZ2V0DQo+ID4gPiA+IGl0DQo+ID4gPiA+IHdyb25nDQo+ID4g
PiA+IGluIG9uZSBvZiB0aGUgcGF0Y2hlcyA6KQ0KPiA+ID4gDQo+ID4gPiBGb3IgYWxsIHBhdGNo
ZXMgSSBoYXZlIGJlZW4gQ2MnZWQgdG8sIE5BSy4NCj4gPiA+IA0KPiA+ID4gSSBkb24ndCBzZWUg
dGhlIGFkdmFudGFnZXMgbm93IHNpbmNlIGFsbCBrbm93biBoYXJkd2FyZSB1c2VzIHRoZQ0KPiA+
ID4gc2luZ2xlIGJpdCB0bw0KPiA+ID4gZGVzY3JpYmUgZGlyZWN0aW9uIChldmVuIGZvciBJbnRl
bCB3aGVyZSB3ZSBoYXZlIHNlcGFyYXRlIGdhdGluZw0KPiA+ID4gZm9yDQo+ID4gPiBpbiBhbmQg
b3V0DQo+ID4gPiBidWZmZXJzIHRoZSBkaXJlY3Rpb24gd2UgYmFzaWNhbGx5IHJlbHkgb24gdGhl
IGJpdCB0aGF0IGVuYWJsZXMNCj4gPiA+IG91dA0KPiA+ID4gYnVmZmVyKS4NCj4gPiA+IA0KPiA+
ID4gU28sIHRoYXQgc2FpZCB0aGUgZGlyZWN0aW9uIGlzIGFsd2F5cyAxIGJpdCBhbmQgYmFzaWNh
bGx5IDAvMQ0KPiA+ID4gdmFsdWUuIA0KPiA+IA0KPiA+IFllcy4gQXQgbGVhc3QgZm9yIG5vdy4g
QW5kIHRoaXMgcGF0Y2ggZGlkbid0IGNoYW5nZSB0aGF0IGFsdGhvdWdoDQo+ID4gaXQNCj4gPiBt
YWtlcyBpdCBwb3NzaWJsZSB0byBkbyBzbyBpZiByZXF1aXJlZC4NCj4gPiANCj4gPiA+IFdoaWNo
IG9uZQ0KPiA+ID4gaXMgaW4gYW5kIHdoaWNoIG9uZSBpcyBvdXQganVzdCBhIG1hdHRlciBvZiBh
biBhZ3JlZW1lbnQgd2UgZGlkLg0KPiA+IA0KPiA+IFRoaXMgb25lIGlzIGV4YWN0bHkgdGhlIHBy
b2JsZW0gcGF0Y2ggc2VyaWVzIHdhcyBjcmVhdGVkIGZvci4gV2hpY2gNCj4gPiBvbmUNCj4gPiBp
cyBJTiBhbmQgd2hpY2ggaXMgT1VUIGlzIGluZGVlZCBhIG1hdHRlciBvZiBhbiBhZ3JlZW1lbnQg
LSBidXQNCj4gPiB0aGlzDQo+ID4gYWdyZWVtZW50IHNob3VsZCBiZSBjbGVhcmx5IHZpc2libGUs
IHdlbGwgZGVmaW5lZCBhbmQgc2FtZSBmb3IgYWxsLg0KPiA+IA0KPiA+IEl0J3MgKmFubm95aW5n
KiB0byB0cnkgZmluZGluZyBvdXQgd2hldGhlciBpdCB3YXMgMSBvciAwIG9uZSBzaG91bGQNCj4g
PiByZXR1cm4gZnJvbSBnZXRfZGlyZWN0aW9uIGNhbGxiYWNrIGZvciBPVVRQVVQuIFRoaXMgaXMg
cHJvYmFibHkgdGhlDQo+ID4gcmVhc29uIHdlIGhhdmUgY29tbWVudHMgbGlrZQ0KPiA+IA0KPiA+
IHJldHVybiAxOyAvKiBpbnB1dCAqLw0KPiA+IA0KPiA+IHRoZXJlLg0KPiA+IA0KPiA+IEFzIHRo
aXMgaXMgZ2xvYmFsIGFncmVlbWVudCBmb3IgYWxsIEdQSU8gZnJhbWV3b3JrIHVzZXJzIC0gbm90
DQo+ID4gc29tZXRoaW5nIHRoYXQgY2FuIGJlIGFncmVlZCBwZXIgZHJpdmVyIGJhc2lzIC0gd2Ug
c2hvdWxkIGhhdmUgR1BJTw0KPiA+IGZyYW1ld29yayB3aWRlIGRlZmluaXRpb25zIGZvciB0aGlz
LiBXZSBjYW4ganVzdCBhZGQgZGVmaW5pdGlvbnMNCj4gPiBmb3INCj4gPiBuZXcgZHJpdmVycyB0
byBiZW5lZml0IC0gYnV0IEkgdGhpbmsgYWRkaW5nIHRoZW0gYWxzbyBmb3IgZXhpc3RpbmcNCj4g
PiBkcml2ZXJzIGltcHJvdmVzIHJlYWRhYmlsaXR5IHNpZ25pZmljYW50bHkgKHNlZSBiZWxvdyku
DQo+ID4gDQo+ID4gPiBJIHdvdWxkIGFsc28gbGlrZSB0byBzZWUgYmxvYXQtby1tZXRlciBzdGF0
aXN0aWNzIGJlZm9yZSBhbmQNCj4gPiA+IGFmdGVyDQo+ID4gPiB5b3VyIHBhdGNoLg0KPiA+ID4g
TXkgZ3V0cyB0ZWxsIG1lIHRoYXQgdGhlIHJlc3VsdCB3aWxsIGJlIG5vdCBpbiB0aGUgZmF2b3Vy
IG9mDQo+ID4gPiB5b3Vycw0KPiA+ID4gc29sdXRpb24uDQo+ID4gDQo+ID4gQ2FuIHlvdSBwbGVh
c2UgdGVsbCBtZSB3aGF0IHR5cGUgb2Ygc3RhdHMgeW91IGhvcGUgdG8gc2VlPyANCj4gDQo+IGJs
b2F0LW8tbWV0ZXIuIEl0J3MgYSBzY3JpcHQgdGhhdCBjb21wYXJlcyB0d28gb2JqZWN0IGZpbGVz
IHRvIHNlZQ0KPiB3aGljaA0KPiBmdW5jdGlvbnMgZ290IGZhdHRlciwgYW5kIHdoaWNoIGFyZSBz
bGltbWVyLiBZb3UgbWF5IGZpbmQgaXQgaW4gdGhlDQo+IGtlcm5lbCB0cmVlDQo+IHNvdXJjZXMg
KHNjcmlwdHMvIGZvbGRlcikuDQoNClJpZ2h0LiBVd2UgZXhwbGFpbmVkIHRoYXQgdG8gbWUuDQoN
Cj4gPiBJIGNhbiB0cnkNCj4gPiBnZW5lcmF0aW5nIHdoYXQgeW91IGFyZSBhZnRlci4gVGhlIGNv
dmVyIGxldHRlciBjb250YWluZWQgdHlwaWNhbA0KPiA+ICsvLQ0KPiA+IGNoYW5nZSBzdGF0cyBm
cm9tIGdpdCBhbmQgc3VtbWFyeToNCj4gPiANCj4gPiA2MiBmaWxlcyBjaGFuZ2VkLCAyMjggaW5z
ZXJ0aW9ucygrKSwgMTA0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IEl0IHN1cmUgc2hvd3MgdGhh
dCBhbW91bnQgb2YgbGluZXMgd2FzIGluY3JlYXNlZCAocm91Z2hseSAyIGxpbmVzDQo+ID4gbW9y
ZQ0KPiA+IC8gY2hhbmdlZCBmaWxlKQ0KPiANCj4gV2hpY2ggaXMgbWFraW5nIHVubmVlZGVkIGNo
dXJuLg0KDQpOb3QgdW5uZWVkZWQuIEEgZmV3IG9mIHVzIHNlZSB0aGUgdmFsdWUgb2YgbmFtaW5n
IHRoZSAxIGFuZCAwLg0KDQo+ID4gLSBidXQgSSBndWVzcyB0aGF0IHdhcyBleHBlY3RlZCBhcyBJ
IGRvbid0IGxpa2UNCj4gPiB0ZXJuYXJ5Lg0KPiANCj4gQW5kIEkgbGlrZSB0aGVtLCBzbywgd2hh
dCB0byBkbz8NCg0KV2VsbCwgaWYgeW91IG1haW50YWluIHRob3NlIGZpbGVzIGFuZCBsaWtlIHRl
cm5hcnksIHRoZW4gdGhleSBjYW4gYmUNCnRlcm5hcnkuIEkgZG9uJ3QgcmVhbGx5IGNhcmUgYXMg
bG9uZyBhcyBJIGRvbid0IG5lZWQgdG8gYmUgdGhlIG9uZQ0KbWFpbnRhaW5pbmcgdGhlbS4gTm90
IHJlYWxseSBhIGJhdHRsZSBJIHdhbnQgdG8gaW52ZXN0IGluLiBJIGNhbiBldmVuDQpnbyBhbmQg
ZHJvcCB0aGUgcGF0Y2hlcyBmb3IgZmlsZXMgeW91IGFyZSBtYWludGFpbmluZyBpZiB5b3Ugc2Vl
IHRoYXQncw0KdGhlIHdheSB0byBnby4gSXQncyBlYXNpZXIgZm9yIG1lLg0KDQpBcyBJIHNhaWQs
IEkgZG9uJ3QgcGxhbiB0byBjaGFuZ2UgdGhlIG1lYW5pbmcgb2YgMSBhbmQgMCAtIGFsdGhvdWdo
IEkNCnRob3VnaHQgdGhhdCBhbGxvd2luZyBpdCBtaWdodCBoZWxwIGluIHRoZSBmdXR1cmUuIE1h
aW4gZ29hbCB3YXMgdG8NCm5hbWUgdGhlIDEgYW5kIDAuIE5hbWluZyBjYW4gYmUgZG9uZSBldmVu
IGlmIGFsbCB1c2VycyB3ZXJlIG5vdA0KY29udmVydGVkIHRvIHVzZSB0aGUgbmFtZXMgLSBhcyBs
b25nIGFzIHZhbHVlcyBiZWhpbmQgbmFtZXMgYXJlIG5vdA0KY2hhbmdlZC4gQ2hhbmdpbmcgdGhl
IHZhbHVlcyBpcyBhIGJ1cmRlbiB0aGF0IGNhbiBiZSBjYXJyaWVkIGJ5IG90aGVycw0Kd2hlbiBp
dCBpcyBuZWVkZWQgLSB3ZSBjYW4gbm93IGp1c3QgbWFrZSBpdCBlYXNpZXIgb3IgaGFyZGVyLg0K
DQpTbyBhcyB0byB3aGF0IHRvIGRvIC0gcGxlYXNlIGp1c3QgZ2l2ZSBtZSB0aGUgZmluYWwgZGVj
aXNpb24gc28gdGhhdCBJDQprbm93IGlmIEkgc2hvdWxkIGp1c3QgZHJvcCB0aGUgaW50ZWwgcGF0
Y2hlcyBvciB1c2UgdGhlIHRlcm5hcnkuDQpVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgcmlnaHQgbm93
IGhhdmUgdGhlIHRpbWUgdG8gd2FzdGUgYXJndWluZyBvdmVyIGl0DQo7KQ0KDQpCciwNCglNYXR0
aQ0K

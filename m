Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC16FF2B5D
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:50:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477zCx6vR0zF5PY
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:50:21 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fi.rohmeurope.com (client-ip=178.15.145.194;
 helo=mailgate1.rohmeurope.com;
 envelope-from=prvs=32135d5094=matti.vaittinen@fi.rohmeurope.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fi.rohmeurope.com
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by lists.ozlabs.org (Postfix) with ESMTP id 477Qjb0z7lzF4nG
 for <linux-aspeed@lists.ozlabs.org>; Wed,  6 Nov 2019 23:25:28 +1100 (AEDT)
X-AuditID: c0a8fbf4-183ff70000001fa6-6c-5dc2bbb4f65b
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 CC.BC.08102.4BBB2CD5; Wed,  6 Nov 2019 13:25:24 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0439.000; Wed, 6 Nov 2019 13:25:18 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "sre@kernel.org" <sre@kernel.org>
Subject: Re: [PATCH v2 0/2] Add definition for GPIO direction
Thread-Topic: [PATCH v2 0/2] Add definition for GPIO direction
Thread-Index: AQHVlJrx7wcBaYPaxUmQrQAzc732Rad+AIyA
Date: Wed, 6 Nov 2019 12:25:18 +0000
Message-ID: <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106120846.5bunrqj3uz4khih5@earth.universe>
In-Reply-To: <20191106120846.5bunrqj3uz4khih5@earth.universe>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD03FC67CBBBB149AC58086B204B0910@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xbZRjOd87p6eFSc9Zy+exc4uqIcUYmxuibOBd+LWfGiZsxMWYED+NA
 yaAlbTHgH9kQgRIcYxDKGeCoreMyomtBt8KEVbYxyKhkgCMDlFE2WORiYLBx9RzqBr++J+9z
 e3+8H0Oqcxktk2qwCCYDn6ajg6mOuhXXG82t3vg3e3Oj4JK/B0F/n5cAzx0Gik9VEFA0V0FC
 U/F1Chaquynoz3MhaC/+nYTlmU4ljA3EQX0ZBUMnWwlY8a2R8I1op6Ch/AoFE+5xAspWLxDg
 Gh9UQG5jLwnu71cRWJfrSbjjqaLhnOM0BSMjDQhapmYIsA76FVC4INIw2fSnArocjxGM1VdR
 UOXsoqBmrUkBM1OfwfxsuwKuPZymoM/mI2Gi0k3D2q8uCvLr+yVFox/BZHMk9LRaYNjtVoDt
 YiuCp54aCu6dOYugeNZJw9XReRQbww3ke5Tcz/OnaG72bp6SE/+6TXO2FTvFeTq03BVxRMn1
 /XuD5FwNhTQ3PNhGczW3jnBux9ecz1aLuJK5aWn8xIk4151h9PHOz0P2J/KWLz9JTTHsO/BF
 iP7v0ftUxrImq9y5SOWgyxorCmIw+zZuKnLQMlazAwhvFOy1omAJ30R4cHBUIhiGZvdj65BS
 1oSxUXix+x4pa0j2bjgumGvfNGvY9/HtS34iIDqAuxorqAB+Czt680gZU+weXPiwc3OuYj/C
 tjwZM1JZFp5cekUeB0kxkxttm5GI3YULc2Y2I0k2ErseLCkCO7PY0eYjAzgcT42v/z/X4atP
 xzYjSfY1/JNnX8Aai38oLaECeDcuKxpTBjbYgW9V+qkSFCFuaxC33OI2t7jNLW5zn0eKBoTT
 +dS0FN4ixESbhMxok1GfLj3HjekuFDjqhctow3vIiwgGedGLDKELV32Qei1e/UKiMSlbz5v1
 CabMNMHsRZghdWGqY99JnCqJz/5KMBmfUTsZShepenXsTLyalbtOCEKGYHrGvsQwOqzaJX0d
 9Q6TkCJkJaemWbZoggmSw4O1YWbBkCSY+EyLPkG+jgSzdB4yFSr1Jnsku8qcwadL04C1G73O
 lExV20mms9ppJ9WUwWgQtJGqGy2SlJWl+kzD86JHKJJBOo1qRA4KlX7285xHUgUhVXw4/ptc
 YeG3KG0OOuiz1racO3LBn/zuRNQvJzaWVrNj0y5qQ//IFY/XeB+XNrdV5t+PjugndzMnX944
 +yQ3f5o+3NPh1Sza9BG9dXUN60Mh5d8yBb533nOE+6+H14aKrtK801nK4cR/xt2flgQZDfEP
 vPZV/9B668HoY/abcYf2/BjXq3GmHz1sPp9Zo6PMej5mL2ky8/8BbFL4/JYEAAA=
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
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
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
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

DQpPbiBXZWQsIDIwMTktMTEtMDYgYXQgMTM6MDggKzAxMDAsIFNlYmFzdGlhbiBSZWljaGVsIHdy
b3RlOg0KPiBIaSwNCj4gDQo+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDEwOjUxOjA2QU0gKzAy
MDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiBUaGUgcGF0Y2ggc2VyaWVzIGFkZHMgZGVm
aW5pdGlvbnMgZm9yIEdQSU8gbGluZSBkaXJlY3Rpb25zLg0KPiA+IA0KPiA+IEZvciBvY2Nhc2lv
bmFsIEdQSU8gY29udHJpYnV0b3IgbGlrZSBtZSBpdCBpcyBhbHdheXMgYSBwYWluIHRvDQo+ID4g
cmVtZW1iZXINCj4gPiB3aGV0aGVyIDEgb3IgMCB3YXMgdXNlZCBmb3IgR1BJTyBkaXJlY3Rpb24g
SU5QVVQvT1VUUFVULg0KPiANCj4gTWF5YmUgYWxzbyB1cGRhdGUgdGhlIEdQSU8gZHJpdmVycyBp
biBwaW5jdHJsPw0KPiANCj4gJCBnaXQgZ3JlcCAtbCBncGlvX2dldF9kaXJlY3Rpb24gZHJpdmVy
cy9waW5jdHJsDQo+IGRyaXZlcnMvcGluY3RybC9iY20vcGluY3RybC1iY20yODM1LmMNCj4gZHJp
dmVycy9waW5jdHJsL2JjbS9waW5jdHJsLWlwcm9jLWdwaW8uYw0KPiBkcml2ZXJzL3BpbmN0cmwv
aW50ZWwvcGluY3RybC1iYXl0cmFpbC5jDQo+IGRyaXZlcnMvcGluY3RybC9pbnRlbC9waW5jdHJs
LWNoZXJyeXZpZXcuYw0KPiBkcml2ZXJzL3BpbmN0cmwvaW50ZWwvcGluY3RybC1pbnRlbC5jDQo+
IGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24uYw0KPiBkcml2ZXJz
L3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1wYXJpcy5jDQo+IGRyaXZlcnMvcGluY3RybC9tdmVi
dS9waW5jdHJsLWFybWFkYS0zN3h4LmMNCj4gZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtYW1kLmMN
Cj4gZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtYXQ5MS5jDQo+IGRyaXZlcnMvcGluY3RybC9waW5j
dHJsLWF4cDIwOS5jDQo+IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLWluZ2VuaWMuYw0KPiBkcml2
ZXJzL3BpbmN0cmwvcGluY3RybC1vY2Vsb3QuYw0KPiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1v
eG5hcy5jDQo+IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXBpYzMyLmMNCj4gZHJpdmVycy9waW5j
dHJsL3BpbmN0cmwtcGlzdGFjaGlvLmMNCj4gZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtcms4MDUu
Yw0KPiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1yb2NrY2hpcC5jDQo+IGRyaXZlcnMvcGluY3Ry
bC9waW5jdHJsLXJ6YTEuYw0KPiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdC5jDQo+IGRyaXZl
cnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMNCj4gZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3gx
NTB4LmMNCj4gZHJpdmVycy9waW5jdHJsL3Fjb20vcGluY3RybC1tc20uYw0KPiBkcml2ZXJzL3Bp
bmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jDQo+IGRyaXZlcnMvcGluY3RybC92dDg1MDAvcGlu
Y3RybC13bXQuYw0KDQpPdWNoLiBJIGRpZG4ndCBjaGVjayBmcm9tIHBpbmN0cmwgYnV0IEkgc2Vl
IHRob3NlIHNob3VsZCBiZSBjb252ZXJ0ZWQNCmFzIHdlbGwuIEknbSBhIGJpdCBzaG9ydCBvbiB0
aW1lIHJpZ2h0IG5vdyBzbyBpZiBhbnlvbmUgZWxzZSBpcw0KaW50ZXJlc3RlZCBJIHdvbid0IG1p
bmQgOikNCg0KTHVja2lseSB0aGUgdmFsdWUgZm9yIElOIGFuZCBPVVQgaXMgbm90IGNoYW5nZWQg
LSBvbmx5IHRoZSBkZWZpbmVzIHdlcmUNCmFkZGVkIC0gc28gYWxsIG9mIHRoZSBkcml2ZXJzIGRv
IG5vdCBuZWVkIHRvIGJlIGRvbmUgYXQgb25jZS4gSWYgbm8gb25lDQplbHNlIHdpbGwgdGFrZSB0
aGUgcGluY3RybCBwYXJ0IHRoZW4gSSBjYW4gcHJvYmFibHkgZG8gcGluY3RybCBwYXRjaGVzDQpm
b3IgdjUuNiBjeWNsZS4NCg0KQnIsDQoJTWF0dGkgVmFpdHRpbmVuDQo=

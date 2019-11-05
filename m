Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D35F2B2C
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 10:48:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477z9G4mdgzF22J
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Nov 2019 20:48:02 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fi.rohmeurope.com (client-ip=178.15.145.194;
 helo=mailgate1.rohmeurope.com;
 envelope-from=prvs=12120c2122=matti.vaittinen@fi.rohmeurope.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fi.rohmeurope.com
Received: from mailgate1.rohmeurope.com (mailgate1.rohmeurope.com
 [178.15.145.194])
 by lists.ozlabs.org (Postfix) with ESMTP id 476qQB1TPXzF4pp
 for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Nov 2019 23:55:04 +1100 (AEDT)
X-AuditID: c0a8fbf4-183ff70000001fa6-d4-5dc171253a3c
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com
 [192.168.251.177])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 D5.26.08102.52171CD5; Tue,  5 Nov 2019 13:55:01 +0100 (CET)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Tue, 5 Nov 2019 13:54:56 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 00/62] Add definition for GPIO direction
Thread-Topic: [PATCH 00/62] Add definition for GPIO direction
Thread-Index: AQHVk8EYmzhgkSAfS0Ot5MRDeZesqad8bpwAgAAJlQA=
Date: Tue, 5 Nov 2019 12:54:55 +0000
Message-ID: <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
In-Reply-To: <20191105122042.GO32742@smile.fi.intel.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <420D690570F7144C83BFECFDF3CB5C7A@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tb0wTZxjfe/f2eoDdjgrjBTWL3cyGi4pmH54szLBPO//ESZYsyxLCDrlR
 JrSsfxZc5oaic5R1owoBK+DWQChFttFiNisodMwhjgGDIgQYkpYpJBYXMAoI7o5O4dP97vn9
 ez48L0uri9kENltnEg06IUfDROI252LTti0ft6clTZ9IhqbgDQQDfT4KvP0sWI+XU1B8r5yG
 RutvGOaqujAMnHQjuGr9lYaFUIcSJvxvQ30phuFjlylY7Fmi4YTdgcFVdgnDpCdAQemjOgrc
 gUEFFDb8SYPn/CMEloV6Gvq9lQycq/kWw9iYC8HFqRAFlsGgAorm7AzcabypgM6a+wgm6isx
 VNZ2YqhealRAaOo9uOL5g4LZmasKaL99F0NfRQ8Nk2c9DCz97MZwqn5AkjUEEfTOD1NwpzkO
 Rj0eBVRcuIxg3luNYcR2BoF1ppaB1r9nUcou3n/Kq+R/mj3O8DNDJ5W8fbyb4SsWHZj3tiXw
 xbM+mr9kH1Pyff9eo3m3q4jhRwdbGL76eirvqfmC76n4HvEl9+5K44e16ODG96OSMwTTJ+9k
 Z+l27P4gShtqmqTyQlvzH18IUgXoVqIFRbCEe43YBuuxBUWyas6PyHyjUxH++R2RsuUppQWx
 LMMlE8uwUjbEcPvIQmgIyRqaC8SSQUchJRPrJc2NQicKi94gDeMeJoxfJ7YhPy1jzL1Eyrq7
 VrCKO0BGrPYVjZozEud9/0pBBAfE9lfbSg7iNpGigtBKPs3FEfc/DxThrTlS09JDh3EsmQos
 /z/XkNb5CSzvTHOJ5EfvjrA1hZT2luEw3kxKiyeU4RWiyfWzQVyCnrevabCvuu1r3PY1bvsa
 93dI4UIkV8jOyRJM4s7tBtG83aDX5kqfQ/pcNwof99wv6LFvjw9RLPKheJbSxKr2ZrenqZ/N
 0Gce0QpGbbrBnCMafYiwtCZG1VfRmqZWZQpHPhUN+ifUBhZr4lQvT9jS1JzcdVgU80TDE3Yj
 y2qIKj1PCo02iFli/ofZOaZVmmIj5PDIhBijqMsUDYLZpE2X7yPdKB2ITK2Teh16ya4y5gm5
 0jRs7UKvsiVTVQ6a7aiqddBqrNPrxIQ4lTtHknKyVGvWPS2aRnEs0qxXjcpB66QX/jRnWqqg
 pIr9gStyhUlYpRIKUNIsXjqQJu4rXLRRveabuP0F17hqcdq5u8lX9w377oOvut90ld+K//Lw
 GPnoUFB7+3PjwyRzvt1/7tgPeY3bDuRWTqdGpXy9KbFoT8vI0eXPFOXzz9Utec7Hjy5svvjW
 6dQz0c7YjozT/T1mzYudrxzde63ZvWU44Oxt2N+y65nmDV6rBhu1ws6ttMEo/AcOj0GOngQA
 AA==
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

SGVsbG8gQW5keSwNCg0KT24gVHVlLCAyMDE5LTExLTA1IGF0IDE0OjIwICswMjAwLCBBbmR5IFNo
ZXZjaGVua28gd3JvdGU6DQo+IE9uIFR1ZSwgTm92IDA1LCAyMDE5IGF0IDEyOjA5OjEwUE0gKzAy
MDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiBUaGUgcGF0Y2ggc2VyaWVzIGFkZHMgZGVm
aW5pdGlvbnMgZm9yIEdQSU8gbGluZSBkaXJlY3Rpb25zLg0KPiA+IA0KPiA+IEZvciBvY2Nhc2lv
bmFsIEdQSU8gY29udHJpYnV0b3IgbGlrZSBtZSBpdCBpcyBhbHdheXMgYSBwYWluIHRvDQo+ID4g
cmVtZW1iZXINCj4gPiB3aGV0aGVyIDEgb3IgMCB3YXMgdXNlZCBmb3IgR1BJTyBkaXJlY3Rpb24g
SU5QVVQvT1VUUFVULiBKdWRnaW5nDQo+ID4gdGhlDQo+ID4gZmFjdCB0aGF0IEkgcmVtb3ZlZCBm
ZXcgY29tbWVudHMgbGlrZToNCj4gPiANCj4gPiAvKiBSZXR1cm4gMCBpZiBvdXRwdXQsIDEgaWYg
aW5wdXQgKi8NCj4gPiAvKiBUaGlzIG1lYW5zICJvdXQiICovDQo+ID4gcmV0dXJuIDE7IC8qIGlu
cHV0ICovDQo+ID4gcmV0dXJuIDA7IC8qIG91dHB1dCAqLw0KPiA+IA0KPiA+IGl0IHNlZW1zIGF0
IGxlYXN0IHNvbWUgb3RoZXJzIG1heSBmaW5kIGl0IGhhcmQgdG8gcmVtZW1iZXIgdG9vLg0KPiA+
IEFkZGluZw0KPiA+IGRlZmluZXMgZm9yIHRoZXNlIHZhbHVlcyBoZWxwcyB1cyB3aG8gcmVhbGx5
IGhhdmUgZ29vZCAtIGJ1dCBzaG9ydA0KPiA+IGR1cmF0aW9uIC0gbWVtb3J5IDpdDQo+ID4gDQo+
ID4gUGxlYXNlIGFsc28gc2VlIHRoZSBsYXN0IHBhdGNoLiBJdCBhZGRzIHdhcm5pbmcgcHJpbnRz
IHRvIGJlDQo+ID4gZW1pdHRlZA0KPiA+IGZyb20gZ3Bpb2xpYiBpZiBvdGhlciB0aGFuIGRlZmlu
ZWQgdmFsdWVzIGFyZSB1c2VkLiBUaGlzIHBhdGNoIGNhbg0KPiA+IGJlDQo+ID4gZHJvcHBlZCBv
dXQgaWYgdGhlcmUgaXMgYSByZWFzb24gZm9yIHRoYXQgdG8gc3RpbGwgYmUgYWxsb3dlZC4NCj4g
PiANCj4gPiBUaGlzIGlkZWEgY29tZXMgZnJvbSBSRkMgc2VyaWVzIGZvciBST0hNIEJENzE4Mjgg
UE1JQyBhbmQgd2FzDQo+ID4gaW5pdGlhbGx5DQo+ID4gZGlzY3Vzc2VkIHdpdGggTGludXMgV2Fs
bGVpaiBoZXJlOg0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYzA2NzI1YzNkZDM0
MTE4YTMyNDkwNzEzNzc1OGQ4Yjg1YjNkNDA0My5jYW1lbEBmaS5yb2htZXVyb3BlLmNvbS8NCj4g
PiBidXQgYXMgdGhpcyBoYXMgbm8gZGVwZW5kZW5jaWVzIHRvIEJENzE4Mjggd29yayAod2hpY2gg
cHJvYmFibHkNCj4gPiB0YWtlcyBhDQo+ID4gd2hpbGUpIEkgZGVjaWRlZCB0byBtYWtlIGl0IGlu
ZGVwZW5kZW50IHNlcmllcy4NCj4gPiANCj4gPiBQYXRjaGVzIGFyZSBjb21waWxlLXRlc3RlZCBv
bmx5LiBJIGhhdmUgbm8gSFcgdG8gcmVhbGx5IHRlc3QgdGhlbS4NCj4gPiBUaHVzIEknZA0KPiA+
IGFwcHJlY2lhdGUgY2FyZWZ1bGwgcmV2aWV3LiBUaGlzIHdvcmsgaXMgbWFpbmx5IGFib3V0IGNv
bnZlcnRpbmcNCj4gPiB6ZXJvcw0KPiA+IGFuZCBvbmVzIHRvIHRoZSBuZXcgZGVmaW5lcyBidXQg
aXQgd291bGRuJ3QgYmUgZmlyc3QgdGltZSBJIGdldCBpdA0KPiA+IHdyb25nDQo+ID4gaW4gb25l
IG9mIHRoZSBwYXRjaGVzIDopDQo+IA0KPiBGb3IgYWxsIHBhdGNoZXMgSSBoYXZlIGJlZW4gQ2Mn
ZWQgdG8sIE5BSy4NCj4gDQo+IEkgZG9uJ3Qgc2VlIHRoZSBhZHZhbnRhZ2VzIG5vdyBzaW5jZSBh
bGwga25vd24gaGFyZHdhcmUgdXNlcyB0aGUNCj4gc2luZ2xlIGJpdCB0bw0KPiBkZXNjcmliZSBk
aXJlY3Rpb24gKGV2ZW4gZm9yIEludGVsIHdoZXJlIHdlIGhhdmUgc2VwYXJhdGUgZ2F0aW5nIGZv
cg0KPiBpbiBhbmQgb3V0DQo+IGJ1ZmZlcnMgdGhlIGRpcmVjdGlvbiB3ZSBiYXNpY2FsbHkgcmVs
eSBvbiB0aGUgYml0IHRoYXQgZW5hYmxlcyBvdXQNCj4gYnVmZmVyKS4NCj4gDQo+IFNvLCB0aGF0
IHNhaWQgdGhlIGRpcmVjdGlvbiBpcyBhbHdheXMgMSBiaXQgYW5kIGJhc2ljYWxseSAwLzEgdmFs
dWUuIA0KDQpZZXMuIEF0IGxlYXN0IGZvciBub3cuIEFuZCB0aGlzIHBhdGNoIGRpZG4ndCBjaGFu
Z2UgdGhhdCBhbHRob3VnaCBpdA0KbWFrZXMgaXQgcG9zc2libGUgdG8gZG8gc28gaWYgcmVxdWly
ZWQuDQoNCj4gV2hpY2ggb25lDQo+IGlzIGluIGFuZCB3aGljaCBvbmUgaXMgb3V0IGp1c3QgYSBt
YXR0ZXIgb2YgYW4gYWdyZWVtZW50IHdlIGRpZC4NCg0KVGhpcyBvbmUgaXMgZXhhY3RseSB0aGUg
cHJvYmxlbSBwYXRjaCBzZXJpZXMgd2FzIGNyZWF0ZWQgZm9yLiBXaGljaCBvbmUNCmlzIElOIGFu
ZCB3aGljaCBpcyBPVVQgaXMgaW5kZWVkIGEgbWF0dGVyIG9mIGFuIGFncmVlbWVudCAtIGJ1dCB0
aGlzDQphZ3JlZW1lbnQgc2hvdWxkIGJlIGNsZWFybHkgdmlzaWJsZSwgd2VsbCBkZWZpbmVkIGFu
ZCBzYW1lIGZvciBhbGwuDQoNCkl0J3MgKmFubm95aW5nKiB0byB0cnkgZmluZGluZyBvdXQgd2hl
dGhlciBpdCB3YXMgMSBvciAwIG9uZSBzaG91bGQNCnJldHVybiBmcm9tIGdldF9kaXJlY3Rpb24g
Y2FsbGJhY2sgZm9yIE9VVFBVVC4gVGhpcyBpcyBwcm9iYWJseSB0aGUNCnJlYXNvbiB3ZSBoYXZl
IGNvbW1lbnRzIGxpa2UNCg0KcmV0dXJuIDE7IC8qIGlucHV0ICovDQoNCnRoZXJlLg0KDQpBcyB0
aGlzIGlzIGdsb2JhbCBhZ3JlZW1lbnQgZm9yIGFsbCBHUElPIGZyYW1ld29yayB1c2VycyAtIG5v
dA0Kc29tZXRoaW5nIHRoYXQgY2FuIGJlIGFncmVlZCBwZXIgZHJpdmVyIGJhc2lzIC0gd2Ugc2hv
dWxkIGhhdmUgR1BJTw0KZnJhbWV3b3JrIHdpZGUgZGVmaW5pdGlvbnMgZm9yIHRoaXMuIFdlIGNh
biBqdXN0IGFkZCBkZWZpbml0aW9ucyBmb3INCm5ldyBkcml2ZXJzIHRvIGJlbmVmaXQgLSBidXQg
SSB0aGluayBhZGRpbmcgdGhlbSBhbHNvIGZvciBleGlzdGluZw0KZHJpdmVycyBpbXByb3ZlcyBy
ZWFkYWJpbGl0eSBzaWduaWZpY2FudGx5IChzZWUgYmVsb3cpLg0KDQo+IEkgd291bGQgYWxzbyBs
aWtlIHRvIHNlZSBibG9hdC1vLW1ldGVyIHN0YXRpc3RpY3MgYmVmb3JlIGFuZCBhZnRlcg0KPiB5
b3VyIHBhdGNoLg0KPiBNeSBndXRzIHRlbGwgbWUgdGhhdCB0aGUgcmVzdWx0IHdpbGwgYmUgbm90
IGluIHRoZSBmYXZvdXIgb2YgeW91cnMNCj4gc29sdXRpb24uDQoNCkNhbiB5b3UgcGxlYXNlIHRl
bGwgbWUgd2hhdCB0eXBlIG9mIHN0YXRzIHlvdSBob3BlIHRvIHNlZT8gSSBjYW4gdHJ5DQpnZW5l
cmF0aW5nIHdoYXQgeW91IGFyZSBhZnRlci4gVGhlIGNvdmVyIGxldHRlciBjb250YWluZWQgdHlw
aWNhbCArLy0NCmNoYW5nZSBzdGF0cyBmcm9tIGdpdCBhbmQgc3VtbWFyeToNCg0KNjIgZmlsZXMg
Y2hhbmdlZCwgMjI4IGluc2VydGlvbnMoKyksIDEwNCBkZWxldGlvbnMoLSkNCg0KSXQgc3VyZSBz
aG93cyB0aGF0IGFtb3VudCBvZiBsaW5lcyB3YXMgaW5jcmVhc2VkIChyb3VnaGx5IDIgbGluZXMg
bW9yZQ0KLyBjaGFuZ2VkIGZpbGUpIC0gYnV0IEkgZ3Vlc3MgdGhhdCB3YXMgZXhwZWN0ZWQgYXMg
SSBkb24ndCBsaWtlDQp0ZXJuYXJ5LiBTbyBwcmV0dHkgbXVjaCBlYWNoDQoNCnJldHVybiAhIWZv
bzsNCg0Kd2FzIGNoYW5nZWQgdG8NCg0KaWYgKGZvbykNCglyZXR1cm4gR1BJT19MSU5FX0RJUkVD
VElPTl9JTjsNCg0KcmV0dXJuIEdQSU9fTElORV9ESVJFQ1RJT05fT1VUOw0KDQpGb3IgbWUgKGFu
ZCBob3BlZnVsbHkgb3RoZXJzIHdobyBkb24ndCByZW1lbWJlciB3aGV0aGVyIDEgaXMgSU4gb3Ig
T1VUKQ0KdGhpcyBpcyBpbXByb3ZlZCByZWFkYWJpbGl0eSB3aGlsZSBibG9hdC1mYWN0b3IgaXMg
c3RpbGwgcHJldHR5IGxvdy4NCg0KRnJvbQ0KDQpyZXR1cm4gISFmb287DQoNCm9uZSBkb2VzIG5v
dCBrbm93IHdoYXQgdGhlIGZvbyBzaG91bGQgYmUgZm9yIElOIG9yIE9VVCB3aXRob3V0IHJlYWRp
bmcNCnNvbWUgc3BlYyBvciBicm93c2luZyB0aHJvdWdoIGNvbW1lbnRzLiBGcm9tIGxhdHRlciBp
dCBpcyBvYnZpb3VzIHRoYXQNCmlmIGZvbyBpcyB6ZXJvIHRoZSBkaXJlY3Rpb24gaXMgb3V0cHV0
Lg0KDQpCciwNCglNYXR0aQ0K

Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095A6AD9A7
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 09:55:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW8Rp6ZRDz3cP0
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Mar 2023 19:55:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aZQXG646;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZuAKNjDQ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aZQXG646;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZuAKNjDQ;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW8Rf3gwmz3c6V
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Mar 2023 19:55:42 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C1E131FE10;
	Tue,  7 Mar 2023 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678179330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jJvuxY7Q7W6lr3F8/22gRy6xoHYvuDzzJyI4xHrBvJ8=;
	b=aZQXG646NFuCeHIVNdmR0IYLUoqoqogIprpnNa+O+tbbsz3wdnRf+hQ73i32cVtbUXjvfx
	7mYOpPPi02h9Z+pwpWgzAe2xfFRt9MHZJAk3Lb0TYuiIORnHpKfio1Kt2BkTDe6ZwrrCbm
	QTBuUuscgkiSMBDgIipq+1c+aP0MPow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678179330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jJvuxY7Q7W6lr3F8/22gRy6xoHYvuDzzJyI4xHrBvJ8=;
	b=ZuAKNjDQx5UiCYwiTcriSna9rcRvvy1+YnwXmOHQkvzQyiEEPFFiBaaAoV6yzz2b2krWgH
	6y1OYHiJIBbbADBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1987013440;
	Tue,  7 Mar 2023 08:55:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hApkBQL8BmRrKAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Mar 2023 08:55:30 +0000
Message-ID: <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
Date: Tue, 7 Mar 2023 09:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 00/22] drm/dma-helper: Add dedicated fbdev emulation
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0AKPEWDCojFXq3Qt40ngMipB"
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
Cc: linux-aspeed@lists.ozlabs.org, edmund.j.dea@intel.com, alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, anitha.chrisanthus@intel.com, festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, samuel@sholland.org, airlied@gmail.com, javierm@redhat.com, jernej.skrabec@gmail.com, linux-imx@nxp.com, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev, p.zabel@pengutronix.de, daniel@ffwll.ch, raphael.gallais-pou@foss.st.com, martin.blumenstingl@googlemail.com, s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, laurentiu.palcu@oss.nxp.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, hyun.kwon@xilinx.com, tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com, philippe.cornu@foss.st.com, kernel@pengutronix.de, khilman@baylibre.com, shawnguo@kernel.org, l.stach@pengutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0AKPEWDCojFXq3Qt40ngMipB
Content-Type: multipart/mixed; boundary="------------BEwAduE2kZD6RTHO5irLjcAJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch, andrew@aj.id.au,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, p.zabel@pengutronix.de, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, alain.volmat@foss.st.com,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, jernej.skrabec@gmail.com, samuel@sholland.org,
 jyri.sarha@iki.fi, tomba@kernel.org, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev
Message-ID: <0e789778-03ca-e3cb-9c94-e8b55573894c@suse.de>
Subject: Re: [PATCH 00/22] drm/dma-helper: Add dedicated fbdev emulation
References: <20230301153101.4282-1-tzimmermann@suse.de>
 <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>
In-Reply-To: <CACRpkdawSQsNqKJkSSoSw3HmMHyNXFUywxkdszpTC-a_uZA+tQ@mail.gmail.com>

--------------BEwAduE2kZD6RTHO5irLjcAJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDMuMjMgdW0gMjM6MTkgc2NocmllYiBMaW51cyBXYWxsZWlqOg0KPiBP
biBXZWQsIE1hciAxLCAyMDIzIGF0IDQ6MzHigK9QTSBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPj4gQWRkIGZiZGV2IGVtdWxhdGlvbiB0
aGF0IGlzIG9wdGltaXplZCBmb3IgRE1BIGhlbHBlcnMsIGFzIHVzZWQgYnkgbW9zdA0KPj4g
ZHJpdmVycy4gSXQgb3BlcmF0ZXMgZGlyZWN0bHkgb24gR0VNIERNQSBidWZmZXJzIGluIHN5
c3RlbSBtZW1vcnkuDQo+PiBNZW1vcnkgcGFnZXMgYXJlIG1tYXAnZWQgZGlyZWN0bHkgdG8g
dXNlcnNwYWNlLiBObyBpbXBsaWNpdCBzaGFkb3cNCj4+IGJ1ZmZlcnMgbmVlZCB0byBiZSBh
bGxvY2F0ZWQ7IGFzIGNhbiBoYXBwZW4gd2l0aCB0aGUgZ2VuZXJpYyBmYmRldg0KPj4gZW11
bGF0aW9uLiBDb252ZXJ0IGRyaXZlcnMgdGhhdCBmdWxmaWwgdGhlIHJlcXVpcmVtZW50cy4N
Cj4+DQo+PiBUZXN0ZWQgd2l0aCBmYmNvbiBhbmQgSUdUIG9uIHZjNC4NCj4+DQo+PiBGdXR1
cmUgZGlyZWN0aW9uOiBwcm92aWRpbmcgYSBkZWRpY2F0ZWQgZmJkZXYgZW11bGF0aW9uIGZv
ciBHRU0gRE1BDQo+PiBoZWxwZXJzIHdpbGwgYWxsb3cgdXMgdG8gcmVtb3ZlIHRoaXMgY2Fz
ZSBmcm9tIHRoZSBnZW5lcmljIGZiZGV2IGNvZGUuDQo+PiBUaGUgbGF0dGVyIGNhbiB0aGVu
IGJlIHNpbXBsaWZpZWQuDQo+IA0KPiAxKSBJIGxvdmUgeW91ciB3b3JrLg0KDQpUaGFuayB5
b3UuIDopDQoNCj4gDQo+IDIpIFdoeSBpc24ndCB0aGlzIERSTSBkcml2ZXIgY2hhbmdlZD8N
Cj4gZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYw0KPiBBRkFJQ1QgaXQgYWxzbyB1
c2VzIEdFTSBidWZmZXJzIGluIHN5c3RlbSBtZW1vcnkuDQoNClRoaXMgZHJpdmVyIHJlcXVp
cmVzIGRhbWFnZSBoYW5kbGluZw0KDQogDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9s
aW51eC92Ni4yL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jI0w5Nw0K
DQpmb3Igd2hpY2ggd2UgaGF2ZSB0byBjYWxsIHRoZSBmcmFtZWJ1ZmZlcidzIGRpcnR5IGNh
bGxiYWNrDQoNCiANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjIvc291
cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jI0wyODUN
Cg0KYWZ0ZXIgZWFjaCB3cml0ZS4NCg0KRG9pbmcgdGhpcyB3aXRoIGZiZGV2IGVtdWxhdGlv
biByZXF1aXJlcyB0cmFja2luZyBvZiBtbWFwJ2VkIHBhZ2VzIHZpYSANCmZiZGV2J3MgZGVm
ZXJyZWQtSS9PIG1lY2hhbmlzbXMuIFRoYXQgbWFrZXMgdGhlIGZiZGV2LWVtdWxhdGlvbiBj
b2RlIA0KbW9yZSBjb21wbGV4LiBBRkFJQ1QsIHRoZSBleGlzdGluZyBnZW5lcmljIGZiZGV2
IGVtdWxhdGlvbiBhbHJlYWR5IA0KaW1wbGVtZW50cyB0aGlzIGNhc2UgJ2dvb2QgZW5vdWdo
LicNCg0KPiANCj4gMykgVGhpcyBvbmU6DQo+IGRyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDEx
MV9kcnYuYw0KPiBpcyBhbHNvIHZlcnkgc2ltaWxhciwgYnV0IGNhbiBzb21ldGltZXMgdXNl
IGEgZGVkaWNhdGVkDQo+IFJBTSBtZW1vcnkgZm9yIGFsbG9jYXRpb25zIHVzaW5nIENNQSwg
ZG9lcyB0aGF0IG1ha2UNCj4gaXQgbm90IGEgY2FuZGlkYXRlPw0KDQpUaGFua3MsIEkgdGhp
bmsgSSBzaW1wbHkgbWlzc2VkIHBsMTExLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPiBUaGV5IGFyZW4ndCBtdWNoIGRpZmZlcmVudCBpbiBob3cgdGhleSB3b3JrIGZyb20g
dGhlIFRWRTIwMC4NCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------BEwAduE2kZD6RTHO5irLjcAJ--

--------------0AKPEWDCojFXq3Qt40ngMipB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQG/AEFAwAAAAAACgkQlh/E3EQov+DZ
dRAAwJH7RKJhMWo0NmVD3hLGlh9SV/+0Z6rXXWaT119pdC7Qqd4OeVAiYuj4OXzkQBnO1BAE/OCn
623FCxR3h/X6NHs03QD0Cw9FsUFaw6K44M7a+iJs8C0YWMXlG3uXefcIJYqi3SA7FOd7f8LfriGK
w1fTag5CpmqLKLBtqFQbTuUgc8UrJRR7bmo8Y+kb7HZhPZEW3UGnn93dK+c5aVEM/W92hMP9T+QY
F68SJ9+1s6VnX2c4VzSJW4BRi0ujNDw+5njK127CxTfTL++I2hY6ySC7ygOpN3tnOk1Xq9VD890m
9pNVCGbmpiYWDVGiSZabqLPadf7srknsSYFz2q4Lo/lNNIa9caZ6m2VnUe376US8sipgDvusghPw
Wjja8mOtgsTxLucjXySQd4z85fITbt5KME5/FtEvS23V/qxsbRyLdjUCLgfwzYZx9Ytn8uXFyMR8
MlpkR+pSeujgMLrpSI1JQ7/nOPOkaP2jtKmvqDb7n8h7n0r9vzI7hcNjS88IrQxWC2hSzeyMIPJq
EwwWt4qUA1hGWHyWHN4f4fjyjpAxuJ4sctNiRQ89ZYLG8Z2eEpD9o6h2h35tj+a39UdoNSywO6gM
sxezN515EZlVaY85IrYAjSzRchAdtL6z+rgL8CTpd6FsCzzcY2I8h+JgS5BNX0KhmTojmMCnK3bw
CnY=
=Aoyh
-----END PGP SIGNATURE-----

--------------0AKPEWDCojFXq3Qt40ngMipB--
